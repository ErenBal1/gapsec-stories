import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/state/shop_state/shop_state.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/view/home_view.dart';
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
  final _databaseService = DatabaseService();

  @override
  void initState() {
    super.initState();
    vm.mp4controller = VideoPlayerController.asset(vm.mp4Path)
      ..initialize().then((_) {
        vm.mp4controller.setLooping(true);
        setState(() {
          vm.mp4controller.value.isPlaying
              ? vm.mp4controller.pause()
              : vm.mp4controller.play();
        });
      });
    vm.carouselController = CarouselSliderController();
  }

  @override
  void dispose() {
    vm.mp4controller.dispose();
    super.dispose();
  }

  Future<void> _addTokens(int amount) async {
    await _databaseService.addTokens(amount);
    setState(() {});
  }

  Future<void> showOkAlertDialogWidget(
      BuildContext context, String message) async {
    final result = await showOkAlertDialog(
      context: context,
      title: ConstantTexts.InadequateMystoken.tr(),
      message: message,
      okLabel: ConstantTexts.okay,
    );
    if (result == OkCancelResult.ok) {
      //  print("Yetersiz bakiye onaylandı");
    }
  }

  Future<void> showOkCancelAlert(BuildContext context, int storyPrice) async {
    final result = await showOkCancelAlertDialog(
      context: context,
      title: ConstantTexts.UnlockThis.tr(),
      message: '${vm.price} ${ConstantTexts.ShouldBuy.tr()}',
      okLabel: ConstantTexts.yes.tr(),
      cancelLabel: ConstantTexts.no.tr(),
    );

    if (result == OkCancelResult.ok) {
      switch (storyPrice) {
        case 0:
          if (ShopState().amount >= 0) {
            buySteps(
                minusAmount: 0,
                type: TextType.murderType,
                storyIsLock: murder.isLock);
          } else {
            showOkAlertDialogWidget(
                context, ConstantTexts.GetMoreMystoken.tr());
          }

          break;
        case 80:
          if (ShopState().amount >= 80) {
            buySteps(
                minusAmount: -80,
                type: TextType.gravehurstType,
                storyIsLock: gravehurst.isLock);
          } else {
            showOkAlertDialogWidget(
                context, ConstantTexts.GetMoreMystoken.tr());
          }

          break;
        case 120:
          if (ShopState().amount >= 120) {
            buySteps(
                minusAmount: -120,
                type: TextType.webOfDeceitType,
                storyIsLock: webOfDeceit.isLock);
          } else {
            showOkAlertDialogWidget(
                context, ConstantTexts.GetMoreMystoken.tr());
          }

          break;
        case 100:
          if (ShopState().amount >= 100) {
            buySteps(
                minusAmount: -100,
                type: TextType.zetaType,
                storyIsLock: zeta.isLock);
          } else {
            showOkAlertDialogWidget(
                context, ConstantTexts.GetMoreMystoken.tr());
          }
          break;
        case 110:
          if (ShopState().amount >= 110) {
            buySteps(
                minusAmount: -110,
                type: TextType.unknownType,
                storyIsLock: unknown.isLock);
          } else {
            showOkAlertDialogWidget(
                context, ConstantTexts.GetMoreMystoken.tr());
          }
          break;

        case 150:
          if (ShopState().amount >= 150) {
            buySteps(
                minusAmount: -150,
                type: TextType.mysteriousType,
                storyIsLock: mysterious.isLock);
          } else {
            showOkAlertDialogWidget(
                context, ConstantTexts.GetMoreMystoken.tr());
          }

          break;
        case 180:
          if (ShopState().amount >= 180) {
            buySteps(
                minusAmount: -180,
                type: TextType.spaceType,
                storyIsLock: space.isLock);
          } else {
            showOkAlertDialogWidget(
                context, ConstantTexts.GetMoreMystoken.tr());
          }

          break;
        case 300:
          if (ShopState().amount >= 300) {
            buySteps(
                minusAmount: -300,
                type: TextType.luckyType,
                storyIsLock: lucky.isLock);
          } else {
            showOkAlertDialogWidget(
                context, ConstantTexts.GetMoreMystoken.tr());
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
          vm.updateItsFree(newItsFree: storyIsLock);
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
            onPressed: () =>
                vm.goToPageRemoveUntilPush(context: context, page: HomeView()),
          ),
          Text(
            ConstantTexts.Stories.tr(),
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
          itemCount: Games().historiesGames.length,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.70,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              vm.updateActiveIndex(newIndex: index);

              vm.updateIndex(index, Games().historiesGames[index].name,
                  Games().historiesGames[index].description);
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return _buildStoryCard(Games().historiesGames[index]);
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
            // ignore: avoid_unnecessary_containers
            /* Container(
              child: Observer(builder: (_) {
                return VideoPlayer(vm.mp4controller);
              }),
            ), */
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Observer(builder: (_) {
                return Image.asset(
                  "assets/images/${vm.newBackground}",
                  fit: BoxFit.fill,
                );
              }),
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
                        ? Column(
                            children: [
                              Text(
                                  "${story.finish} ${ConstantTexts.Endings.tr()}",
                                  style: const TextStyle(
                                      color: CustomColors.yellow,
                                      shadows: [
                                        Shadow(
                                            color: CustomColors.white,
                                            offset: Offset(1, 2),
                                            blurRadius: 6.0)
                                      ],
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () =>
                                          showOkCancelAlert(context, vm.price),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            58, 244, 67, 54),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              color: CustomColors.yellow),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: Text(ConstantTexts.BuyNow.tr(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: CustomColors.yellow)),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: CustomColors.red, width: 1),
                                      ),
                                      child: Row(
                                        children: [
                                          Observer(builder: (_) {
                                            return Text(
                                              '${vm.price}',
                                              style: const TextStyle(
                                                fontFamily: "HorrorFont",
                                                color: CustomColors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          }),
                                          const SizedBox(width: 5),
                                          Image.asset(
                                            ConstantPaths.tokenImagePath,
                                            height: 25,
                                            width: 25,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // Hikayeye başlama işlemi
                                    await vm.mp4controller.dispose();

                                    vm.goToPage(
                                        context: context,
                                        page: const NewGameView());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(58, 244, 67, 54),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              182, 255, 235, 59)),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Text(ConstantTexts.StartStory.tr(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            Shadow(
                                                color: CustomColors.white,
                                                offset: Offset(0, 1),
                                                blurRadius: 80.0)
                                          ],
                                          color: CustomColors.red)),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                  "${story.finish} ${ConstantTexts.Endings.tr()}",
                                  style: const TextStyle(
                                      shadows: [
                                        Shadow(
                                            color: CustomColors.yellow,
                                            offset: Offset(1, 2),
                                            blurRadius: 6.0)
                                      ],
                                      color: CustomColors.yellow,
                                      fontWeight: FontWeight.bold)),
                            ],
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
    return Observer(builder: (_) {
      return AnimatedSmoothIndicator(
        activeIndex: vm.activeIndex,
        count: Games().historiesGames.length,
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
    });
  }
}
