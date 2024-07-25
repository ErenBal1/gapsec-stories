import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:tab_container/tab_container.dart';
import 'package:video_player/video_player.dart';

class StoriesView extends StatefulWidget {
  const StoriesView({super.key});

  @override
  _StoriesViewState createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView>
    with SingleTickerProviderStateMixin {
  final StoriesState vm = StoriesState();
  late VideoPlayerController controller;
  late final TabController _tabcontroller;
  late TextTheme textTheme;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("assets/videos/thunder.mp4")
      ..initialize().then(
        (_) {
          controller.setLooping(true);
          setState(() {
            controller.value.isPlaying ? controller.pause() : controller.play();
          });
        },
      );
    _tabcontroller = TabController(vsync: this, length: 3);
  }

  @override
  void didChangeDependencies() {
    textTheme = Theme.of(context).textTheme;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: Config.screenHeight,
              width: Config.screenWidth,
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
            Positioned(
              top: Config.screenHeight! * 0.70,
              left: Config.screenWidth! * 0.10,
              child: Text(
                "STORIES",
                style: AppFonts.normRed,
              ),
            ),
            Positioned(
              top: Config.screenHeight! * 0.05,
              right: 0,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: Config.screenHeight,
                  child: Column(
                    children: [
                      SizedBox(
                        width: Config.screenWidth! * 0.7,
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TabContainer(
                            color: CustomColors.red.withOpacity(0.3),
                            tabEdge: TabEdge.right,
                            childPadding: const EdgeInsets.all(20.0),
                            tabs: _getTabs3(context),
                            children: _getChildren3(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: Config.screenHeight! * 0.05,
              left: Config.screenWidth! * 0.02,
              child: Observer(builder: (_) {
                return IconButton(
                  onPressed: () async {
                    vm.goBack(context: context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: CustomColors.white,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getChildren3(BuildContext context) => <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MURDER',
              style: AppFonts.storyCard,
            ),
            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'HorrorFont',
              ),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText('Discipline is the best tool',
                      speed: const Duration(milliseconds: 100)),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Don't Look Back", style: AppFonts.storyCard),
            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'HorrorFont',
              ),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText('Discipline is the best tool',
                      speed: const Duration(milliseconds: 100)),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lost Lucy', style: AppFonts.storyCard),
            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'HorrorFont',
              ),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText('Discipline is the best tool',
                      speed: const Duration(milliseconds: 100)),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Night Game', style: AppFonts.storyCard),
            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'HorrorFont',
              ),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText('Discipline is the best tool',
                      speed: const Duration(milliseconds: 100)),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ];

  List<Widget> _getTabs3(BuildContext context) => <Widget>[
        const Icon(
          Icons.star_border,
          color: CustomColors.white,
        ),
        const Icon(
          Icons.star_border,
          color: CustomColors.white,
        ),
        const Icon(
          Icons.lock,
          color: CustomColors.white,
        ),
        const Icon(
          Icons.lock,
          color: CustomColors.white,
        ),
      ];
}
