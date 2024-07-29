import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:gapsec/utils/app_font.dart';
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
  late VideoPlayerController mp3controller;
  late TabController tab1Controller;
  late TabController tab2Controller;
  late CarouselController carouselController;
  late TextTheme textTheme;
  int iconSelectedIndex = 0;
  String selectedTitle = "Murder";
  String selectedDescription = "Discipline is the best tool";
  String mp3Path = "assets/sounds/murder.mp3";

  @override
  void initState() {
    super.initState();
    mp3controller = VideoPlayerController.asset(mp3Path)
      ..initialize().then((_) {
        mp3controller.setLooping(true);
        setState(() {
          mp3controller.value.isPlaying
              ? mp3controller.pause()
              : mp3controller.play();
        });
      });
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
    print(iconSelectedIndex);
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
    mp3controller.dispose();
    controller.dispose();
    super.dispose();
  }

  void playNewTrack(String newPath) {
    mp3controller.pause(); // Mevcut müziği durdur
    mp3controller.dispose(); // Kaynakları serbest bırak

    // Yeni controller ile yeni dosya yükleniyor
    mp3controller = VideoPlayerController.asset(newPath)
      ..initialize().then((_) {
        setState(() {
          mp3controller.play(); // Yeni dosyayı oynat
          mp3controller.setLooping(true); // Müziği döngüye al
        });
      }).catchError((error) {
        // Hata oluşursa konsola yaz
        print("Error initializing new track: $error");
      });
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
                            itemCount: 2,
                            carouselController: carouselController,
                            itemBuilder: (context, index, realIndex) {
                              return pages()[
                                  index]; /* SizedBox(
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
                                                        color: iconSelectedIndex ==
                                                                0
                                                            ? CustomColors
                                                                .selectedIconColor
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
                                                        color: iconSelectedIndex ==
                                                                1
                                                            ? CustomColors
                                                                .selectedIconColor
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
                                                        color: iconSelectedIndex ==
                                                                2
                                                            ? CustomColors
                                                                .selectedIconColor
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
                                                          Icons.star,
                                                        ),
                                                        color: iconSelectedIndex ==
                                                                3
                                                            ? CustomColors
                                                                .selectedIconColor
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
                              ); */
                            },
                            options: CarouselOptions(
                                height: (Config.screenHeight! * 0.4),
                                autoPlay: false,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  index == 0
                                      ? updateIndex(
                                          0, "Murder", "Murder Descrption")
                                      : updateIndex(4, "Run Kaity",
                                          "Run Kaity best tool");
                                  index == 0
                                      ? playNewTrack("assets/sounds/murder.mp3")
                                      : playNewTrack(
                                          "assets/sounds/runKaity.mp3");
                                }),
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

  List pages() => <Widget>[
        SizedBox(
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
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: CustomColors.storyCardColor,
                            ),
                            //width: double.infinity,

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(selectedTitle,
                                      style: AppFonts.storyTitle),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: DefaultTextStyle(
                                      style: const TextStyle(
                                        fontSize: 24.0,
                                        fontFamily: 'HorrorFont',
                                      ),
                                      child: AnimatedTextKit(
                                        key: ValueKey(selectedDescription),
                                        isRepeatingAnimation: false,
                                        animatedTexts: [
                                          TyperAnimatedText(selectedDescription,
                                              speed: const Duration(
                                                  milliseconds: 50)),
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
                            color: CustomColors.scaffoldColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        0, murder.name, murder.description);
                                    playNewTrack("assets/sounds/murder.mp3");
                                  },
                                  icon: const Icon(Icons.star),
                                  color: iconSelectedIndex == 0
                                      ? CustomColors.selectedIconColor
                                      : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(1, dontLookBack.name,
                                        dontLookBack.description);
                                    playNewTrack(
                                        "assets/sounds/dontLookBack.mp3");
                                  },
                                  icon: const Icon(Icons.star),
                                  color: iconSelectedIndex == 1
                                      ? CustomColors.selectedIconColor
                                      : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        2, lostLucy.name, lostLucy.description);
                                    playNewTrack("assets/sounds/lostLucy.mp3");
                                  },
                                  icon: const Icon(Icons.star),
                                  color: iconSelectedIndex == 2
                                      ? CustomColors.selectedIconColor
                                      : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(3, nightGame.name,
                                        nightGame.description);
                                    playNewTrack("assets/sounds/nightGame.mp3");
                                  },
                                  icon: const Icon(
                                    Icons.star,
                                  ),
                                  color: iconSelectedIndex == 3
                                      ? CustomColors.selectedIconColor
                                      : CustomColors.white,
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
        ),
        SizedBox(
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
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: CustomColors.storyCardColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(selectedTitle,
                                      style: AppFonts.storyTitle),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: DefaultTextStyle(
                                      style: const TextStyle(
                                        fontSize: 24.0,
                                        fontFamily: 'HorrorFont',
                                      ),
                                      child: AnimatedTextKit(
                                        key: ValueKey(selectedDescription),
                                        isRepeatingAnimation: false,
                                        animatedTexts: [
                                          TyperAnimatedText(selectedDescription,
                                              speed: const Duration(
                                                  milliseconds: 50)),
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
                            color: CustomColors.scaffoldColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        4, runKaity.name, runKaity.description);
                                    playNewTrack("assets/sounds/runKaity.mp3");
                                  },
                                  icon: const Icon(Icons.star),
                                  color: iconSelectedIndex == 4
                                      ? CustomColors.selectedIconColor
                                      : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        5, smile.name, smile.description);
                                    playNewTrack("assets/sounds/smile.mp3");
                                  },
                                  icon: const Icon(Icons.star),
                                  color: iconSelectedIndex == 5
                                      ? CustomColors.selectedIconColor
                                      : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        6, behind.name, behind.description);
                                    playNewTrack("assets/sounds/behind.mp3");
                                  },
                                  icon: const Icon(Icons.star),
                                  color: iconSelectedIndex == 6
                                      ? CustomColors.selectedIconColor
                                      : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        7, lucky.name, lucky.description);
                                    playNewTrack("assets/sounds/lucky.mp3");
                                  },
                                  icon: const Icon(
                                    Icons.star,
                                  ),
                                  color: iconSelectedIndex == 7
                                      ? CustomColors.selectedIconColor
                                      : CustomColors.white,
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
        )
      ];
}
