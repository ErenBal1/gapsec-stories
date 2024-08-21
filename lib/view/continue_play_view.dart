import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:page_transition/page_transition.dart';

import 'package:gapsec/cache/games_storage/dont_look_back.dart';
import 'package:gapsec/cache/games_storage/games_storage.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:video_player/video_player.dart';

class ContinueChatView extends StatefulWidget {
  final TextType selectedTextType;
  final String story;
  final List selectedRepo;

  const ContinueChatView({
    super.key,
    required this.selectedTextType,
    required this.story,
    required this.selectedRepo,
  });

  @override
  State<ContinueChatView> createState() => _ContinueChatViewState();
}

class _ContinueChatViewState extends State<ContinueChatView> {
  late VideoPlayerController mp3controller;
  late Map<String, dynamic> left = {}; // tek olan map
  late Map<String, dynamic> right = {}; //çift olan map
  late List<Map<String, dynamic>> selectedList = [];
  bool textCompleted = true;
  int attempt = 0;
  final _databaseService = DatabaseService();
  int storyMapId = 0;
  late List repo = [];
  String mp3Path = "assets/sounds/dontLookBack.mp3";
  String selectedTexts = "";
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  //Ekranı güncellemek için short fonk.
  void _updateScreen() {
    setState(() {});
  }

  Future<void> _selectedStoryUpdate({required TextType type}) async {
    await _databaseService.selectedStoryUpdate(type: type);
    _updateScreen();
  }

  Future<void> _selectedStoryAddItem(
      {required String eklencekText, required TextType type}) async {
    await _databaseService.selectedStoryAdd(
        eklenicekMetin: eklencekText, type: type);
    _updateScreen();
  }

  //istediğimiz id ye sahip mapi getirir
  Map<String, dynamic>? getMapWithId(List<Map<String, dynamic>> list, int id) {
    return list.firstWhere((element) => element["id"] == id);
  }

  //istediğimiz son metne göre mapi getirir
  Map<String, dynamic>? getMapWithName(
      List<Map<String, dynamic>> list, TextType type) {
    switch (type) {
      case TextType.murderType:
        return list.firstWhere((element) =>
            element["history"] ==
            _databaseService.murderRepo.last!.murderTexts.toString());
      case TextType.dontLookBackType:
        return list.firstWhere((element) =>
            element["history"] ==
            _databaseService.dontLookBackRepo.last!.dontLookBackTexts
                .toString());

      default:
    }
    return null;
  }

  //Animated textin tamamlandığı hakkında info
  void _changeComplete() {
    textCompleted = !textCompleted;
  }

  void updateStoryMapId(int newId) {
    setState(() {
      storyMapId = newId;
    });
  }

  Map<String, dynamic>? initToEven(
      List<Map<String, dynamic>> list, TextType type) {
    var item = getMapWithName(list, type);
    if (item != null) {
      var answers = item['answers'] as List<Map<String, dynamic>>;
      return answers.firstWhere((answer) => answer['aId'] % 2 == 0);
    }
    return null;
  }

  Map<String, dynamic>? initToOdd(
      List<Map<String, dynamic>> list, TextType type) {
    var item = getMapWithName(list, type);
    if (item != null) {
      var answers = item['answers'] as List<Map<String, dynamic>>;
      return answers.firstWhere((answer) => answer['aId'] % 2 != 0);
    }
    return null;
  }

  //answer mapini getiren tek için fonksiyon
  Map<String, dynamic>? assignToOdd(List<Map<String, dynamic>> list, int id) {
    var item = getMapWithId(list, id);
    if (item != null) {
      var answers = item['answers'] as List<Map<String, dynamic>>;
      return answers.firstWhere((answer) => answer['aId'] % 2 != 0);
    }
    return null;
  }

  //Answer mapi sağ için
  Map<String, dynamic>? assignToEven(List<Map<String, dynamic>> list, int id) {
    var item = getMapWithId(list, id);
    if (item != null) {
      var answers = item['answers'] as List<Map<String, dynamic>>;
      return answers.firstWhere((answer) => answer['aId'] % 2 == 0);
    }
    return null;
  }

