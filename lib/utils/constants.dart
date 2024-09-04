// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class ConstantPaths {
  static const mainPageBackgroundImage =
      "assets/images/main-menu-background.png";
  static const tokenImagePath = 'assets/images/mystoken.png';
  static const shopTitle = 'assets/images/MystokenShop-title.png';
  static const infoPageBackgroundImage =
      "assets/images/info-page-background.png";
  static const newGameBackgroundVideo =
      'assets/videos/new-game-background-video.mp4';
  static const continueBackgroundVideo =
      'assets/videos/continue-background-video.mp4';
  static const keyHoleImagePath = "assets/images/keyHole.png";
  static const lampImagePath = "assets/images/lamp.png";
  static const keyImagePath = "assets/images/key.png";
  static const murderBackgroundMusicPath = 'assets/sounds/runKaity.mp3';
}

class ConstantTexts {
  static const String GAPSEC = "GAPSEC";
  static const String NEW_GAME = "new_game_button";
  static const String CONTINUE = "load_game_button";
  static const String STORIES = "stories_button";
  static const String watchADforFreeTokens = "watchADforFreeTokens";
  static const String BuyNow = "buyNow";
  static const String CreatedBy = "createdBy";
  static const String Developers = "developers";
  static const String Contributors = "contributors";
  static const String devast = "DEVAST";
  static const String developersnames = "TAHA YASIN BIKE   EREN BAL";
  static const String contributorsnames = "TAHA YASIN BIKE   EREN BAL";
  static const String Version = "Version 1.0.0";
  static const String murdertitle = "murderTitle";
  static const String yourChoices = "your_choices";
  static const String yourStories = "your_stories";
  static const String unlockMore = "unlock_more";
  static const String active_when_app_published = "active_when_app_published";
  static const String test_mode = "test_mode";
  static const String okay = "okay";
  static const String restartStory = "do_you_want_to_restart_the_story";
  static const String doYouConfirmAlert = "do_you_confirm";
  static const String yes = "yes";
  static const String no = "no";
  static const String waitingForMessage = "waitingformessage";
  static const String you_have_reached_the_end = "you_have_reached_the_end";
  static const String murder = "Murder";
  static const String languageChanged = "language_changed";
  static const String manualRestartNeeded = "manual_restart_needed";
}

class LanguageConstants {
  static const trLocale = Locale('tr', 'TR');
  static const enLocale = Locale('en', 'US');
  static const langPath = "assets/translations";
  static const TRflagPath = "assets/images/TR-flag.png";
  static const UKflagPath = "assets/images/UK-flag.png";
}

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenHeight = mediaQueryData!.size.height;
    screenWidth = mediaQueryData!.size.width;
  }

  static get widthSize {
    return screenWidth;
  }

  static get heightSize {
    return screenHeight;
  }
}
