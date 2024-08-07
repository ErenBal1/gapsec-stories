import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/cache/games_storage/eren_story.dart';
import 'package:page_transition/page_transition.dart';

import 'package:gapsec/cache/games_storage/dont_look_back.dart';
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
  final _databaseService = DatabaseService();
  int storyMapId = 0;
  late List repo = [];
  String mp3Path = "assets/sounds/dontLookBack.mp3";
  String selectedTexts = "";
  final ScrollController _scrollController = ScrollController();

  TextEditingController myTextController = TextEditingController();

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
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
      return answers.firstWhere((answer) => answer['aId'] % 2 != 0);
    }
    return null;
  }

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

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      switch (widget.selectedTextType) {
        case TextType.murderType:
          selectedList = MurderList;
          await _selectedStoryAddItem(
              eklencekText: getMapWithId(selectedList, storyMapId)!["history"],
              type: TextType.murderType);
          left = assignToOdd(selectedList, storyMapId)!;
          right = assignToEven(selectedList, storyMapId)!;
          await _selectedStoryUpdate(type: TextType.murderType);
          setState(() {
            repo = _databaseService.murderRepo;
            textCompleted = true;
          });
          break;
        case TextType.dontLookBackType:
          selectedList = DontLookBackList;
          await _selectedStoryAddItem(
              eklencekText: getMapWithId(selectedList, storyMapId)!["history"],
              type: TextType.dontLookBackType);
          left = assignToOdd(selectedList, storyMapId)!;
          right = assignToEven(selectedList, storyMapId)!;
          await _selectedStoryUpdate(type: TextType.dontLookBackType);
          setState(() {
            repo = _databaseService.dontLookBackRepo;
            textCompleted = true;
          });
          break;
        case TextType.erenType:
          selectedList = eren;
          await _selectedStoryAddItem(
              eklencekText: getMapWithId(selectedList, storyMapId)!["history"],
              type: TextType.erenType);
          left = assignToOdd(selectedList, storyMapId)!;
          right = assignToEven(selectedList, storyMapId)!;
          await _selectedStoryUpdate(type: TextType.erenType);
          setState(() {
            repo = _databaseService.erenRepo;
            textCompleted = true;
          });
          break;
        default:
      }
    });
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
      body: Stack(
        children: [
          Positioned(
            top: 10,
            bottom: 200,
            child: Container(
              width: Config.screenWidth,
              height: Config.screenHeight! * 0.9,
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
              ),
              child: ListView.builder(
                shrinkWrap: true,
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
                    case TextType.erenType:
                      selectedTexts = newGame.erenTexts.toString();
                      break;
                    default:
                  }
                  return Container(
                    margin: EdgeInsets.only(
                      left: index.isEven ? 10 : 200,
                      right: index.isEven ? 200 : 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? Colors.blueGrey[700]
                          : Colors.blueGrey[400],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20),
                        bottomLeft: Radius.circular(index.isEven ? 0 : 20),
                        bottomRight: Radius.circular(index.isEven ? 20 : 0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        selectedTexts.tr(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: Config.screenHeight! * 0.03,
            left: 0,
            child: SizedBox(
              width: Config.screenWidth,
              child: Column(
                children: [
                  Container(
                    // color: Colors.purple,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            controller: myTextController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Your answer",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              handleStoryProgress(widget.selectedTextType),
                          icon: const Icon(Icons.send),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: textCompleted ? 100 : 0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          OptionButton(
                            text: textCompleted
                                ? assignToOdd(
                                    selectedList, storyMapId)!["title"]
                                : "",
                            onTap: () => myTextController.text =
                                assignToOdd(selectedList, storyMapId)!["title"],
                          ),
                          const SizedBox(width: 10),
                          OptionButton(
                            text: textCompleted
                                ? assignToEven(
                                    selectedList, storyMapId)!["title"]
                                : "",
                            onTap: () => myTextController.text = assignToEven(
                                selectedList, storyMapId)!["title"],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
    _scrollToBottom();
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
