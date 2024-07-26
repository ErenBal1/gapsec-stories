import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:gapsec/stories/stories.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/widgets/stories_widget/card_one_page.dart';
import 'package:gapsec/widgets/stories_widget/card_widget.dart';
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
  late CarouselController carouselController;
  late TextTheme textTheme;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

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
    carouselController = CarouselController();
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
                  width: 300,
                  height: Config.screenHeight,
                  child: Column(
                    children: [
                      Builder(
                        builder: (context) {
                          return CarouselSlider.builder(
                            itemCount: stories(context: context).length,
                            carouselController: carouselController,
                            itemBuilder: (context, index, realIndex) {
                              return MyCard.cardOne(context: context, i: index);
                            },
                            options: CarouselOptions(
                              height: (Config.screenHeight! * 0.4),
                              autoPlay: false,
                              viewportFraction: 1,
                            ),
                            /* imgList
                                .map((item) => Container(
                                      child: Center(
                                          child: Image.network(
                                        item,
                                        fit: BoxFit.cover,
                                        width: 300,
                                        height: 300,
                                      )),
                                    ))
                                .toList(), */
                          );
                        },
                      )
                      /* SizedBox(
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
                      ), */
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
}
