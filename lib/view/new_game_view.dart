import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/state/new_game_view_state/new_game_view_state.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/view/home_view.dart';
import 'package:gapsec/view/play_story_view.dart';
import 'package:gapsec/view/stories_view.dart';
import 'package:gapsec/widgets/alert_widgets/alert_widgets.dart';
import 'package:video_player/video_player.dart';

class NewGameView extends StatefulWidget {
  const NewGameView({super.key});

  @override
  State<NewGameView> createState() => _NewGameViewState();
}

class _NewGameViewState extends State<NewGameView> {
  final NewGameViewState nv = NewGameViewState();
  final _databaseService = DatabaseService();

  @override
  void initState() {
    super.initState();
    nv.updateDefaultValues();
    nv.controller =
        VideoPlayerController.asset(ConstantPaths.newGameBackgroundVideo)
          ..initialize().then((_) {
            nv.controller.setLooping(true);
            setState(() {
              nv.controller.value.isPlaying
                  ? nv.controller.pause()
                  : nv.controller.play();
            });
          });
  }

  @override
  void dispose() {
    nv.controller.dispose();
    super.dispose();
  }

  void _updateScreen() {
    setState(() {});
  }

  Future<void> _selectedHistoryDelete({required TextType type}) async {
    await _databaseService.selectedStoryDelete(type: type);
    _updateScreen();
  }

  Future<void> _selectedStoryUpdate({required TextType type}) async {
    await _databaseService.selectedStoryUpdate(type: type);
    _updateScreen();
  }

  Future<void> showOkCancelAlert(
      BuildContext context, TextType type, String gameName) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: ConstantTexts.restartStory.tr(),
      message: ConstantTexts.doYouConfirmAlert.tr(),
      okLabel: ConstantTexts.yes.tr(),
      cancelLabel: ConstantTexts.no.tr(),
    );

    if (result == OkCancelResult.ok) {
      switch (type) {
        case TextType.murderType:
          await _selectedHistoryDelete(type: TextType.murderType);
          nv.goToPage(
              page: ChatView(
                selectedRepo: _databaseService.murderRepo,
                story: gameName,
                selectedTextType: TextType.murderType,
              ),
              context: context);
          break;
        case TextType.gravehurstType:
          await _selectedHistoryDelete(type: TextType.gravehurstType);
          nv.goToPage(
              page: ChatView(
                selectedRepo: _databaseService.gravehurstRepo,
                story: gameName,
                selectedTextType: TextType.gravehurstType,
              ),
              context: context);
          break;

        default:
      }
    }
  }

  // ignore: unused_element
  Future<void> _deleteListElements() async {
    await _databaseService.deleteListElements(type: TextType.murderType);
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
          nv.controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: nv.controller.value.aspectRatio,
                  child: VideoPlayer(nv.controller),
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
                    child: UnlockMoreButton(nv: nv),
                  );
                }

                final game = gameList[index];
                return FittedBox(child: gameContainer(gameName: game.name));
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
                      nv.goToPageRemoveUntilPush(
                          context: context, page: HomeView());
                    },
                    icon: AppFonts.homeButtonIcon),
              ),
            ),
          ),
          //Test etmek için data base'i sıfırlama tuşu
          /* SafeArea(
            child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: _deleteListElements,
                    icon: const Icon(
                      Icons.refresh_outlined,
                      color: CustomColors.white,
                    ))),
          ) */
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
                      //await _databaseService.getUpdatedList();
                      if (gameName == "Murder") {
                        switch (gameName) {
                          case "Murder":
                            await _selectedStoryUpdate(
                                type: TextType.murderType);
                            if (_databaseService.murderRepo.isEmpty) {
                              nv.goToPage(
                                  page: ChatView(
                                    selectedRepo: _databaseService.murderRepo,
                                    story: gameName,
                                    selectedTextType: TextType.murderType,
                                  ),
                                  context: context);
                            } else {
                              await showOkCancelAlert(
                                  context, TextType.murderType, gameName);
                            }
                            break;

                          default:
                        }
                      } else if (gameName == "Gravehurst") {
                        switch (gameName) {
                          case "Gravehurst":
                            await _selectedStoryUpdate(
                                type: TextType.gravehurstType);
                            if (_databaseService.gravehurstRepo.isEmpty) {
                              nv.goToPage(
                                  page: ChatView(
                                    selectedRepo:
                                        _databaseService.gravehurstRepo,
                                    story: gameName,
                                    selectedTextType: TextType.gravehurstType,
                                  ),
                                  context: context);
                            } else {
                              await showOkCancelAlert(
                                  context, TextType.gravehurstType, gameName);
                            }
                            break;
                          default:
                        }
                      } else {
                        AlertWidgets().showOkAlert(
                            context,
                            ConstantTexts.active_when_app_published.tr(),
                            ConstantTexts.test_mode.tr(),
                            ConstantTexts.okay.tr(),
                            () {});
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
    required this.nv,
  });

  final NewGameViewState nv;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(CustomColors.storyCardColor)),
      onPressed: () => nv.goToPage(page: const StoriesView(), context: context),
      child: FittedBox(
        child: Text(ConstantTexts.unlockMore.tr(),
            style: AppFonts.unlockMoreButtonTextStyle),
      ),
    );
  }
}
