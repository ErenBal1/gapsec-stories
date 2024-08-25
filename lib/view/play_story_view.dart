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
  late Map<String, dynamic> left = {};
  late Map<String, dynamic> right = {};
  late List<Map<String, dynamic>> selectedList = [];
  bool textCompleted = false;
  bool isEnable = true;
  final _databaseService = DatabaseService();
  int storyMapId = 0;
  late List repo = [];
  String mp3Path = "assets/sounds/dontLookBack.mp3";
  String selectedTexts = "";
  final ScrollController _scrollController = ScrollController();

  TextEditingController myTextController = TextEditingController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

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

  Map<String, dynamic>? getMapWithId(List<Map<String, dynamic>> list, int id) {
    return list.firstWhere((element) => element["id"] == id);
  }

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
    super.initState();
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
            selectedList = MurderList;

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
      backgroundColor: Colors.blueGrey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(45),
        child: AppBar(
          backgroundColor: Colors.blueGrey[600],
          leading: IconButton(
            onPressed: () async {
              Navigator.pop(
                context,
                PageTransition(
                  child: Container(),
                  type: PageTransitionType.fade,
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: CustomColors.white,
              size: 20,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/default_avatar.png'),
                radius: 18,
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Unknown Number',
                    style: TextStyle(
                      color: CustomColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                              setState(() {
                                textCompleted = true;
                                isEnable = true;
                              });
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

  Future<void> handleStoryProgress(TextType type) async {
    if (myTextController.text.isEmpty) {
      print('Cevap boş');
      return;
    }

    setState(() {
      textCompleted = false;
    });

    await _selectedStoryAddItem(
      eklencekText: myTextController.text,
      type: type,
    );

    if (myTextController.text ==
        assignToOdd(selectedList, storyMapId)!["title"]) {
      updateStoryMapId(left["aId"]);
    } else if (myTextController.text ==
        assignToEven(selectedList, storyMapId)!["title"]) {
      updateStoryMapId(right["aId"]);
    }

    await _selectedStoryUpdate(type: type);
    repo = getCurrentRepo(type);
    myTextController.clear();
    await Future.delayed(const Duration(seconds: 2));

    left = assignToOdd(selectedList, storyMapId)!;
    right = assignToEven(selectedList, storyMapId)!;
    await _selectedStoryAddItem(
      eklencekText: getMapWithId(selectedList, storyMapId)!["history"],
      type: type,
    );
    await _selectedStoryUpdate(type: type);
    repo = getCurrentRepo(type);

    setState(() {
      textCompleted = true;
    });
    _scrollToTop();
  }

  List getCurrentRepo(TextType type) {
    switch (type) {
      case TextType.murderType:
        return _databaseService.murderRepo;
      case TextType.dontLookBackType:
        return _databaseService.dontLookBackRepo;
      case TextType.erenType:
        return _databaseService.erenRepo;
      default:
        return [];
    }
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const OptionButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blueGrey[600],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
