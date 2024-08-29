import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:gapsec/cache/games_storage/games_storage.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:video_player/video_player.dart';

class ChatView extends StatefulWidget {
  final TextType selectedTextType;
  final String story;
  final List selectedRepo;

  const ChatView({
    super.key,
    required this.selectedTextType,
    required this.story,
    required this.selectedRepo,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  late VideoPlayerController mp3controller;
  late Map<String, dynamic> left = {}; // tek olan map
  late Map<String, dynamic> right = {}; //çift olan map
  late List<Map<String, dynamic>> selectedList = [];
  bool textCompleted = false;
  bool isEnable = true;
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

  //Animated textin tamamlandığı hakkında info
  void _changeComplete() {
    textCompleted = !textCompleted;
  }

  void updateStoryMapId(int newId) {
    setState(() {
      storyMapId = newId;
    });
  }

  Map<String, dynamic>? assignToOdd(List<Map<String, dynamic>> list, int id) {
    var item = getMapWithId(list, id);
    if (item != null) {
      var answers = item['answers'] as List<Map<String, dynamic>>;

      // Eğer her iki aId de aynı ise solda tek olmasını istediğimiz için ilk elemanı döndürdüm
      if (answers[0]['aId'] == answers[1]['aId']) {
        return answers[0];
      }

      // aId tek olanı seçiyoruz
      return answers.firstWhere((answer) => answer['aId'] % 2 != 0);
    }
    return null;
  }
  //answer mapini getiren tek için fonksiyon
/*   Map<String, dynamic>? assignToOdd(List<Map<String, dynamic>> list, int id) {
    var item = getMapWithId(list, id);
    if (item != null) {
      var answers = item['answers'] as List<Map<String, dynamic>>;
      return answers.firstWhere((answer) => answer['aId'] % 2 != 0);
    }
    return null;
  } */

  //Answer mapi sağ için
/*   Map<String, dynamic>? assignToEven(List<Map<String, dynamic>> list, int id) {
    var item = getMapWithId(list, id);
    if (item != null) {
      var answers = item['answers'] as List<Map<String, dynamic>>;
      return answers.firstWhere((answer) => answer['aId'] % 2 == 0);
    }
    return null;
  } */
  Map<String, dynamic>? assignToEven(List<Map<String, dynamic>> list, int id) {
    var item = getMapWithId(list, id);
    if (item != null) {
      var answers = item['answers'] as List<Map<String, dynamic>>;

      // Eğer her iki aId de aynı ise sağdaki çift olmasını istediğimiz için ilk elemanı döndürdüm
      if (answers[0]['aId'] == answers[1]['aId']) {
        return answers[1];
      }

      // aId çift olanı seçiyoruz
      return answers.firstWhere((answer) => answer['aId'] % 2 == 0);
    }
    return null;
  }

  @override
  void initState() {
    print(widget.selectedTextType.toString());
    mp3controller = VideoPlayerController.asset(mp3Path)
      ..initialize().then((_) {
        mp3controller.setLooping(true);
        setState(() {
          mp3controller.value.isPlaying
              ? mp3controller.pause()
              : mp3controller.play();
        });
      });

    Future.delayed(const Duration(seconds: 3), () {
      textCompleted = true;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        switch (widget.selectedTextType) {
          case TextType.murderType:
            selectedList = murderDetail;

            await _selectedStoryAddItem(
                eklencekText:
                    getMapWithId(selectedList, storyMapId)!["history"],
                type: TextType.murderType);
            left = assignToOdd(selectedList, storyMapId)!;
            right = assignToEven(selectedList, storyMapId)!;
            await _selectedStoryUpdate(type: TextType.murderType);
            setState(() {
              repo = _databaseService.murderRepo;
            });
            print("left inside => $left");
            print("right inside => $right");
            print("inside repo => $repo");
            print(
                "inside MurderRepo database => ${_databaseService.murderRepo}");
            break;
          default:
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    mp3controller.dispose();
    super.dispose();
  }

  Future<void> _showOkAlertDialogWidget(
      BuildContext context, String message) async {
    final result = await showOkAlertDialog(
      context: context,
      title: 'Tebrikler',
      message: message,
      okLabel: 'OK',
    );
    if (result == OkCancelResult.ok) {
      print("okey");
    }
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
                                    // fontFamily: 'HorrorFont',
                                    color: CustomColors.red,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      selectedTexts.tr(),
                                      style: const TextStyle(fontSize: 14),
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
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    // fontFamily: 'HorrorFont',
                                    color: Colors.green,
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
                    textCompleted == true
                        ? InkWell(
                            onTap: () async {
                              if (textCompleted == true) {
                                setState(() {
                                  isEnable = true;
                                });
                                switch (widget.selectedTextType) {
                                  case TextType.murderType:
                                    setState(() {
                                      textCompleted = false;
                                    });
                                    await _selectedStoryAddItem(
                                        eklencekText: left["title"],
                                        type: TextType.murderType);
                                    updateStoryMapId(left["aId"]);
                                    print("first answerId=> $storyMapId");
                                    //_changeComplete();
                                    ////////////
                                    await _selectedStoryUpdate(
                                        type: TextType.murderType);
                                    repo = _databaseService.murderRepo;
                                    setState(() {});
                                    _scrollToBottom();
                                    await Future.delayed(
                                        const Duration(seconds: 3));
                                    ///////////Bu kısım cevabımızdan sonraki bekleme işlemleri için
                                    left =
                                        assignToOdd(selectedList, storyMapId)!;
                                    right =
                                        assignToEven(selectedList, storyMapId)!;
                                    await _selectedStoryAddItem(
                                        eklencekText: getMapWithId(selectedList,
                                            storyMapId)!["history"],
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
                                      isEnable = false;
                                    });
                                    await _selectedStoryAddItem(
                                        eklencekText: left["title"],
                                        type: TextType.dontLookBackType);
                                    updateStoryMapId(left["aId"]);
                                    print("first answerId=> $storyMapId");

                                    // _changeComplete();
                                    //////////////////
                                    await _selectedStoryUpdate(
                                        type: TextType.dontLookBackType);
                                    repo = _databaseService.dontLookBackRepo;
                                    setState(() {});
                                    _scrollToBottom();
                                    await Future.delayed(
                                        const Duration(seconds: 3));
                                    //////////////////
                                    left =
                                        assignToOdd(selectedList, storyMapId)!;
                                    right =
                                        assignToEven(selectedList, storyMapId)!;
                                    await _selectedStoryAddItem(
                                        eklencekText: getMapWithId(selectedList,
                                            storyMapId)!["history"],
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
                                isEnable = false;
                              });

                              // 2 saniye bekleyip textCompleted'ı tekrar true yap
                              await Future.delayed(const Duration(seconds: 4));
                              if (storyMapId >= 900) {
                                print("hikaye sona geldi");
                                _showOkAlertDialogWidget(
                                    context, "Hikayeyi tamamladınız!");
                                setState(() {
                                  isEnable = false;
                                });
                                //hikaye sona geldiğine dair kullanıcıya etkileşim sağla
                              } else {
                                setState(() {
                                  textCompleted = true;
                                });
                              }
                            },
                            // Sol taraftaki buton
                            child: Container(
                              width: Config.screenWidth! * 0.4,
                              height: Config.screenHeight! * 0.1,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/buttonBack.jpg"),
                                      fit: BoxFit.cover),
                                  color: CustomColors.black.withOpacity(0.95),
                                  border: Border.all(
                                      width: 1,
                                      color:
                                          CustomColors.white.withOpacity(0.5)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: Center(
                                child: Text(
                                  textCompleted == true
                                      ? assignToOdd(
                                          selectedList, storyMapId)!["title"]
                                      : "",
                                  style: const TextStyle(
                                      color: CustomColors.yellow, fontSize: 20),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    SizedBox(
                      //Indicator
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
                    textCompleted == true
                        ? InkWell(
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
                                    await Future.delayed(
                                        const Duration(seconds: 3));
                                    ///////////Bu kısım cevabımızdan sonraki bekleme işlemleri için
                                    left =
                                        assignToOdd(selectedList, storyMapId)!;
                                    right =
                                        assignToEven(selectedList, storyMapId)!;
                                    await _selectedStoryAddItem(
                                        eklencekText: getMapWithId(selectedList,
                                            storyMapId)!["history"],
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
                                      isEnable = false;
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
                                    await Future.delayed(
                                        const Duration(seconds: 3));
                                    //////////////////
                                    left =
                                        assignToOdd(selectedList, storyMapId)!;
                                    right =
                                        assignToEven(selectedList, storyMapId)!;
                                    await _selectedStoryAddItem(
                                        eklencekText: getMapWithId(selectedList,
                                            storyMapId)!["history"],
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
                              if (storyMapId >= 900) {
                                print("hikaye sona geldi");
                                _showOkAlertDialogWidget(
                                    context, "Hikayeyi tamamladınız!");
                                setState(() {
                                  isEnable = false;
                                });
                                //hikaye sona geldiğine dair kullanıcıya etkileşim sağla
                              } else {
                                setState(() {
                                  textCompleted = true;
                                });
                              }
                            },
                            //Sağ taraftaki button
                            child: Container(
                              width: Config.screenWidth! * 0.4,
                              height: Config.screenHeight! * 0.1,
                              decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/buttonBack.jpg"),
                                      fit: BoxFit.cover),
                                  color: CustomColors.black.withOpacity(0.95),
                                  border: Border.all(
                                      width: 1,
                                      color:
                                          CustomColors.white.withOpacity(0.5)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: Center(
                                child: Text(
                                  textCompleted == true
                                      ? assignToEven(
                                          selectedList, storyMapId)!["title"]
                                      : "",
                                  style: const TextStyle(
                                      color: CustomColors.yellow, fontSize: 20),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
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
        ],
      ),
    );
  }
}
