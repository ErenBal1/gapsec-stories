import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/state/continue_view_state/continue_view_state.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/view/continue_play_view.dart';
import 'package:gapsec/view/home_view.dart';
import 'package:gapsec/view/stories_view.dart';
import 'package:video_player/video_player.dart';

class ContinueView extends StatefulWidget {
  const ContinueView({super.key});

  @override
  State<ContinueView> createState() => _ContinueViewState();
}

class _ContinueViewState extends State<ContinueView> {
  final ContinueViewState cv = ContinueViewState();
  final _databaseService = DatabaseService();

  void _updateScreen() {
    setState(() {});
  }

  Future<void> _selectedStoryUpdate({required TextType type}) async {
    await _databaseService.selectedStoryUpdate(type: type);
    _updateScreen();
  }

  @override
  void initState() {
    super.initState();
    cv.controller =
        VideoPlayerController.asset(ConstantPaths.continueBackgroundVideo)
          ..initialize().then((_) {
            cv.controller.setLooping(true);
            setState(() {
              cv.controller.value.isPlaying
                  ? cv.controller.pause()
                  : cv.controller.play();
            });
          });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _selectedStoryUpdate(type: TextType.murderType);
      await _selectedStoryUpdate(type: TextType.gravehurstType);
      await _selectedStoryUpdate(type: TextType.webOfDeceitType);
      await _selectedStoryUpdate(type: TextType.zetaType);
      await _selectedStoryUpdate(type: TextType.unknownType);
      await _selectedStoryUpdate(type: TextType.mysteriousType);
      await _selectedStoryUpdate(type: TextType.spaceType);
    });
    super.initState();
  }

  @override
  void dispose() {
    cv.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final gameList =
        Games().historiesGames.where((game) => !game.isLock).toList();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          cv.controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: cv.controller.value.aspectRatio,
                  child: VideoPlayer(cv.controller),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: gameList.length + 1,
              itemBuilder: (context, index) {
                if (index == gameList.length) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 70, left: 70),
                    child: UnlockMoreButton(cv: cv),
                  );
                }
                Widget content = Container();
                final game = gameList[index];
                switch (game.name) {
                  case "Murder":
                    if (_databaseService.murderRepo.isNotEmpty) {
                      content =
                          FittedBox(child: gameContainer(gameName: game.name));
                    }
                    break;
                  case "Gravehurst":
                    if (_databaseService.gravehurstRepo.isNotEmpty) {
                      content =
                          FittedBox(child: gameContainer(gameName: game.name));
                    }
                    break;
                  case "Web Of Deceit":
                    if (_databaseService.webOfDeceitRepo.isNotEmpty) {
                      content =
                          FittedBox(child: gameContainer(gameName: game.name));
                    }
                    break;
                  case "Zeta":
                    if (_databaseService.zetaRepo.isNotEmpty) {
                      content =
                          FittedBox(child: gameContainer(gameName: game.name));
                    }
                    break;
                  case "Unknown Number":
                    if (_databaseService.unknownRepo.isNotEmpty) {
                      content =
                          FittedBox(child: gameContainer(gameName: game.name));
                    }
                    break;
                  case "Mysterious Loss":
                    if (_databaseService.mysteriousRepo.isNotEmpty) {
                      content =
                          FittedBox(child: gameContainer(gameName: game.name));
                    }
                    break;
                  case "Space in Survival":
                    if (_databaseService.spaceRepo.isNotEmpty) {
                      content =
                          FittedBox(child: gameContainer(gameName: game.name));
                    }
                    break;
                  default:
                }
                return content;
              },
            ),
          ),
          Positioned(
              left: (Config.screenWidth! * 0.3),
              top: (Config.screenHeight! * 0.07),
              child: SizedBox(
                  width: Config.screenWidth! * 0.4,
                  height: Config.screenWidth! * 0.4,
                  child: Image.asset(
                    ConstantPaths.keyHoleImagePath,
                    color: CustomColors.white,
                    fit: BoxFit.cover,
                  ))),
          Positioned(
              right: 20,
              top: 0,
              child: SizedBox(
                  width: 100,
                  height: 140,
                  child: Image.asset(
                    ConstantPaths.lampImagePath,
                    fit: BoxFit.cover,
                  ))),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () async {
                      cv.goToPageRemoveUntilPush(
                          context: context, page: HomeView());
                    },
                    icon: AppFonts.backButtonIcon),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget gameContainer({required String gameName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(
                ConstantPaths.keyImagePath,
                fit: BoxFit.cover,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 10, left: 10),
          child: Container(
            width: (Config.screenWidth! * 0.8),
            height: Config.screenHeight! * 0.07,
            color: CustomColors.storyCardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: CustomColors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: CustomColors.black,
                          offset: Offset(5, 5),
                          blurRadius: 5,
                          spreadRadius: 1)
                    ],
                    border: Border.all(width: 1, color: CustomColors.black)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: InkWell(
                    onTap: () async {
                      switch (gameName) {
                        case "Murder":
                          await _selectedStoryUpdate(type: TextType.murderType);
                          if (_databaseService.murderRepo.isNotEmpty) {
                            cv.goToPage(
                                page: ContinueChatView(
                                  selectedRepo: _databaseService.murderRepo,
                                  story: gameName,
                                  selectedTextType: TextType.murderType,
                                ),
                                context: context);
                          } else {
                            /* await showOkCancelAlert(
                                context, TextType.murderType, gameName); */
                          }
                          break;
                        case "Gravehurst":
                          await _selectedStoryUpdate(
                              type: TextType.gravehurstType);
                          if (_databaseService.gravehurstRepo.isNotEmpty) {
                            cv.goToPage(
                                page: ContinueChatView(
                                  selectedRepo: _databaseService.gravehurstRepo,
                                  story: gameName,
                                  selectedTextType: TextType.gravehurstType,
                                ),
                                context: context);
                          } else {
                            /* await showOkCancelAlert(
                                context, TextType.dontLookBackType, gameName); */
                          }
                          break;
                        case "Web Of Deceit":
                          await _selectedStoryUpdate(
                              type: TextType.webOfDeceitType);
                          if (_databaseService.webOfDeceitRepo.isNotEmpty) {
                            cv.goToPage(
                                page: ContinueChatView(
                                  selectedRepo:
                                      _databaseService.webOfDeceitRepo,
                                  story: gameName,
                                  selectedTextType: TextType.webOfDeceitType,
                                ),
                                context: context);
                          } else {
                            /* await showOkCancelAlert(
                                context, TextType.murderType, gameName); */
                          }
                          break;
                        case "Zeta":
                          await _selectedStoryUpdate(type: TextType.zetaType);
                          if (_databaseService.zetaRepo.isNotEmpty) {
                            cv.goToPage(
                                page: ContinueChatView(
                                  selectedRepo: _databaseService.zetaRepo,
                                  story: gameName,
                                  selectedTextType: TextType.zetaType,
                                ),
                                context: context);
                          } else {
                            /* await showOkCancelAlert(
                                context, TextType.murderType, gameName); */
                          }
                          break;
                        case "Unknown Number":
                          await _selectedStoryUpdate(
                              type: TextType.unknownType);
                          if (_databaseService.unknownRepo.isNotEmpty) {
                            cv.goToPage(
                                page: ContinueChatView(
                                  selectedRepo: _databaseService.unknownRepo,
                                  story: gameName,
                                  selectedTextType: TextType.unknownType,
                                ),
                                context: context);
                          } else {
                            /* await showOkCancelAlert(
                                context, TextType.murderType, gameName); */
                          }
                          break;
                        case "Mysterious Loss":
                          await _selectedStoryUpdate(
                              type: TextType.mysteriousType);
                          if (_databaseService.mysteriousRepo.isNotEmpty) {
                            cv.goToPage(
                                page: ContinueChatView(
                                  selectedRepo: _databaseService.mysteriousRepo,
                                  story: gameName,
                                  selectedTextType: TextType.mysteriousType,
                                ),
                                context: context);
                          } else {
                            /* await showOkCancelAlert(
                                context, TextType.murderType, gameName); */
                          }
                          break;
                        case "Survival in Space":
                          await _selectedStoryUpdate(type: TextType.spaceType);
                          if (_databaseService.spaceRepo.isNotEmpty) {
                            cv.goToPage(
                                page: ContinueChatView(
                                  selectedRepo: _databaseService.spaceRepo,
                                  story: gameName,
                                  selectedTextType: TextType.spaceType,
                                ),
                                context: context);
                          } else {
                            /* await showOkCancelAlert(
                                context, TextType.murderType, gameName); */
                          }
                          break;
                        default:
                      }
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            gameName,
                            style: AppFonts.storyTitleTextStyle,
                          ),
                          const Icon(
                            Icons.play_arrow_rounded,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UnlockMoreButton extends StatelessWidget {
  const UnlockMoreButton({
    super.key,
    required this.cv,
  });
  final ContinueViewState cv;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(CustomColors.storyCardColor)),
      onPressed: () => cv.goToPage(page: const StoriesView(), context: context),
      child: FittedBox(
        child: Text(ConstantTexts.unlockMore.tr(),
            style: AppFonts.unlockMoreButtonTextStyle),
      ),
    );
  }
}