  @override
  void initState() {
    // print(widget.selectedTextType.toString());
    mp3controller = VideoPlayerController.asset(mp3Path)
      ..initialize().then((_) {
        mp3controller.setLooping(true);
        setState(() {
          mp3controller.value.isPlaying
              ? mp3controller.pause()
              : mp3controller.play();
        });
      });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      switch (widget.selectedTextType) {
        case TextType.murderType:
          selectedList = MurderList;
          await _selectedStoryUpdate(type: TextType.murderType);
          left = initToOdd(
            selectedList,
            TextType.murderType,
          )!;
          //  print("left inside => $left");
          right = initToEven(
            selectedList,
            TextType.murderType,
          )!;
          // print("right inside => $right");
          await _selectedStoryUpdate(type: TextType.murderType);
          setState(() {
            repo = _databaseService.murderRepo;
          });

          _scrollToBottom();
          break;
        case TextType.dontLookBackType:
          selectedList = DontLookBackList;
          await _selectedStoryUpdate(type: TextType.dontLookBackType);
          left = initToOdd(
            selectedList,
            TextType.dontLookBackType,
          )!;
          //  print("left inside => $left");
          right = initToEven(
            selectedList,
            TextType.dontLookBackType,
          )!;
          // print("right inside => $right");
          await _selectedStoryUpdate(type: TextType.dontLookBackType);
          setState(() {
            repo = _databaseService.dontLookBackRepo;
          });

          _scrollToBottom();
          break;
        default:
      }
    });
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    mp3controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: Config.screenHeight,
            child: Image.asset(
              "assets/images/cpp.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
              child: Container(
            width: Config.screenWidth! * 0.9,
            height: Config.screenHeight! * 0.8,
            decoration: BoxDecoration(
                color: CustomColors.black.withOpacity(0.3),
                border: Border.all(
                    width: 1, color: CustomColors.white.withOpacity(0.3)),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: ListView.builder(
              //  physics: const NeverScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount: repo.length,
              itemBuilder: (BuildContext context, int index) {
                final NewGame newGame = repo[index];
                switch (widget.selectedTextType) {
                  case TextType.murderType:
                    selectedTexts = newGame.murderTexts.toString();
                    break;
                  case TextType.dontLookBackType:
                    selectedTexts = newGame.dontLookBackTexts.toString();
                    break;

                  default:
                }

                return index.isEven
                    ? Padding(
                        padding: const EdgeInsets.only(
                            right: 50.0, bottom: 20, top: 20),
                        child: Container(
                          //width: 20, //Config.screenWidth! * 0.7,
                          decoration: BoxDecoration(
                            border: const Border(
                                bottom: BorderSide(
                                    color: CustomColors.yellow, width: 2)),
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/systemChat.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: CustomColors.white.withOpacity(0.5),
                          ),
                          //height: Config.screenHeight! * 0.2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DefaultTextStyle(
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'HorrorFont',
                                    color: CustomColors.red,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      selectedTexts.tr(),
                                      style: const TextStyle(fontSize: 30),
                                    ),
                                  ), /* AnimatedTextKit(
                                    onFinished: () {
                                      _changeComplete();
                                      setState(() {});
                                      //tuşlar basılabilir hale gelicek
                                    },
                                    key: ValueKey(selectedTexts),
                                    isRepeatingAnimation: false,
                                    totalRepeatCount: 0,
                                    repeatForever: false,
                                    animatedTexts: [
                                      TyperAnimatedText(selectedTexts,
                                          speed: const Duration(
                                              milliseconds: 150)),
                                    ],
                                  ), */
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Container(
                          //width: 20, //Config.screenWidth! * 0.7,
                          decoration: BoxDecoration(
                            border: const Border(
                                bottom: BorderSide(
                                    color: CustomColors.red, width: 3)),
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/systemChat.jpg"),
                                fit: BoxFit.cover),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            color: CustomColors.red.withOpacity(0.5),
                          ),
                          //height: Config.screenHeight! * 0.2,

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  selectedTexts,
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'HorrorFont',
                                    color: CustomColors.yellow.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          )),
          Positioned(
              bottom: Config.screenHeight! * 0.03,
              left: 0, //Config.screenWidth! * 0.025,
              child: SizedBox(
                width: Config.screenWidth,
                //color: CustomColors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        if (textCompleted == true) {
                          switch (widget.selectedTextType) {
                            case TextType.murderType:
                              setState(() {
                                textCompleted = false;
                              });
                              await _selectedStoryAddItem(
                                  eklencekText: left["title"],
                                  type: TextType.murderType);
                              updateStoryMapId(left["aId"]);
                              //   print("first answerId=> $storyMapId");
                              //_changeComplete();
                              ////////////
                              await _selectedStoryUpdate(
                                  type: TextType.murderType);
                              repo = _databaseService.murderRepo;
                              setState(() {});
                              _scrollToBottom();
                              await Future.delayed(const Duration(seconds: 3));
                              ///////////Bu kısım cevabımızdan sonraki bekleme işlemleri için
                              left = assignToOdd(selectedList, storyMapId)!;
                              right = assignToEven(selectedList, storyMapId)!;
                              await _selectedStoryAddItem(
                                  eklencekText: getMapWithId(
                                      selectedList, storyMapId)!["history"],
                                  type: TextType.murderType);
                              await _selectedStoryUpdate(
                                  type: TextType.murderType);
                              repo = _databaseService.murderRepo;
                              setState(() {});
                              _scrollToBottom();
                              break;
                            case TextType.dontLookBackType:
                              setState(() {
                                textCompleted = false;
                              });
                              await _selectedStoryAddItem(
                                  eklencekText: left["title"],
                                  type: TextType.dontLookBackType);
                              updateStoryMapId(left["aId"]);
                              //   print("first answerId=> $storyMapId");
                              // _changeComplete();
                              //////////////////
                              await _selectedStoryUpdate(
                                  type: TextType.dontLookBackType);
                              repo = _databaseService.dontLookBackRepo;
                              setState(() {});
                              _scrollToBottom();
                              await Future.delayed(const Duration(seconds: 3));
                              //////////////////
                              left = assignToOdd(selectedList, storyMapId)!;
                              right = assignToEven(selectedList, storyMapId)!;
                              await _selectedStoryAddItem(
                                  eklencekText: getMapWithId(
                                      selectedList, storyMapId)!["history"],
                                  type: TextType.dontLookBackType);
                              await _selectedStoryUpdate(
                                  type: TextType.dontLookBackType);
                              repo = _databaseService.dontLookBackRepo;
                              setState(() {});
                              _scrollToBottom();
                              break;

                            default:
                          }
                        }
                        setState(() {
                          textCompleted = false;
                        });

                        // 2 saniye bekleyip textCompleted'ı tekrar true yap
                        await Future.delayed(const Duration(seconds: 4));
                        setState(() {
                          textCompleted = true;
                        });
                        attempt++;
                      },
                      // Sol taraftaki buton
                      child: Container(
                        width: Config.screenWidth! * 0.4,
                        height: Config.screenHeight! * 0.1,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/buttonBack.jpg"),
                                fit: BoxFit.cover),
                            color: CustomColors.black.withOpacity(0.95),
                            border: Border.all(
                                width: 1,
                                color: CustomColors.white.withOpacity(0.5)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Center(
                          child: Text(
                            textCompleted == true
                                ? attempt != 0
                                    ? assignToOdd(
                                        selectedList, storyMapId)!["title"]
                                    : initToOdd(selectedList,
                                        widget.selectedTextType)!["title"]
                                : "",
                            style: const TextStyle(
                                color: CustomColors.yellow, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      //color: CustomColors.cyanBlue,
                      width: Config.screenWidth! * 0.15,
                      height: Config.screenHeight! * 0.05,
                      child: Center(
                        child: textCompleted == false
                            ? const LoadingIndicator(
                                indicatorType: Indicator.ballClipRotateMultiple,
                                colors: [
                                  Colors.white,
                                  Colors.yellow,
                                  Colors.black
                                ],
                                strokeWidth: 2,
                              )
                            : null,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (textCompleted == true) {
                          switch (widget.selectedTextType) {
                            case TextType.murderType:
                              setState(() {
                                textCompleted = false;
                              });
                              await _selectedStoryAddItem(
                                  eklencekText: right["title"],
                                  type: TextType.murderType);
                              updateStoryMapId(right["aId"]);
                              // _changeComplete();
                              ////////////
                              await _selectedStoryUpdate(
                                  type: TextType.murderType);
                              repo = _databaseService.murderRepo;
                              setState(() {});
                              _scrollToBottom();
                              await Future.delayed(const Duration(seconds: 3));
                              ///////////Bu kısım cevabımızdan sonraki bekleme işlemleri için
                              left = assignToOdd(selectedList, storyMapId)!;
                              right = assignToEven(selectedList, storyMapId)!;
                              await _selectedStoryAddItem(
                                  eklencekText: getMapWithId(
                                      selectedList, storyMapId)!["history"],
                                  type: TextType.murderType);
                              await _selectedStoryUpdate(
                                  type: TextType.murderType);
                              repo = _databaseService.murderRepo;
                              setState(() {});
                              _scrollToBottom();
                              break;
                            case TextType.dontLookBackType:
                              setState(() {
                                textCompleted = false;
                              });
                              await _selectedStoryAddItem(
                                  eklencekText: right["title"],
                                  type: TextType.dontLookBackType);
                              updateStoryMapId(right["aId"]);
                              //  _changeComplete();
                              //////////////////
                              await _selectedStoryUpdate(
                                  type: TextType.dontLookBackType);
                              repo = _databaseService.dontLookBackRepo;
                              setState(() {});
                              _scrollToBottom();
                              await Future.delayed(const Duration(seconds: 3));
                              //////////////////
                              left = assignToOdd(selectedList, storyMapId)!;
                              right = assignToEven(selectedList, storyMapId)!;
                              await _selectedStoryAddItem(
                                  eklencekText: getMapWithId(
                                      selectedList, storyMapId)!["history"],
                                  type: TextType.dontLookBackType);
                              await _selectedStoryUpdate(
                                  type: TextType.dontLookBackType);
                              repo = _databaseService.dontLookBackRepo;
                              setState(() {});
                              _scrollToBottom();
                              break;
                            default:
                          }
                        }
                        setState(() {
                          textCompleted = false;
                        });

                        // 2 saniye bekleyip textCompleted'ı tekrar true yap
                        await Future.delayed(const Duration(seconds: 3));
                        setState(() {
                          textCompleted = true;
                        });
                        attempt++;
                      },
                      //Sağ taraftaki button
                      child: Container(
                        width: Config.screenWidth! * 0.4,
                        height: Config.screenHeight! * 0.1,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image:
                                    AssetImage("assets/images/buttonBack.jpg"),
                                fit: BoxFit.cover),
                            color: CustomColors.black.withOpacity(0.95),
                            border: Border.all(
                                width: 1,
                                color: CustomColors.white.withOpacity(0.5)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: Center(
                          child: Text(
                            textCompleted == true
                                ? attempt != 0
                                    ? assignToEven(
                                        selectedList, storyMapId)!["title"]
                                    : initToEven(selectedList,
                                        widget.selectedTextType)!["title"]
                                : "",
                            style: const TextStyle(
                                color: CustomColors.yellow, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            top: Config.screenHeight! * 0.05,
            left: Config.screenWidth! * 0.03,
            child: Observer(
              builder: (_) => IconButton(
                onPressed: () async {
                  Navigator.pop(
                      context,
                      PageTransition(
                        child: Container(),
                        type: PageTransitionType.fade,
                      ));
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: CustomColors.white,
                ),
              ),
            ),
          ),
          /* Positioned(
              right: Config.screenWidth! * 0.03,
              top: Config.screenHeight! * 0.05,
              child: IconButton(
                  onPressed: _deleteListElements,
                  icon: const Icon(
                    Icons.refresh_outlined,
                    color: CustomColors.white,
                  ))) */
        ],
      ),
    );
  }
}
