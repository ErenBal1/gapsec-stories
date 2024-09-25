import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/state/continue_play_state/continue_play_state.dart';
import 'package:gapsec/stories/games_storage/gravehurst.dart';
import 'package:gapsec/stories/games_storage/webOfDeceit.dart';
import 'package:gapsec/stories/games_storage/zeta.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/widgets/alert_widgets/alert_widgets.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:gapsec/stories/games_storage/games_storage.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
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
  final ContinuePlayState cs = ContinuePlayState();
  final _databaseService = DatabaseService();
  bool _isTyping = false;
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

  //istediğimiz son metne göre mapi getirir
  Map<String, dynamic>? getMapWithName(
      List<Map<String, dynamic>> list, TextType type) {
    switch (type) {
      case TextType.murderType:
        return list.firstWhere(
          (element) =>
              element["history"] ==
              _databaseService.murderRepo.last!.murderTexts.toString(),
        );
      case TextType.gravehurstType:
        return list.firstWhere((element) =>
            element["history"] ==
            _databaseService.gravehurstRepo.last!.gravehurstTexts.toString());

      case TextType.webOfDeceitType:
        return list.firstWhere((element) =>
            element["history"] ==
            _databaseService.webOfDeceitRepo.last!.webOfDeceitTexts.toString());

      case TextType.zetaType:
        return list.firstWhere((element) =>
            element["history"] ==
            _databaseService.zetaRepo.last!.zetaTexts.toString());

      default:
    }
    return null;
  }

  Map<String, dynamic>? initToEven(
      List<Map<String, dynamic>> list, TextType type) {
    var item = getMapWithName(list, type);
    if (item != null) {
      var answers = item['answers'] as List<Map<String, dynamic>>;
      if (answers[0]['aId'] == answers[1]['aId']) {
        return answers[1];
      } else if (answers[0]['aId'] == 0 || answers[0]['aId'] == 0) {
      } else if (answers[0]['aId'] % 2 == 0 && answers[1]['aId'] % 2 == 0) {
        return answers[1];
      } else if (answers[0]['aId'] % 2 != 0 && answers[1]['aId'] % 2 != 0) {
        return answers[1];
      } else {
        return answers.firstWhere((answer) => answer['aId'] % 2 == 0);
      }
    }
    return null;
  }

  Map<String, dynamic>? initToOdd(
      List<Map<String, dynamic>> list, TextType type) {
    var item = getMapWithName(list, type);
    if (item != null) {
      var answers = item['answers'] as List<Map<String, dynamic>>;
      if (answers[0]['aId'] == answers[1]['aId']) {
        return answers[0];
      } else if (answers[0]['aId'] == 0 || answers[0]['aId'] == 0) {
      } else if (answers[0]['aId'] % 2 == 0 && answers[1]['aId'] % 2 == 0) {
        return answers[0];
      } else if (answers[0]['aId'] % 2 != 0 && answers[1]['aId'] % 2 != 0) {
        return answers[0];
      }
      return answers.firstWhere((answer) => answer['aId'] % 2 != 0);
    }
    return null;
  }

  @override
  void initState() {
    cs.mp3controller =
        VideoPlayerController.asset(ConstantPaths.murderBackgroundMusicPath)
          ..initialize().then((_) {
            cs.mp3controller.setLooping(true);
            setState(() {
              cs.mp3controller.value.isPlaying
                  ? cs.mp3controller.pause()
                  : cs.mp3controller.play();
            });
          });
    cs.scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      switch (widget.selectedTextType) {
        case TextType.murderType:
          cs.selectedList = murderDetail;
          await _selectedStoryUpdate(type: TextType.murderType);
          cs.left = initToOdd(
            cs.selectedList,
            TextType.murderType,
          )!;
          cs.right = initToEven(
            cs.selectedList,
            TextType.murderType,
          )!;
          await _selectedStoryUpdate(type: TextType.murderType);
          setState(() {
            cs.repo = _databaseService.murderRepo;
          });

          cs.scrollToBottom();
          break;
        case TextType.gravehurstType:
          cs.selectedList = gravehurstDetail;
          await _selectedStoryUpdate(type: TextType.gravehurstType);
          cs.left = initToOdd(
            cs.selectedList,
            TextType.gravehurstType,
          )!;
          cs.right = initToEven(
            cs.selectedList,
            TextType.gravehurstType,
          )!;
          await _selectedStoryUpdate(type: TextType.gravehurstType);
          setState(() {
            cs.repo = _databaseService.gravehurstRepo;
          });

          cs.scrollToBottom();
          break;
        case TextType.webOfDeceitType:
          cs.selectedList = webOfDeceitDetail;
          await _selectedStoryUpdate(type: TextType.webOfDeceitType);
          cs.left = initToOdd(
            cs.selectedList,
            TextType.webOfDeceitType,
          )!;
          cs.right = initToEven(
            cs.selectedList,
            TextType.webOfDeceitType,
          )!;
          await _selectedStoryUpdate(type: TextType.webOfDeceitType);
          setState(() {
            cs.repo = _databaseService.webOfDeceitRepo;
          });

          cs.scrollToBottom();
          break;

        case TextType.zetaType:
          cs.selectedList = zetaDetail;
          await _selectedStoryUpdate(type: TextType.zetaType);
          cs.left = initToOdd(
            cs.selectedList,
            TextType.zetaType,
          )!;
          cs.right = initToEven(
            cs.selectedList,
            TextType.zetaType,
          )!;
          await _selectedStoryUpdate(type: TextType.zetaType);
          setState(() {
            cs.repo = _databaseService.zetaRepo;
          });

          cs.scrollToBottom();
          break;
        default:
      }
    });
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    cs.mp3controller.dispose();
    cs.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cs.scrollToBottom();
    });
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.cancel_outlined, color: Colors.green),
        ),
        title: Text(
          widget.story,
          style: AppFonts.storyTitleInGameTextStyle,
        ),
      ),
      body: Column(
        children: [
          // Chat area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: ListView.builder(
                  controller: cs.scrollController,
                  itemCount: cs.repo.length,
                  itemBuilder: (context, index) {
                    final NewGame newGame = cs.repo[index];
                    switch (widget.selectedTextType) {
                      case TextType.murderType:
                        cs.selectedTexts = newGame.murderTexts.toString();
                        break;
                      case TextType.gravehurstType:
                        cs.selectedTexts = newGame.gravehurstTexts.toString();
                        break;
                      case TextType.webOfDeceitType:
                        cs.selectedTexts = newGame.webOfDeceitTexts.toString();
                        break;
                      case TextType.zetaType:
                        cs.selectedTexts = newGame.zetaTexts.toString();
                        break;
                      default:
                    }
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index.isEven ? 10 : 50,
                        right: index.isEven ? 50 : 10,
                        bottom: 16,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? Colors.green.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.2),
                          borderRadius: index.isEven
                              ? const BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(10),
                                  topEnd: Radius.circular(10),
                                  topStart: Radius.circular(10))
                              : const BorderRadiusDirectional.only(
                                  bottomStart: Radius.circular(10),
                                  topEnd: Radius.circular(10),
                                  topStart: Radius.circular(10)),
                          border: Border.all(color: Colors.green, width: 1),
                        ),
                        child: index == cs.repo.length - 1 && _isTyping
                            ? Stack(children: [
                                Text(cs.selectedTexts.tr(),
                                    style: const TextStyle(
                                        color: Colors.transparent,
                                        fontSize: 14)),
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      cs.selectedTexts.tr(),
                                      textStyle: const TextStyle(
                                          color: Colors.green, fontSize: 14),
                                      speed: const Duration(milliseconds: 50),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                  onFinished: () {
                                    setState(() {
                                      _isTyping = false;
                                      cs.textCompleted = true;
                                    });
                                  },
                                ),
                              ])
                            : Text(
                                cs.selectedTexts.tr(),
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 14),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // Choices area
          if (cs.textCompleted && !_isTyping)
            SafeArea(
              child: Container(
                color: Colors.black.withOpacity(0.7),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          foregroundColor: Colors.green,
                          backgroundColor: Colors.green.withOpacity(0.2),
                          side: const BorderSide(color: Colors.green),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Text(cs.left["title"]),
                        ),
                        onPressed: () async {
                          await _handleChoice(cs.left);
                          cs.attempt++;
                        },
                      ),
                    ),
                    Container(
                      child: Text(
                        ConstantTexts.ChooseYourAnswer.tr(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          foregroundColor: Colors.green,
                          backgroundColor: Colors.green.withOpacity(0.2),
                          side: const BorderSide(color: Colors.green),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Text(cs.right["title"]),
                        ),
                        onPressed: () async {
                          await _handleChoice(cs.right);
                          cs.attempt++;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (!cs.textCompleted || _isTyping)
            SafeArea(
              child: Container(
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
            ),
        ],
      ),
    );
  }

  Future<void> _handleChoice(Map<String, dynamic> choice) async {
    setState(() {
      cs.textCompleted = false;
      _isTyping = false;
      cs.isEnable = false;
    });

    await _selectedStoryAddItem(
      eklencekText: choice["title"],
      type: widget.selectedTextType,
    );
    cs.updateStoryMapId(choice["aId"]);

    await _selectedStoryUpdate(type: widget.selectedTextType);
    setState(() {
      switch (widget.selectedTextType) {
        case TextType.murderType:
          cs.repo = _databaseService.murderRepo;
          break;
        case TextType.gravehurstType:
          cs.repo = _databaseService.gravehurstRepo;
          break;
        case TextType.webOfDeceitType:
          cs.repo = _databaseService.webOfDeceitRepo;
          break;
        case TextType.zetaType:
          cs.repo = _databaseService.zetaRepo;
          break;
        default:
      }
    });
    cs.scrollToBottom();

    await Future.delayed(const Duration(seconds: 3));

    cs.left = cs.assignToOdd(cs.selectedList, cs.storyMapId)!;
    cs.right = cs.assignToEven(cs.selectedList, cs.storyMapId)!;
    await _selectedStoryAddItem(
      eklencekText: cs.getMapWithId(cs.selectedList, cs.storyMapId)!["history"],
      type: widget.selectedTextType,
    );
    await _selectedStoryUpdate(type: widget.selectedTextType);
    setState(() {
      switch (widget.selectedTextType) {
        case TextType.murderType:
          cs.repo = _databaseService.murderRepo;
          break;
        case TextType.gravehurstType:
          cs.repo = _databaseService.gravehurstRepo;
          break;
        case TextType.webOfDeceitType:
          cs.repo = _databaseService.webOfDeceitRepo;
          break;
        case TextType.zetaType:
          cs.repo = _databaseService.zetaRepo;
          break;
        default:
      }
    });
    setState(() {
      _isTyping = true;
    });
    cs.scrollToBottom();

    if (cs.storyMapId >= 900) {
      AlertWidgets().showOkAlert(
          context,
          ConstantTexts.you_have_reached_the_end.tr(),
          ConstantTexts.GapsecEnds.tr(),
          ConstantTexts.okay.tr(),
          () {});
      setState(() {
        cs.isEnable = false;
      });
    } else {
      setState(() {
        cs.textCompleted = true;
      });
    }
  }
}
