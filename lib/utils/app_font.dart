import 'package:flutter/material.dart';
import 'package:gapsec/utils/app_colors.dart';

class AppFonts {
  static var shopBuyButton = const TextStyle(
      color: Colors.white60,
      shadows: [Shadow(color: CustomColors.yellow, blurRadius: 2)]);
  static var mainMenuButton = const TextStyle(
    shadows: [
      BoxShadow(
        color: CustomColors.white,
        blurRadius: 3,
        spreadRadius: 15,
      ),
      BoxShadow(
        color: CustomColors.black,
        blurRadius: 30,
        spreadRadius: 2,
      ),
    ],
    fontWeight: FontWeight.w500,
    fontFamily: "HorrorFont",
    color: Color.fromARGB(192, 209, 187, 157),
    fontSize: 30,
    letterSpacing: 0.2,
  );
  static var freeTitle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "PixelFont",
    color: Color.fromARGB(255, 214, 255, 253),
    fontSize: 20,
    letterSpacing: 0.2,
  );
  static var mainMenuTitle = const TextStyle(
    fontSize: 25,
    fontFamily: "PixelFont",
    // fontWeight: FontWeight.w800,
    color: Colors.transparent,
  );
  static var normRed = const TextStyle(
    fontSize: 55,
    fontFamily: "HorrorFont",
    fontWeight: FontWeight.w800,
    color: Color.fromARGB(210, 244, 67, 54),
  );

  static var storyCard = const TextStyle(
    fontSize: 40,
    fontFamily: "HorrorFont",
    fontWeight: FontWeight.w800,
    color: Color.fromARGB(114, 244, 67, 54),
  );
  static var storyTitle = const TextStyle(
    fontSize: 40,
    fontFamily: "HorrorFont",
    fontWeight: FontWeight.w800,
    color: Color.fromARGB(146, 244, 67, 54),
  );
  static const splashScreenColorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'HorrorFont',
  );

  static const unlockMoreButtonTextStyle = TextStyle(
      shadows: [Shadow(blurRadius: 8, color: CustomColors.yellow)],
      fontFamily: "PixelFont",
      color: CustomColors.white);

  static const storyTitleTextStyle = TextStyle(
    fontFamily: "PixelFont",
  );
  static const waitingForMessageTextStyle =
      TextStyle(color: Colors.green, fontSize: 14);

  static const storyTitleInGameTextStyle =
      TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold);
}
