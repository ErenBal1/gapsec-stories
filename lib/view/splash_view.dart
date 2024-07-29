import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/utils/app_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      //Colors.purple,
      //Colors.blue,
      Colors.cyan,
      Colors.white,
      Colors.cyan,
    ];
    const devastList = [
      //Colors.purple,
      //Colors.blue,
      Colors.black,
      Colors.white,
      Colors.black,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'HorrorFont',
    );
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: Center(
          child: SizedBox(
        width: double.infinity,
        child: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                speed: const Duration(milliseconds: 150),
                'GAPSEC',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                speed: const Duration(milliseconds: 150),
                'Your Choices',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                speed: const Duration(milliseconds: 150),
                'Your Stories',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                speed: const Duration(milliseconds: 150),
                'DEVAST',
                textStyle: colorizeTextStyle,
                colors: devastList,
              ),
            ],
            isRepeatingAnimation: false,
          ),
        ),
      )),
    );
  }
}
