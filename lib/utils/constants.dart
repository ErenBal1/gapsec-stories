import 'package:flutter/material.dart';

class Constants {
  static const mainPageBackgroundImage = "assets/images/ups_new_background.jpg";
  static const tokenImagePath = 'assets/images/mystoken.png';
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
