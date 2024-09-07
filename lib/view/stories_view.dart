/* import 'package:adaptive_dialog/adaptive_dialog.dart';
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
            buySteps(
                minusAmount: -80,
                type: TextType.dontLookBackType,
                storyIsLock: dontLookBack.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 120:
          if (ShopState().amount >= 120) {
            buySteps(
                minusAmount: -120,
                type: TextType.lostLucyType,
                storyIsLock: lostLucy.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 100:
          if (ShopState().amount >= 100) {
            buySteps(
                minusAmount: -100,
                type: TextType.nightGameType,
                storyIsLock: nightGame.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }
          break;
        case 110:
          if (ShopState().amount >= 110) {
            buySteps(
                minusAmount: -110,
                type: TextType.runKaityType,
                storyIsLock: runKaity.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }
          break;

        case 150:
          if (ShopState().amount >= 150) {
            buySteps(
                minusAmount: -150,
                type: TextType.smileType,
                storyIsLock: smile.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 180:
          if (ShopState().amount >= 180) {
            buySteps(
                minusAmount: -180,
                type: TextType.behindType,
                storyIsLock: behind.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 300:
          if (ShopState().amount >= 300) {
            buySteps(
                minusAmount: -300,
                type: TextType.luckyType,
                storyIsLock: lucky.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        default:
      }
    }
  }

  void buySteps(
      {required int minusAmount,
      required TextType type,
      required bool storyIsLock}) {
    _addTokens(minusAmount).then(
      (value) async => await _databaseService
          .changeDefaultValue(type: type, newValue: false)
          .then(
        (value) {
          setState(() {
            itsFree = storyIsLock;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return PopScope(
      // kaydırarak geri dönmeyi engeller
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
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: Observer(builder: (_) {
                  return IconButton(
                      onPressed: () async {
                        vm.goBack(context: context);
                      },
                      icon: AppFonts.backButtonIcon);
                }),
              ),
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
                                        fontSize: 15.0,
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
                                      : buyIcon(context: context, price: price)
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
                                storySelectButton(
                                    storyName: murder.name,
                                    storyDescription: murder.description,
                                    storyIsLock: murder.isLock,
                                    selectedIndex: 0,
                                    musicName: "murder"),
                                storySelectButton(
                                    storyName: dontLookBack.name,
                                    storyDescription: dontLookBack.description,
                                    storyIsLock: dontLookBack.isLock,
                                    selectedIndex: 1,
                                    musicName: "dontLookBack"),
                                storySelectButton(
                                    storyName: lostLucy.name,
                                    storyDescription: lostLucy.description,
                                    storyIsLock: lostLucy.isLock,
                                    selectedIndex: 2,
                                    musicName: "lostLucy"),
                                storySelectButton(
                                    storyName: nightGame.name,
                                    storyDescription: nightGame.description,
                                    storyIsLock: nightGame.isLock,
                                    selectedIndex: 3,
                                    musicName: "nightGame"),
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
                                        fontSize: 15.0,
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
                                      : buyIcon(context: context, price: price)
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
                                storySelectButton(
                                    storyName: runKaity.name,
                                    storyDescription: runKaity.description,
                                    storyIsLock: runKaity.isLock,
                                    selectedIndex: 4,
                                    musicName: "runKaity"),
                                storySelectButton(
                                    storyName: smile.name,
                                    storyDescription: smile.description,
                                    storyIsLock: smile.isLock,
                                    selectedIndex: 5,
                                    musicName: "smile"),
                                storySelectButton(
                                    storyName: behind.name,
                                    storyDescription: behind.description,
                                    storyIsLock: behind.isLock,
                                    selectedIndex: 6,
                                    musicName: "behind"),
                                storySelectButton(
                                    storyName: lucky.name,
                                    storyDescription: lucky.description,
                                    storyIsLock: lucky.isLock,
                                    selectedIndex: 7,
                                    musicName: "lucky")
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

  InkWell buyIcon({required int price, required BuildContext context}) {
    return InkWell(
      onTap: () {
        showOkCancelAlert(context, price);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            price.toString(),
            style: const TextStyle(
                color: CustomColors.white,
                fontFamily: "PixelFont",
                fontSize: 15),
          ),
          const SizedBox(
            width: 5,
          ),
          CircleAvatar(
            radius: 20,
            child: Image.asset(
              "assets/images/mystoken.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  IconButton storySelectButton(
      {required String storyName,
      required String storyDescription,
      required bool storyIsLock,
      required int selectedIndex,
      required String musicName}) {
    return IconButton(
      onPressed: () {
        updateIndex(selectedIndex, storyName, storyDescription);
        playNewTrack("assets/sounds/$musicName.mp3");
      },
      icon:
          storyIsLock == true ? const Icon(Icons.lock) : const Icon(Icons.star),
      color: iconSelectedIndex == selectedIndex
          ? CustomColors.selectedIconColor
          : storyIsLock == true
              ? CustomColors.red
              : CustomColors.white,
    );
  }

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
 */
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/state/shop_state/shop_state.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/view/new_game_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';

