import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/state/continue_play_state/continue_play_state.dart';
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

      case TextType.dontLookBackType:
        return list.firstWhere((element) =>
            element["history"] ==
            _databaseService.dontLookBackRepo.last!.dontLookBackTexts
                .toString());

      default:
    }
    return null;
  }

  void updateStoryMapId(int newId) {
    setState(() {
      cs.storyMapId = newId;
    });
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

  //answer mapini getiren tek için fonksiyon
  Map<String, dynamic>? assignToOdd(List<Map<String, dynamic>> list, int id) {
    var item = cs.getMapWithId(list, id);
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

  //Answer mapi sağ için
  Map<String, dynamic>? assignToEven(List<Map<String, dynamic>> list, int id) {
    var item = cs.getMapWithId(list, id);
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
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: Colors.black.withOpacity(0.7),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Colors.green, size: 20),
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
                    controller: cs.scrollController,
                    itemCount: cs.repo.length,
                    itemBuilder: (context, index) {
                      final NewGame newGame = cs.repo[index];
                      switch (widget.selectedTextType) {
                        case TextType.murderType:
                          cs.selectedTexts = newGame.murderTexts.toString();
                          break;
                        case TextType.dontLookBackType:
                          cs.selectedTexts =
                              newGame.dontLookBackTexts.toString();
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
              // Choices area
              if (cs.textCompleted)
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
                          child: Text(cs.left["title"]),
                          onPressed: () async {
                            await _handleChoice(cs.left);
                            cs.attempt++;
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
                          child: Text(cs.right["title"]),
                          onPressed: () async {
                            await _handleChoice(cs.right);
                            cs.attempt++;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              if (!cs.textCompleted)
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
      cs.textCompleted = false;
      cs.isEnable = false;
    });

    await _selectedStoryAddItem(
      eklencekText: choice["title"],
      type: widget.selectedTextType,
    );
    updateStoryMapId(choice["aId"]);

    await _selectedStoryUpdate(type: widget.selectedTextType);
    setState(() {
      cs.repo = widget.selectedTextType == TextType.murderType
          ? _databaseService.murderRepo
          : _databaseService.dontLookBackRepo;
    });
    cs.scrollToBottom();

    await Future.delayed(const Duration(seconds: 3));

    cs.left = assignToOdd(cs.selectedList, cs.storyMapId)!;
    cs.right = assignToEven(cs.selectedList, cs.storyMapId)!;
    await _selectedStoryAddItem(
      eklencekText: cs.getMapWithId(cs.selectedList, cs.storyMapId)!["history"],
      type: widget.selectedTextType,
    );
    await _selectedStoryUpdate(type: widget.selectedTextType);
    setState(() {
      cs.repo = widget.selectedTextType == TextType.murderType
          ? _databaseService.murderRepo
          : _databaseService.dontLookBackRepo;
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
