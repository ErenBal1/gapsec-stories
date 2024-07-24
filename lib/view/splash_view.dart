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
      Colors.red,
      Colors.white,
      Colors.red,
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
                'GAPSEC',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                'Your Choices',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
              ColorizeAnimatedText(
                'DEVAST',
                textStyle: colorizeTextStyle,
                colors: colorizeColors,
              ),
            ],
            isRepeatingAnimation: false,
          ),
        ),
      )),
    );
  }
}
