import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/state/continue_play_state/continue_play_state.dart';
import 'package:gapsec/stories/games_storage/gravehurst.dart';
import 'package:gapsec/stories/games_storage/mysteriousLoss.dart';
import 'package:gapsec/stories/games_storage/survival_in_space.dart';
import 'package:gapsec/stories/games_storage/unknown.dart';
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

      case TextType.unknownType:
        return list.firstWhere((element) =>
            element["history"] ==
            _databaseService.unknownRepo.last!.unknownTexts.toString());

      case TextType.mysteriousType:
        return list.firstWhere((element) =>
            element["history"] ==
            _databaseService.mysteriousRepo.last!.mysteriousTexts.toString());

      case TextType.spaceType:
        return list.firstWhere((element) =>
            element["history"] ==
            _databaseService.spaceRepo.last!.spaceTexts.toString());

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

        case TextType.unknownType:
          cs.selectedList = unknownDetail;
          await _selectedStoryUpdate(type: TextType.unknownType);
          cs.left = initToOdd(
            cs.selectedList,
            TextType.unknownType,
          )!;
          cs.right = initToEven(
            cs.selectedList,
            TextType.unknownType,
          )!;
          await _selectedStoryUpdate(type: TextType.unknownType);
          setState(() {
            cs.repo = _databaseService.unknownRepo;
          });

          cs.scrollToBottom();
          break;
        case TextType.mysteriousType:
          cs.selectedList = mysteriousLossDetail;
          await _selectedStoryUpdate(type: TextType.mysteriousType);
          cs.left = initToOdd(
            cs.selectedList,
            TextType.mysteriousType,
          )!;
          cs.right = initToEven(
            cs.selectedList,
            TextType.mysteriousType,
          )!;
          await _selectedStoryUpdate(type: TextType.mysteriousType);
          setState(() {
            cs.repo = _databaseService.mysteriousRepo;
          });

          cs.scrollToBottom();
          break;
        case TextType.spaceType:
          cs.selectedList = survivalInSpaceDetail;
          await _selectedStoryUpdate(type: TextType.spaceType);
          cs.left = initToOdd(
            cs.selectedList,
            TextType.spaceType,
          )!;
          cs.right = initToEven(
            cs.selectedList,
            TextType.spaceType,
          )!;
          await _selectedStoryUpdate(type: TextType.spaceType);
          setState(() {
            cs.repo = _databaseService.spaceRepo;
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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.cyan),
        ),
        title: Text(
          widget.story,
          style: AppFonts.storyTitleInGameTextStyle
              .copyWith(color: Colors.cyan, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.cyan.withOpacity(0.5),
            height: 1.0,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.blueGrey[900]!],
          ),
        ),
        child: Column(
          children: [
            // Chat area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                          cs.selectedTexts =
                              newGame.webOfDeceitTexts.toString();
                          break;
                        case TextType.zetaType:
                          cs.selectedTexts = newGame.zetaTexts.toString();
                          break;
                        case TextType.unknownType:
                          cs.selectedTexts = newGame.unknownTexts.toString();
                          break;
                        case TextType.mysteriousType:
                          cs.selectedTexts = newGame.mysteriousTexts.toString();
                          break;
                        case TextType.spaceType:
                          cs.selectedTexts = newGame.spaceTexts.toString();
                          break;
                        default:
                      }
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index.isEven ? 0 : 40,
                          right: index.isEven ? 40 : 0,
                          bottom: 16,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: index.isEven
                                ? Colors.cyan.withOpacity(0.1)
                                : Colors.blueGrey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Colors.cyan.withOpacity(0.3), width: 1),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.cyan.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
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
                                            color: Colors.cyan, fontSize: 14),
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
                                      color: Colors.cyan, fontSize: 14),
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
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    border: Border(
                      top: BorderSide(
                          color: Colors.cyan.withOpacity(0.5), width: 1),
                    ),
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.cyan.withOpacity(0.7),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: Text(
                          cs.left["title"],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          await _handleChoice(cs.left);
                          cs.attempt++;
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        ConstantTexts.ChooseYourAnswer.tr(),
                        style: const TextStyle(
                            color: Colors.cyan, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.cyan.withOpacity(0.7),
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: Text(
                          cs.right["title"],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          await _handleChoice(cs.right);
                          cs.attempt++;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            if (!cs.textCompleted || _isTyping)
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    border: Border(
                      top: BorderSide(
                          color: Colors.cyan.withOpacity(0.5), width: 1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: LoadingIndicator(
                          indicatorType: Indicator.ballPulse,
                          colors: [Colors.cyan],
                          strokeWidth: 2,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        ConstantTexts.waitingForMessage.tr(),
                        style: AppFonts.waitingForMessageTextStyle
                            .copyWith(color: Colors.cyan),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
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
        case TextType.unknownType:
          cs.repo = _databaseService.unknownRepo;
          break;
        case TextType.mysteriousType:
          cs.repo = _databaseService.mysteriousRepo;
          break;
        case TextType.spaceType:
          cs.repo = _databaseService.spaceRepo;
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
        case TextType.unknownType:
          cs.repo = _databaseService.unknownRepo;
          break;
        case TextType.mysteriousType:
          cs.repo = _databaseService.mysteriousRepo;
          break;
        case TextType.spaceType:
          cs.repo = _databaseService.spaceRepo;
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
