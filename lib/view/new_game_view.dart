import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
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
  final StoriesState vm = StoriesState();
  final HomeState hs = HomeState();
  final _databaseService = DatabaseService();
  int storyMapId = 0;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _updateDefaultValues();
    _controller =
        VideoPlayerController.asset(ConstantPaths.newGameBackgroundVideo)
          ..initialize().then((_) {
            _controller.setLooping(true);
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _updateDefaultValues() async {
    await _databaseService.updateDefaultValues();
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
          //silincek
          await _selectedHistoryDelete(type: TextType.murderType);
          hs.goToPage(
              page: ChatView(
                selectedRepo: _databaseService.murderRepo,
                story: gameName,
                selectedTextType: TextType.murderType,
              ),
              context: context);
          print('pressed Murder');
          break;
        default:
      }
    }
  }

  Future<void> _deleteListElements() async {
    await _databaseService.deleteListElements(type: TextType.murderType);
  }

  //Animated textin tamamlandığı hakkında info

  void updateStoryMapId(int newId) {
    setState(() {
      storyMapId = newId;
    });
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final gameList =
        games().historiesGames.where((game) => !game.isLock).toList();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
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
                    child: unlockMoreButton(hs: hs),
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
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Observer(
                builder: (_) => IconButton(
                    onPressed: () async {
                      hs.goToPageRemoveUntilPush(
                          context: context, page: HomeView());
                    },
                    icon: AppFonts.homeButtonIcon),
              ),
            ),
          ),
          SafeArea(
            child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: _deleteListElements,
                    icon: const Icon(
                      Icons.refresh_outlined,
                      color: CustomColors.white,
                    ))),
          )
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
                              hs.goToPage(
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
                      } else {
                        AlertWidgets().showOkAlert(
                            context,
                            ConstantTexts.active_when_app_published,
                            ConstantTexts.test_mode,
                            ConstantTexts.okay,
                            () => print("hell"));
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

class unlockMoreButton extends StatelessWidget {
  const unlockMoreButton({
    super.key,
    required this.hs,
  });

  final HomeState hs;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(CustomColors.storyCardColor)),
      onPressed: () => hs.goToPage(page: const StoriesView(), context: context),
      child: FittedBox(
        child: Text(ConstantTexts.unlockMore.tr(),
            style: AppFonts.unlockMoreButtonTextStyle),
      ),
    );
  }
}
