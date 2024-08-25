import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/state/shop_state/shop_state.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
  late CarouselSliderController carouselController;
  late TextTheme textTheme;
  final _databaseService = DatabaseService();
  int iconSelectedIndex = 0;
  bool itsFree = true;
  String selectedTitle = murder.name;
  String selectedDescription = murder.description;
  String mp3Path = "assets/sounds/murder.mp3";
  int activeIndex = 0;
  int price = 0;

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
    carouselController = CarouselSliderController();
  }

  Future<void> _addTokens(int amount) async {
    await _databaseService.addTokens(amount);
    setState(() {});
  }

  Future<void> updateIndex(int index, String title, String description) async {
    await DatabaseService().updateDefaultValues();
    setState(() {
      iconSelectedIndex = index;
      selectedTitle = title;
      selectedDescription = description;
      switch (iconSelectedIndex) {
        case 0:
          setState(() {
            price = 0;
            itsFree = !murder.isLock;
          });
          break;
        case 1:
          setState(() {
            price = 80;
            itsFree = !dontLookBack.isLock;
          });
          break;
        case 2:
          itsFree = !lostLucy.isLock;
          setState(() {
            price = 120;
          });
          break;
        case 3:
          itsFree = !nightGame.isLock;
          setState(() {
            price = 100;
          });
          break;
        case 4:
          itsFree = !runKaity.isLock;
          setState(() {
            price = 110;
          });
          break;
        case 5:
          itsFree = !smile.isLock;
          setState(() {
            price = 150;
          });
          break;
        case 6:
          itsFree = !behind.isLock;
          setState(() {
            price = 180;
          });
          break;
        case 7:
          itsFree = !lucky.isLock;
          setState(() {
            price = 300;
          });
        default:
      }
    });
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

  Future<void> showOkAlertDialogWidget(
      BuildContext context, String message) async {
    final result = await showOkAlertDialog(
      context: context,
      title: 'Yetersiz bakiye :( ',
      message: message,
      okLabel: 'OK',
    );
    if (result == OkCancelResult.ok) {
      print("Yetersiz bakiye onaylandı");
    }
  }

  Future<void> showOkCancelAlert(BuildContext context, int storyPrice) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: 'Hikaye Kilidi Aç',
      message: '$price Mystoken ile alınsın mı?',
      okLabel: 'Evet',
      cancelLabel: 'Hayır',
    );

    if (result == OkCancelResult.ok) {
      switch (storyPrice) {
        case 80:
          if (ShopState().amount >= 80) {
            _addTokens(-80).then(
              (value) async => await _databaseService
                  .changeDefaultValue(
                      type: TextType.dontLookBackType, newValue: false)
                  .then(
                (value) {
                  setState(() {
                    itsFree = dontLookBack.isLock;
                  });
                },
              ),
            );
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 120:
          if (ShopState().amount >= 120) {
            _addTokens(-120).then(
              (value) async => await _databaseService
                  .changeDefaultValue(
                      type: TextType.lostLucyType, newValue: false)
                  .then(
                (value) {
                  setState(() {
                    itsFree = lostLucy.isLock;
                  });
                },
              ),
            );
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 100:
          if (ShopState().amount >= 100) {
            _addTokens(-100).then(
              (value) async => await _databaseService
                  .changeDefaultValue(
                      type: TextType.nightGameType, newValue: false)
                  .then(
                (value) {
                  setState(() {
                    itsFree = nightGame.isLock;
                  });
                },
              ),
            );
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }
          break;
        case 110:
          if (ShopState().amount >= 110) {
            _addTokens(-110).then(
              (value) async => await _databaseService
                  .changeDefaultValue(
                      type: TextType.runKaityType, newValue: false)
                  .then(
                (value) {
                  setState(() {
                    itsFree = runKaity.isLock;
                  });
                },
              ),
            );
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }
          break;

        case 150:
          if (ShopState().amount >= 150) {
            _addTokens(-150).then(
              (value) async => await _databaseService
                  .changeDefaultValue(type: TextType.smileType, newValue: false)
                  .then(
                (value) {
                  setState(() {
                    itsFree = smile.isLock;
                  });
                },
              ),
            );
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 180:
          if (ShopState().amount >= 180) {
            _addTokens(-180).then(
              (value) async => await _databaseService
                  .changeDefaultValue(
                      type: TextType.behindType, newValue: false)
                  .then(
                (value) {
                  setState(() {
                    itsFree = behind.isLock;
                  });
                },
              ),
            );
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 300:
          if (ShopState().amount >= 300) {
            _addTokens(-300).then(
              (value) async => await _databaseService
                  .changeDefaultValue(type: TextType.luckyType, newValue: false)
                  .then(
                (value) {
                  setState(() {
                    itsFree = lucky.isLock;
                  });
                },
              ),
            );
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        default:
      }
    }
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
                              return pages()[index];
                            },
                            options: CarouselOptions(
                                enableInfiniteScroll: false,
                                height: (Config.screenHeight! * 0.4),
                                autoPlay: false,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) async {
                                  setState(() => activeIndex = index);
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
                    vm.goBack(context: context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: CustomColors.white,
                  ),
                );
              }),
            ),
            Positioned(
                top: Config.screenHeight! * 0.44,
                right: Config.screenWidth! * 0.38,
                child: buildIndicator())
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
                                  const Spacer(),
                                  itsFree
                                      ? Text(
                                          "UNLOCKED",
                                          style: AppFonts.freeTitle,
                                        )
                                      : InkWell(
                                          onTap: () {
                                            showOkCancelAlert(context, price);
                                            print(price.toString());
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                price.toString(),
                                                style: const TextStyle(
                                                    color: CustomColors.white,
                                                    fontFamily: "PixelFont",
                                                    fontSize: 20),
                                              ),
                                              CircleAvatar(
                                                radius: 25,
                                                child: Image.asset(
                                                  "assets/images/mystoken.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                  /* Text(
                                    !itsFree ? "free" : "10dollar",
                                    style: const TextStyle(
                                        color: CustomColors.white),
                                  ) */
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
                            color: CustomColors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        0, murder.name, murder.description);
                                    playNewTrack("assets/sounds/murder.mp3");
                                  },
                                  icon: murder.isLock == true
                                      ? const Icon(Icons.lock)
                                      : const Icon(Icons.star),
                                  color: iconSelectedIndex == 0
                                      ? CustomColors.selectedIconColor
                                      : murder.isLock == true
                                          ? CustomColors.red
                                          : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(1, dontLookBack.name,
                                        dontLookBack.description);
                                    playNewTrack(
                                        "assets/sounds/dontLookBack.mp3");
                                  },
                                  icon: dontLookBack.isLock == true
                                      ? const Icon(Icons.lock)
                                      : const Icon(Icons.star),
                                  color: iconSelectedIndex == 1
                                      ? CustomColors.selectedIconColor
                                      : dontLookBack.isLock == true
                                          ? CustomColors.red
                                          : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        2, lostLucy.name, lostLucy.description);
                                    playNewTrack("assets/sounds/lostLucy.mp3");
                                  },
                                  icon: lostLucy.isLock == true
                                      ? const Icon(Icons.lock)
                                      : const Icon(Icons.star),
                                  color: iconSelectedIndex == 2
                                      ? CustomColors.selectedIconColor
                                      : lostLucy.isLock == true
                                          ? CustomColors.red
                                          : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(3, nightGame.name,
                                        nightGame.description);
                                    playNewTrack("assets/sounds/nightGame.mp3");
                                  },
                                  icon: nightGame.isLock == true
                                      ? const Icon(Icons.lock)
                                      : const Icon(Icons.star),
                                  color: iconSelectedIndex == 3
                                      ? CustomColors.selectedIconColor
                                      : nightGame.isLock == true
                                          ? CustomColors.red
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
                                  const Spacer(),
                                  itsFree
                                      ? Text(
                                          "UNLOCKED",
                                          style: AppFonts.freeTitle,
                                        )
                                      : InkWell(
                                          onTap: () {
                                            showOkCancelAlert(context, price);
                                            print(price.toString());
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                price.toString(),
                                                style: const TextStyle(
                                                    color: CustomColors.white,
                                                    fontFamily: "PixelFont",
                                                    fontSize: 20),
                                              ),
                                              CircleAvatar(
                                                radius: 25,
                                                child: Image.asset(
                                                  "assets/images/mystoken.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
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
                            color: CustomColors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        4, runKaity.name, runKaity.description);
                                    playNewTrack("assets/sounds/runKaity.mp3");
                                  },
                                  icon: runKaity.isLock == true
                                      ? const Icon(Icons.lock)
                                      : const Icon(Icons.star),
                                  color: iconSelectedIndex == 4
                                      ? CustomColors.selectedIconColor
                                      : runKaity.isLock == true
                                          ? CustomColors.red
                                          : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        5, smile.name, smile.description);
                                    playNewTrack("assets/sounds/smile.mp3");
                                  },
                                  icon: smile.isLock == true
                                      ? const Icon(Icons.lock)
                                      : const Icon(Icons.star),
                                  color: iconSelectedIndex == 5
                                      ? CustomColors.selectedIconColor
                                      : smile.isLock == true
                                          ? CustomColors.red
                                          : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        6, behind.name, behind.description);
                                    playNewTrack("assets/sounds/behind.mp3");
                                  },
                                  icon: behind.isLock == true
                                      ? const Icon(Icons.lock)
                                      : const Icon(Icons.star),
                                  color: iconSelectedIndex == 6
                                      ? CustomColors.selectedIconColor
                                      : behind.isLock == true
                                          ? CustomColors.red
                                          : CustomColors.white,
                                ),
                                IconButton(
                                  onPressed: () {
                                    updateIndex(
                                        7, lucky.name, lucky.description);
                                    playNewTrack("assets/sounds/lucky.mp3");
                                  },
                                  icon: lucky.isLock == true
                                      ? const Icon(Icons.lock)
                                      : const Icon(Icons.star),
                                  color: iconSelectedIndex == 7
                                      ? CustomColors.selectedIconColor
                                      : lucky.isLock == true
                                          ? CustomColors.red
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
  Widget buildIndicator() => AnimatedSmoothIndicator(
        effect: CustomizableEffect(
          spacing: 3,
          dotDecoration: DotDecoration(
            width: 10,
            dotBorder: const DotBorder(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          activeDotDecoration: DotDecoration(
            width: 10,
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
        ),
        activeIndex: activeIndex,
        count: 2,
      );
}
