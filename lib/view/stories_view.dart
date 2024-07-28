import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:gapsec/stories/pages/pages.dart';
import 'package:gapsec/stories/tabs/tabs.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:tab_container/tab_container.dart';
import 'package:video_player/video_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';

class StoriesView extends StatefulWidget {
  const StoriesView({super.key});

  @override
  _StoriesViewState createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView>
    with TickerProviderStateMixin {
  final StoriesState vm = StoriesState();
  late VideoPlayerController controller;
  late TabController tab1Controller;
  late TabController tab2Controller;
  late CarouselController carouselController;
  late TextTheme textTheme;
  int iconSelectedIndex = 0;
  String selectedTitle = "Murder";
  String selectedDescription = "Discipline is the best tool";

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
  }

  void updateIndex(int index, String title, String description) {
    setState(() {
      iconSelectedIndex = index;
      selectedTitle = title;
      selectedDescription = description;
    });
    print(iconSelectedIndex);
  }

  @override
  void didChangeDependencies() {
    textTheme = Theme.of(context).textTheme;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
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
                  width: Config.screenWidth! * 0.7,
                  height: Config.screenHeight,
                  child: Column(
                    children: [
                      Builder(
                        builder: (context) {
                          return CarouselSlider.builder(
                            itemCount:
                                pagesClass().pages(context: context).length,
                            carouselController: carouselController,
                            itemBuilder: (context, index, realIndex) {
                              return SizedBox(
                                width: Config.screenWidth! * 0.7,
                                height: 400,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Container(
                                    color: CustomColors.transparent,
                                    width: Config.screenWidth! * 0.7,
                                    height: 400,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  height: 400,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: CustomColors
                                                        .storyCardColor,
                                                  ),
                                                  //width: double.infinity,

                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(selectedTitle,
                                                            style: AppFonts
                                                                .storyTitle),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 8.0),
                                                          child:
                                                              DefaultTextStyle(
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 24.0,
                                                              fontFamily:
                                                                  'HorrorFont',
                                                            ),
                                                            child:
                                                                AnimatedTextKit(
                                                              key: ValueKey(
                                                                  selectedDescription),
                                                              isRepeatingAnimation:
                                                                  false,
                                                              animatedTexts: [
                                                                TyperAnimatedText(
                                                                    selectedDescription,
                                                                    speed: const Duration(
                                                                        milliseconds:
                                                                            50)),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  // width: double.infinity,
                                                  height: 400,
                                                  color: CustomColors
                                                      .scaffoldColor,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          updateIndex(
                                                              0,
                                                              murder.name,
                                                              murder
                                                                  .description);
                                                        },
                                                        icon: const Icon(
                                                            Icons.star),
                                                        color:
                                                            iconSelectedIndex == 0
                                                                ? CustomColors
                                                                    .red
                                                                : CustomColors
                                                                    .white,
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          updateIndex(
                                                              1,
                                                              dontLookBack.name,
                                                              dontLookBack
                                                                  .description);
                                                        },
                                                        icon: const Icon(
                                                            Icons.star),
                                                        color:
                                                            iconSelectedIndex == 1
                                                                ? CustomColors
                                                                    .red
                                                                : CustomColors
                                                                    .white,
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          updateIndex(
                                                              2,
                                                              lostLucy.name,
                                                              lostLucy
                                                                  .description);
                                                        },
                                                        icon: const Icon(
                                                            Icons.star),
                                                        color:
                                                            iconSelectedIndex == 2
                                                                ? CustomColors
                                                                    .red
                                                                : CustomColors
                                                                    .white,
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          updateIndex(
                                                              3,
                                                              runKaity.name,
                                                              runKaity
                                                                  .description);
                                                        },
                                                        icon: const Icon(
                                                            Icons.star),
                                                        color:
                                                            iconSelectedIndex == 3
                                                                ? CustomColors
                                                                    .red
                                                                : CustomColors
                                                                    .white,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: (Config.screenHeight! * 0.4),
                              autoPlay: false,
                              viewportFraction: 1,
                            ),
                          );
                        },
                      )
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
                    vm.goBack(context: context, historyName: "backButton");
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
}