class StoriesView extends StatefulWidget {
  const StoriesView({super.key});

  @override
  _StoriesViewState createState() => _StoriesViewState();
}

class _StoriesViewState extends State<StoriesView>
    with TickerProviderStateMixin {
  final StoriesState vm = StoriesState();
  late VideoPlayerController mp4controller;
  late VideoPlayerController mp3controller;
  final HomeState hs = HomeState();
  late CarouselSliderController carouselController;
  late TextTheme textTheme;
  final _databaseService = DatabaseService();
  int iconSelectedIndex = 0;
  bool itsFree = true;
  String selectedTitle = murder.name;
  String selectedDescription = murder.description;
  int activeIndex = 0;
  int price = 0;
  String mp4Path = "assets/videos/thunder.mp4";
  String mp3Path = "assets/sounds/murder.mp3";

  @override
  void initState() {
    super.initState();
    mp4controller = VideoPlayerController.asset(mp4Path)
      ..initialize().then((_) {
        mp4controller.setLooping(true);
        setState(() {
          mp4controller.value.isPlaying
              ? mp4controller.pause()
              : mp4controller.play();
        });
      });
    mp3controller = VideoPlayerController.asset(mp3Path)
      ..initialize().then((_) {
        mp3controller.setLooping(true);
        setState(() {
          mp3controller.value.isPlaying
              ? mp3controller.pause()
              : mp3controller.play();
        });
      });
    carouselController = CarouselSliderController();
  }

  @override
  void dispose() {
    mp3controller.dispose();
    mp4controller.dispose();
    super.dispose();
  }

  void playNewTrack({required String mp4Path, required String? mp3Path}) {
    mp4controller.pause(); // Mevcut müziği durdur
    mp4controller.dispose(); // Kaynakları serbest bırak
    mp3controller.pause();
    mp3controller.dispose();

    // Yeni controller ile yeni dosya yükleniyor
    mp4controller = VideoPlayerController.asset(mp4Path)
      ..initialize().then((_) {
        mp4controller.setLooping(true);
        setState(() {
          mp4controller.value.isPlaying
              ? mp4controller.pause()
              : mp4controller.play();
        });
      }).catchError((error) {
        // Hata oluşursa konsola yaz
        print("Error initializing new track: $error");
      });
    if (mp3Path != null && mp3Path.isNotEmpty) {
      mp3controller = VideoPlayerController.asset(mp3Path)
        ..initialize().then((_) {
          mp3controller.setLooping(true);
          setState(() {
            mp3controller.value.isPlaying
                ? mp3controller.pause()
                : mp3controller.play();
          });
        }).catchError((error) {
          // Hata oluşursa konsola yaz
          print("Error initializing new track: $error");
        });
    }
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
            mp4Path = "assets/videos/thunder.mp4";
            mp3Path = "assets/sounds/murder.mp3";
            playNewTrack(mp4Path: mp4Path, mp3Path: mp3Path);
          });
          break;
        case 1:
          setState(() {
            price = 80;
            itsFree = !dontLookBack.isLock;
            mp4Path = "assets/videos/somin.mp4";
            mp3Path = "assets/sounds/dontLookBack.mp3";
            playNewTrack(mp4Path: mp4Path, mp3Path: "");
          });
          break;
        case 2:
          setState(() {
            price = 120;
            itsFree = !lostLucy.isLock;
            mp4Path = "assets/videos/continue-background-video.mp4";
            mp3Path = "assets/sounds/lostLucy.mp3";
            playNewTrack(mp4Path: mp4Path, mp3Path: mp3Path);
          });
          break;
        case 3:
          setState(() {
            itsFree = !nightGame.isLock;
            price = 100;
            mp4Path = "assets/videos/continue-background-video.mp4";
            mp3Path = "assets/sounds/nightGame.mp3";
            playNewTrack(mp4Path: mp4Path, mp3Path: mp3Path);
          });
          break;
        case 4:
          setState(() {
            price = 110;
            itsFree = !runKaity.isLock;
            mp4Path = "assets/videos/continue-background-video.mp4";
            mp3Path = "assets/sounds/runKaity.mp3";
            playNewTrack(mp4Path: mp4Path, mp3Path: mp3Path);
          });
          break;
        case 5:
          setState(() {
            price = 150;
            itsFree = !smile.isLock;
            mp4Path = "assets/videos/continue-background-video.mp4";
            mp3Path = "assets/sounds/smile.mp3";
            playNewTrack(mp4Path: mp4Path, mp3Path: mp3Path);
          });
          break;
        case 6:
          setState(() {
            price = 180;
            itsFree = !behind.isLock;
            mp4Path = "assets/videos/continue-background-video.mp4";
            mp3Path = "assets/sounds/behind.mp3";
            playNewTrack(mp4Path: mp4Path, mp3Path: mp3Path);
          });
          break;
        case 7:
          setState(() {
            price = 300;
            itsFree = !lucky.isLock;
            mp4Path = "assets/videos/continue-background-video.mp4";
            mp3Path = "assets/sounds/lucky.mp3";
            playNewTrack(mp4Path: mp4Path, mp3Path: mp3Path);
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
            buySteps(
                minusAmount: -80,
                type: TextType.dontLookBackType,
                storyIsLock: dontLookBack.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 120:
          if (ShopState().amount >= 120) {
            buySteps(
                minusAmount: -120,
                type: TextType.lostLucyType,
                storyIsLock: lostLucy.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 100:
          if (ShopState().amount >= 100) {
            buySteps(
                minusAmount: -100,
                type: TextType.nightGameType,
                storyIsLock: nightGame.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }
          break;
        case 110:
          if (ShopState().amount >= 110) {
            buySteps(
                minusAmount: -110,
                type: TextType.runKaityType,
                storyIsLock: runKaity.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }
          break;

        case 150:
          if (ShopState().amount >= 150) {
            buySteps(
                minusAmount: -150,
                type: TextType.smileType,
                storyIsLock: smile.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 180:
          if (ShopState().amount >= 180) {
            buySteps(
                minusAmount: -180,
                type: TextType.behindType,
                storyIsLock: behind.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        case 300:
          if (ShopState().amount >= 300) {
            buySteps(
                minusAmount: -300,
                type: TextType.luckyType,
                storyIsLock: lucky.isLock);
          } else {
            showOkAlertDialogWidget(context, "Marketten Mystoken al");
          }

          break;
        default:
      }
    }
  }

  void buySteps(
      {required int minusAmount,
      required TextType type,
      required bool storyIsLock}) {
    _addTokens(minusAmount).then(
      (value) async => await _databaseService
          .changeDefaultValue(type: type, newValue: false)
          .then(
        (value) {
          setState(() {
            itsFree = storyIsLock;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Color(0xFF3D0000)],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: _buildStoryCarousel(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => vm.goBack(context: context),
          ),
          Text(
            "STORIES",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'HorrorFont',
              letterSpacing: 2,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.red.withOpacity(0.5),
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber, width: 1),
            ),
            child: Row(
              children: [
                Text(
                  "${ShopState().amount}",
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Image.asset(ConstantPaths.tokenImagePath,
                    height: 24, width: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryCarousel() {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: games().historiesGames.length,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.70,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
                updateIndex(index, games().historiesGames[index].name,
                    games().historiesGames[index].description);
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return _buildStoryCard(games().historiesGames[index]);
          },
        ),
        const SizedBox(height: 20),
        buildIndicator(),
      ],
    );
  }

  Widget _buildStoryCard(StoryModel story) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.red[800]!, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.3),
            blurRadius: 15.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            // Video arka planı
            Container(
              child: VideoPlayer(mp4controller),
            ),
            // Hikaye içeriği
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'HorrorFont',
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: Colors.red.withOpacity(0.6),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          story.description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    story.isLock
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    showOkCancelAlert(context, price),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[700],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                child: const Text('Satın Al',
                                    style: TextStyle(fontSize: 16)),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.amber, width: 1),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '$price',
                                      style: const TextStyle(
                                        color: Colors.amber,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Image.asset(ConstantPaths.tokenImagePath,
                                        height: 24, width: 24),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              // Hikayeye başlama işlemi
                              await mp3controller.dispose();
                              await mp4controller.dispose();

                              hs.goToPage(
                                  context: context, page: const NewGameView());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[800],
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text('Hikayeye Başla',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: CustomColors.cyanBlue)),
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

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: games().historiesGames.length,
      effect: CustomizableEffect(
        spacing: 8,
        dotDecoration: DotDecoration(
          width: 10,
          height: 10,
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        activeDotDecoration: DotDecoration(
          width: 20,
          height: 10,
          color: Colors.red,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
