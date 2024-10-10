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
  static const murderBackgroundMusicPath = 'assets/sounds/murder.mp3';
}

class ConstantTexts {
  static const String ChooseYourAnswer = "choose_your_answer";
  static const String ShouldBuy = "should_buy";
  static const String UnlockThis = "unlock_this";
  static const String GetMoreMystoken = "get_more_mystoken";
  static const String RestoreAlert = "restore_alert";
  static const String GapsecEnds = "gapsec_ends";
  static const String GetMystoken = "get_mystoken";
  static const String BoostYourExperince = "boost_your_experience";
  static const String Stories = "stories";
  static const String InadequateMystoken = "inadequate_mystoken";
  static const String StartStory = "start_story";
  static const String Endings = "end";
  static const String MurderDescription = "murder_description";
  static const String GravehurstDescription = "gravehurst_description";
  static const String WebOfDeceitDescription = "webofdeceit_description";
  static const String ZetaDescription = "zeta_description";
  static const String unknownDescription = "unknown_description";
  static const String mysteriousLossDescription = "mysteriousloss_description";
  static const String survivalinSpaceDescription =
      "survivalinSpace_description";
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
  static const String contributorsnames = "SINEM KARAKURT \n SUDENAZ KARABULUT";
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
  static const String iap_not_available = "iap_not_available";
  static const String product_not_found = "product_not_found";
  static const String purchase_initiated = "purchase_initiated";
  static const String purchase_error = "purchase_error";
  static const String tokens_added = "tokens_added";
  static const String error = "error";
  static const String Advert = "advert";
  static const String mystoken_100_id = "mystoken_100_buy";
  static const String mystoken_100_title = '100 Mystoken';
  static const String mystoken_200_id = "mystoken_200_buy";
  static const String mystoken_200_title = '200 Mystoken';
  static const String mystoken_300_id = "mystoken_300_buy";
  static const String mystoken_300_title = '300 Mystoken';
  static const String mystoken_500_id = "mystoken_500_buy";
  static const String mystoken_500_title = '500 Mystoken';
  static const String mystoken_600_id = "mystoken_600_buy";
  static const String mystoken_600_title = '600 Mystoken';
  static const String mystoken_750_id = "mystoken_750_buy";
  static const String mystoken_750_title = '750 Mystoken';
  static const String purchase_stream_error = "purchase_stream_error";
  static const String languageAlertOK = "languageAlertOK";
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
