import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:gapsec/cache/games_storage/games_storage.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
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
      if (answers[0]['aId'] % 2 == 0 && answers[1]['aId'] % 2 == 0) {
        return answers[0];
      } else if (answers[0]['aId'] % 2 != 0 && answers[1]['aId'] % 2 != 0) {
        return answers[0];
      }

      // aId tek olanı seçiyoruz
      return answers.firstWhere((answer) => answer['aId'] % 2 != 0);
    }
    return null;
  }

  Map<String, dynamic>? assignToEven(List<Map<String, dynamic>> list, int id) {
    var item = getMapWithId(list, id);
    if (item != null) {
      var answers = item['answers'] as List<Map<String, dynamic>>;

      // Eğer her iki aId de aynı ise sağdaki çift olmasını istediğimiz için ilk elemanı döndürdüm
      if (answers[0]['aId'] == answers[1]['aId']) {
        return answers[1];
      }
      if (answers[0]['aId'] % 2 == 0 && answers[1]['aId'] % 2 == 0) {
        return answers[1];
      } else if (answers[0]['aId'] % 2 != 0 && answers[1]['aId'] % 2 != 0) {
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
    mp3controller =
        VideoPlayerController.asset(ConstantPaths.murderBackgroundMusicPath)
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
      title: 'GAPSEC Ends...',
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
      body: Container(
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/images/cpp.png"),
            //   fit: BoxFit.contain,
            // ),
            ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.green),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(ConstantTexts.murder,
                        style: AppFonts.storyTitleInGameTextStyle),
                  ],
                ),
              ),
              // Chat area
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: repo.length,
                    itemBuilder: (context, index) {
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
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index.isEven ? 0 : 50,
                          right: index.isEven ? 50 : 0,
                          bottom: 16,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: index.isEven
                                ? Colors.green.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.green, width: 1),
                          ),
                          child: Text(
                            selectedTexts.tr(),
                            style: const TextStyle(
                                color: Colors.green, fontSize: 14),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Choices area
              if (textCompleted)
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.black.withOpacity(0.7),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.green,
                            backgroundColor: Colors.green.withOpacity(0.2),
                            side: const BorderSide(color: Colors.green),
                          ),
                          child: Text(
                              assignToOdd(selectedList, storyMapId)!["title"]),
                          onPressed: () async {
                            await _handleChoice(left);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.green,
                            backgroundColor: Colors.green.withOpacity(0.2),
                            side: const BorderSide(color: Colors.green),
                          ),
                          child: Text(
                              assignToEven(selectedList, storyMapId)!["title"]),
                          onPressed: () async {
                            await _handleChoice(right);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              if (!textCompleted)
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.black.withOpacity(0.7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballPulse,
                          colors: [Colors.green],
                          strokeWidth: 2,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        ConstantTexts.waitingForMessage.tr(),
                        style: AppFonts.waitingForMessageTextStyle,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleChoice(Map<String, dynamic> choice) async {
    setState(() {
      textCompleted = false;
      isEnable = false;
    });

    await _selectedStoryAddItem(
      eklencekText: choice["title"],
      type: widget.selectedTextType,
    );
    updateStoryMapId(choice["aId"]);

    await _selectedStoryUpdate(type: widget.selectedTextType);
    setState(() {
      repo = widget.selectedTextType == TextType.murderType
          ? _databaseService.murderRepo
          : _databaseService.dontLookBackRepo;
    });
    _scrollToBottom();

    await Future.delayed(const Duration(seconds: 3));

    left = assignToOdd(selectedList, storyMapId)!;
    right = assignToEven(selectedList, storyMapId)!;
    await _selectedStoryAddItem(
      eklencekText: getMapWithId(selectedList, storyMapId)!["history"],
      type: widget.selectedTextType,
    );
    await _selectedStoryUpdate(type: widget.selectedTextType);
    setState(() {
      repo = widget.selectedTextType == TextType.murderType
          ? _databaseService.murderRepo
          : _databaseService.dontLookBackRepo;
    });
    _scrollToBottom();

    if (storyMapId >= 900) {
      print("hikaye sona geldi");
      _showOkAlertDialogWidget(context, ConstantTexts.you_have_reached_the_end);
      setState(() {
        isEnable = false;
      });
    } else {
      setState(() {
        textCompleted = true;
      });
    }
  }
}
