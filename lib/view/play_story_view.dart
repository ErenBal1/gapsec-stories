import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/state/play_story_view_state/play_story_view_state.dart';
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
  final PlayStoryViewState vm = PlayStoryViewState();
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

  @override
  void initState() {
    vm.mp3controller =
        VideoPlayerController.asset(ConstantPaths.murderBackgroundMusicPath)
          ..initialize().then((_) {
            vm.mp3controller.setLooping(true);

            vm.mp3controller.value.isPlaying
                ? vm.mp3controller.pause()
                : vm.mp3controller.play();
          });
    vm.scrollController = ScrollController();
    Future.delayed(const Duration(seconds: 3), () {
      vm.textCompleted = true;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        switch (widget.selectedTextType) {
          case TextType.murderType:
            vm.selectedList = murderDetail;

            await _selectedStoryAddItem(
                eklencekText:
                    vm.getMapWithId(vm.selectedList, vm.storyMapId)!["history"],
                type: TextType.murderType);
            vm.left = vm.assignToOdd(vm.selectedList, vm.storyMapId)!;
            vm.right = vm.assignToEven(vm.selectedList, vm.storyMapId)!;
            await _selectedStoryUpdate(type: TextType.murderType);
            vm.repo = _databaseService.murderRepo;
            break;
          case TextType.gravehurstType:
            vm.selectedList = gravehurstDetail;

            await _selectedStoryAddItem(
                eklencekText:
                    vm.getMapWithId(vm.selectedList, vm.storyMapId)!["history"],
                type: TextType.gravehurstType);
            vm.left = vm.assignToOdd(vm.selectedList, vm.storyMapId)!;
            vm.right = vm.assignToEven(vm.selectedList, vm.storyMapId)!;
            await _selectedStoryUpdate(type: TextType.gravehurstType);
            vm.repo = _databaseService.gravehurstRepo;
            break;
          case TextType.webOfDeceitType:
            vm.selectedList = webOfDeceitDetail;

            await _selectedStoryAddItem(
                eklencekText:
                    vm.getMapWithId(vm.selectedList, vm.storyMapId)!["history"],
                type: TextType.webOfDeceitType);
            vm.left = vm.assignToOdd(vm.selectedList, vm.storyMapId)!;
            vm.right = vm.assignToEven(vm.selectedList, vm.storyMapId)!;
            await _selectedStoryUpdate(type: TextType.webOfDeceitType);
            vm.repo = _databaseService.webOfDeceitRepo;
            break;
          case TextType.zetaType:
            vm.selectedList = zetaDetail;

            await _selectedStoryAddItem(
                eklencekText:
                    vm.getMapWithId(vm.selectedList, vm.storyMapId)!["history"],
                type: TextType.zetaType);
            vm.left = vm.assignToOdd(vm.selectedList, vm.storyMapId)!;
            vm.right = vm.assignToEven(vm.selectedList, vm.storyMapId)!;
            await _selectedStoryUpdate(type: TextType.zetaType);
            vm.repo = _databaseService.zetaRepo;
            break;
          case TextType.unknownType:
            vm.selectedList = unknownDetail;

            await _selectedStoryAddItem(
                eklencekText:
                    vm.getMapWithId(vm.selectedList, vm.storyMapId)!["history"],
                type: TextType.unknownType);
            vm.left = vm.assignToOdd(vm.selectedList, vm.storyMapId)!;
            vm.right = vm.assignToEven(vm.selectedList, vm.storyMapId)!;
            await _selectedStoryUpdate(type: TextType.unknownType);
            vm.repo = _databaseService.unknownRepo;
            break;

          case TextType.mysteriousType:
            vm.selectedList = mysteriousLossDetail;

            await _selectedStoryAddItem(
                eklencekText:
                    vm.getMapWithId(vm.selectedList, vm.storyMapId)!["history"],
                type: TextType.mysteriousType);
            vm.left = vm.assignToOdd(vm.selectedList, vm.storyMapId)!;
            vm.right = vm.assignToEven(vm.selectedList, vm.storyMapId)!;
            await _selectedStoryUpdate(type: TextType.mysteriousType);
            vm.repo = _databaseService.mysteriousRepo;
            break;

          case TextType.spaceType:
            vm.selectedList = survivalInSpaceDetail;

            await _selectedStoryAddItem(
                eklencekText:
                    vm.getMapWithId(vm.selectedList, vm.storyMapId)!["history"],
                type: TextType.spaceType);
            vm.left = vm.assignToOdd(vm.selectedList, vm.storyMapId)!;
            vm.right = vm.assignToEven(vm.selectedList, vm.storyMapId)!;
            await _selectedStoryUpdate(type: TextType.spaceType);
            vm.repo = _databaseService.spaceRepo;
            break;
          default:
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    vm.mp3controller.dispose();
    vm.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.scrollToBottom();
    });
    return Scaffold(
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  controller: vm.scrollController,
                  itemCount: vm.repo.length,
                  itemBuilder: (context, index) {
                    final NewGame newGame = vm.repo[index];
                    switch (widget.selectedTextType) {
                      case TextType.murderType:
                        vm.selectedTexts = newGame.murderTexts.toString();
                        break;
                      case TextType.gravehurstType:
                        vm.selectedTexts = newGame.gravehurstTexts.toString();
                        break;
                      case TextType.webOfDeceitType:
                        vm.selectedTexts = newGame.webOfDeceitTexts.toString();
                        break;
                      case TextType.zetaType:
                        vm.selectedTexts = newGame.zetaTexts.toString();
                        break;
                      case TextType.unknownType:
                        vm.selectedTexts = newGame.unknownTexts.toString();
                        break;
                      case TextType.mysteriousType:
                        vm.selectedTexts = newGame.mysteriousTexts.toString();
                        break;
                      case TextType.spaceType:
                        vm.selectedTexts = newGame.spaceTexts.toString();
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
                        child: index == vm.repo.length - 1 && _isTyping
                            ? Stack(children: [
                                Text(vm.selectedTexts.tr(),
                                    style: const TextStyle(
                                        color: Colors.transparent,
                                        fontSize: 14)),
                                AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                      vm.selectedTexts.tr(),
                                      textStyle: const TextStyle(
                                          color: Colors.cyan, fontSize: 14),
                                      speed: const Duration(milliseconds: 80),
                                    ),
                                  ],
                                  totalRepeatCount: 1,
                                  onFinished: () {
                                    setState(() {
                                      _isTyping = false;
                                      vm.textCompleted = true;
                                    });
                                  },
                                ),
                              ])
                            : Text(
                                vm.selectedTexts.tr(),
                                style: const TextStyle(
                                    color: Colors.cyan, fontSize: 14),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Choices area
            if (vm.textCompleted && !_isTyping)
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
                          vm.assignToOdd(
                              vm.selectedList, vm.storyMapId)!["title"],
                          style: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () async {
                          await _handleChoice(vm.left);
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
                          vm.assignToEven(
                              vm.selectedList, vm.storyMapId)!["title"],
                          style: const TextStyle(fontSize: 16),
                        ),
                        onPressed: () async {
                          await _handleChoice(vm.right);
                        },
                      ),
                    ],
                  ),
                ),
              ),

            if (!vm.textCompleted || _isTyping)
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
      vm.textCompleted = false;
      _isTyping = false;
    });

    vm.isEnable = false;
    await _selectedStoryAddItem(
      eklencekText: choice["title"],
      type: widget.selectedTextType,
    );
    vm.updateStoryMapId(choice["aId"]);

    await _selectedStoryUpdate(type: widget.selectedTextType);
    switch (widget.selectedTextType) {
      case TextType.murderType:
        vm.repo = _databaseService.murderRepo;
        break;
      case TextType.gravehurstType:
        vm.repo = _databaseService.gravehurstRepo;
        break;
      case TextType.webOfDeceitType:
        vm.repo = _databaseService.webOfDeceitRepo;
        break;
      case TextType.zetaType:
        vm.repo = _databaseService.zetaRepo;
        break;
      case TextType.unknownType:
        vm.repo = _databaseService.unknownRepo;
        break;
      case TextType.mysteriousType:
        vm.repo = _databaseService.mysteriousRepo;
        break;
      case TextType.spaceType:
        vm.repo = _databaseService.spaceRepo;
        break;

      default:
    }

    vm.scrollToBottom();

    await Future.delayed(const Duration(seconds: 1));

    vm.left = vm.assignToOdd(vm.selectedList, vm.storyMapId)!;
    vm.right = vm.assignToEven(vm.selectedList, vm.storyMapId)!;
    await _selectedStoryAddItem(
      eklencekText: vm.getMapWithId(vm.selectedList, vm.storyMapId)!["history"],
      type: widget.selectedTextType,
    );
    await _selectedStoryUpdate(type: widget.selectedTextType);
    switch (widget.selectedTextType) {
      case TextType.murderType:
        vm.repo = _databaseService.murderRepo;
        break;
      case TextType.gravehurstType:
        vm.repo = _databaseService.gravehurstRepo;
        break;
      case TextType.webOfDeceitType:
        vm.repo = _databaseService.webOfDeceitRepo;
        break;
      case TextType.zetaType:
        vm.repo = _databaseService.zetaRepo;
        break;
      case TextType.unknownType:
        vm.repo = _databaseService.unknownRepo;
        break;
      case TextType.mysteriousType:
        vm.repo = _databaseService.mysteriousRepo;
        break;
      case TextType.spaceType:
        vm.repo = _databaseService.spaceRepo;
        break;

      default:
    }

    setState(() {
      _isTyping = true;
    });

    vm.scrollToBottom();

    if (vm.storyMapId >= 900) {
      AlertWidgets().showOkAlert(
          context,
          ConstantTexts.you_have_reached_the_end.tr(),
          ConstantTexts.GapsecEnds.tr(),
          ConstantTexts.okay.tr(),
          () {});
      vm.isEnable = false;
    }
  }
}
