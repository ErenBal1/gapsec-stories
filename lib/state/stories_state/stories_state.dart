import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:mobx/mobx.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';

part 'stories_state.g.dart';

class StoriesState = _StoriesStateBase with _$StoriesState;

abstract class _StoriesStateBase with Store {
  final DatabaseService _databaseService = DatabaseService();

  @observable
  late VideoPlayerController mp4controller;

  @observable
  late CarouselSliderController carouselController;

  @observable
  int activeIndex = 0;

  @observable
  int iconSelectedIndex = 0;

  @observable
  int price = 0;

  @observable
  bool itsFree = true;

  @observable
  String newBackground = "murder.png";

  @observable
  String selectedTitle = murder.name;

  @observable
  String selectedDescription = murder.description;

  @observable
  String mp4Path = "assets/sounds/murder.mp3";

  @action
  void goToPageRemoveUntilPush(
      {required BuildContext context, required Widget page}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: page,
      ),
      (route) => false,
    );
  }

  @action
  void updateMp4Path({required String newPath}) {
    mp4Path = newPath;
  }

  @action
  void updateBackground({required String newImagePath}) {
    newBackground = newImagePath;
  }

  @action
  void updateTitle({required String newTitle}) {
    selectedTitle = newTitle;
  }

  @action
  void updateDescription({required String newDescription}) {
    selectedDescription = newDescription;
  }

  @action
  void updateIconSelectedIndex({required int newIconSelectedIndex}) {
    iconSelectedIndex = newIconSelectedIndex;
  }

  @action
  void updateItsFree({required bool newItsFree}) {
    itsFree = newItsFree;
  }

  @action
  void updatePrice({required int newPrice}) {
    price = newPrice;
  }

  @action
  void updateActiveIndex({required int newIndex}) {
    activeIndex = newIndex;
  }

  @action
  Future<void> deleteAllStories({required TextType type}) async {
    final DatabaseService databaseService = DatabaseService();
    await databaseService.selectedStoryDelete(type: type);
  }

  @action
  Future<void> updateIndex(int index, String title, String description) async {
    await _databaseService.updateDefaultValues();
    updateIconSelectedIndex(newIconSelectedIndex: index);
    updateTitle(newTitle: title);
    updateDescription(newDescription: description);

    switch (iconSelectedIndex) {
      case 0:
        updatePrice(newPrice: 0);
        updateItsFree(newItsFree: !murder.isLock);
        updateBackground(newImagePath: "murder.png");
        updateMp4Path(newPath: "assets/sounds/murder.mp3");
        playNewTrack(mp4Path: mp4Path);
        break;
      case 1:
        updatePrice(newPrice: 80);
        updateItsFree(newItsFree: !gravehurst.isLock);
        updateBackground(newImagePath: "gravehurst.png");
        updateMp4Path(newPath: "assets/sounds/gravehurst.mp3");
        playNewTrack(mp4Path: mp4Path);
        break;
      case 2:
        updatePrice(newPrice: 120);
        updateItsFree(newItsFree: !webOfDeceit.isLock);
        updateBackground(newImagePath: "webOfDeceit.png");
        updateMp4Path(newPath: "assets/sounds/smile.mp3");
        playNewTrack(mp4Path: mp4Path);
        break;
      case 3:
        updatePrice(newPrice: 100);
        updateItsFree(newItsFree: !zeta.isLock);
        updateBackground(newImagePath: "zeta.png");
        updateMp4Path(newPath: "assets/sounds/zeta.mp3");
        playNewTrack(mp4Path: mp4Path);
        break;
      case 4:
        updatePrice(newPrice: 110);
        updateItsFree(newItsFree: !unknown.isLock);
        updateBackground(newImagePath: "unknown.png");
        updateMp4Path(newPath: "assets/sounds/unknownNumber.mp3");
        playNewTrack(mp4Path: mp4Path);
        break;
      case 5:
        updatePrice(newPrice: 150);
        updateItsFree(newItsFree: !mysterious.isLock);
        updateBackground(newImagePath: "mysterious.png");
        updateMp4Path(newPath: "assets/sounds/mysteriousLoss.mp3");
        playNewTrack(mp4Path: mp4Path);
        break;
      case 6:
        updatePrice(newPrice: 180);
        updateItsFree(newItsFree: !space.isLock);
        updateBackground(newImagePath: "space.png");
        updateMp4Path(newPath: "assets/sounds/spaceby.mp3");
        playNewTrack(mp4Path: mp4Path);
        break;
      /* case 7:
        updatePrice(newPrice: 300);
        updateItsFree(newItsFree: !lucky.isLock);
        updateBackground(newImagePath: "gravehurst.png");
        updateMp4Path(newPath: "assets/videos/continue-background-video.mp4");
        playNewTrack(mp4Path: mp4Path);
        break; */
      default:
    }
  }

  @action
  Future<void> playNewTrack({required String mp4Path}) async {
    mp4controller.pause(); // Mevcut müziği durdur
    mp4controller.dispose(); // Kaynakları serbest bırak

    // Yeni controller ile yeni dosya yükleniyor
    mp4controller = VideoPlayerController.asset(mp4Path)
      ..initialize().then((_) {
        mp4controller.setLooping(true);

        mp4controller.value.isPlaying
            ? mp4controller.pause()
            : mp4controller.play();
      }).catchError((error) {
        // Hata oluşursa konsola yaz
        // print("Error initializing new track: $error");
      });
  }

  @action
  void goBack({required BuildContext context}) {
    mp4controller.pause();
    mp4controller.dispose();
    Navigator.pop(
        context,
        PageTransition(
          child: Container(),
          type: PageTransitionType.fade,
        ));
  }

  @action
  void goToPage({required BuildContext context, required Widget page}) {
    Navigator.push(
        context, PageTransition(type: PageTransitionType.fade, child: page));
  }
}
