import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/cache/games_storage/dont_look_back.dart';
import 'package:gapsec/cache/games_storage/games_storage.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:page_transition/page_transition.dart';

import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';

class ChatView extends StatefulWidget {
  final String story;
  const ChatView({
    super.key,
    required this.story,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  late Map<String, dynamic> left = {}; // tek olan map
  late Map<String, dynamic> right = {}; //çift olan map
  late List<Map<String, dynamic>> selectedList = [];
  late String selectedStory = widget.story;
  bool textCompleted = false;
  final _databaseService = DatabaseService();
  int storyMapId = 0;

  //Ekranı güncellemek için short fonk.
  void _updateScreen() {
    setState(() {});
  }

  //Chat kısmındaki güncel listeyi önce çeker sonra ekranı günceller
  Future<void> _getUpdatedList() async {
    await _databaseService.getUpdatedList();
    _updateScreen();
  }

  Future<void> _deleteListElements() async {
    await _databaseService.deleteListElements();
    _updateScreen();
  }

  Future<void> _addToList(String text) async {
    await _databaseService.addToList(text);
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
    selectedStory = widget.story;
    if (selectedStory == murder.name) {
      selectedList = MurderList;
      _deleteListElements();
      _addToList(getMapWithId(selectedList, storyMapId)!["history"]);
      left = assignToOdd(selectedList, storyMapId)!;
      right = assignToEven(selectedList, storyMapId)!;
    } else if (selectedStory == dontLookBack.name) {
      selectedList = DontLookBackList;
      _deleteListElements();
      _addToList(getMapWithId(selectedList, storyMapId)!["history"]);
      left = assignToOdd(selectedList, storyMapId)!;
      right = assignToEven(selectedList, storyMapId)!;
    }
    _getUpdatedList();
    super.initState();
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
              "assets/images/dark.png",
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
              itemCount: _databaseService.events.length,
              itemBuilder: (BuildContext context, int index) {
                final NewGame newGame = _databaseService.events[index];
                return index.isEven
                    ? Container(
                        //width: 20, //Config.screenWidth! * 0.7,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7)),
                          color: CustomColors.white.withOpacity(0.5),
                        ),
                        height: Config.screenHeight! * 0.2,
                        child: Column(
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
                                child: AnimatedTextKit(
                                  onFinished: () {
                                    _changeComplete();
                                    setState(() {});
                                    //tuşlar basılabilir hale gelicek
                                  },
                                  key: ValueKey(newGame.murderTexts),
                                  isRepeatingAnimation: false,
                                  totalRepeatCount: 1,
                                  animatedTexts: [
                                    TyperAnimatedText(newGame.murderTexts,
                                        speed:
                                            const Duration(milliseconds: 150)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        //width: 20, //Config.screenWidth! * 0.7,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7)),
                          color: CustomColors.red.withOpacity(0.5),
                        ),
                        height: Config.screenHeight! * 0.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              newGame.murderTexts,
                              style: const TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                      );
              },
            ),
          )),
          Positioned(
              bottom: Config.screenHeight! * 0.05,
              left: 0, //Config.screenWidth! * 0.025,
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      if (textCompleted == true) {
                        await _addToList(left["title"]);
                        updateStoryMapId(left["aId"]);
                        print("first answerId=> $storyMapId");
                        _changeComplete();
                        left = assignToOdd(selectedList, storyMapId)!;
                        right = assignToEven(selectedList, storyMapId)!;
                        await _addToList(
                            getMapWithId(selectedList, storyMapId)!["history"]);
                        /* updateStoryMapId(left["aId"]);
                        print("last answerId=> $storyMapId"); */
                      }
                    },
                    child: Container(
                      width: Config.screenWidth! * 0.5,
                      height: Config.screenHeight! * 0.1,
                      decoration: BoxDecoration(
                          color: CustomColors.black.withOpacity(0.95),
                          border: Border.all(
                              width: 1,
                              color: CustomColors.white.withOpacity(0.5)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Center(
                        child: Text(
                          textCompleted == true
                              ? assignToOdd(selectedList, storyMapId)!["title"]
                              : "",
                          style: const TextStyle(
                              color: CustomColors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      if (textCompleted == true) {
                        await _addToList(right["title"]);
                        updateStoryMapId(right["aId"]);
                        print("first answerId=> $storyMapId");
                        _changeComplete();
                        left = assignToOdd(selectedList, storyMapId)!;
                        right = assignToEven(selectedList, storyMapId)!;
                        await _addToList(
                            getMapWithId(selectedList, storyMapId)!["history"]);
                      }
                    },
                    child: Container(
                      width: Config.screenWidth! * 0.5,
                      height: Config.screenHeight! * 0.1,
                      decoration: BoxDecoration(
                          color: CustomColors.black.withOpacity(0.95),
                          border: Border.all(
                              width: 1,
                              color: CustomColors.white.withOpacity(0.5)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: Center(
                        child: Text(
                          textCompleted == true
                              ? assignToEven(selectedList, storyMapId)!["title"]
                              : "",
                          style: const TextStyle(
                              color: CustomColors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ],
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
          Positioned(
              right: Config.screenWidth! * 0.03,
              top: Config.screenHeight! * 0.05,
              child: IconButton(
                  onPressed: _deleteListElements,
                  icon: const Icon(
                    Icons.refresh_outlined,
                    color: CustomColors.white,
                  )))
        ],
      ),
    );
  }
}
