import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/widgets/language_settings_widget/flag_button.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
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
                ConstantTexts.GAPSEC,
                textStyle: AppFonts.splashScreenColorizeTextStyle,
                colors: ListColors.colorizeColors,
              ),
              ColorizeAnimatedText(
                speed: const Duration(milliseconds: 150),
                ConstantTexts.yourChoices.tr(),
                textStyle: AppFonts.splashScreenColorizeTextStyle,
                colors: ListColors.colorizeColors,
              ),
              ColorizeAnimatedText(
                speed: const Duration(milliseconds: 150),
                ConstantTexts.yourStories.tr(),
                textStyle: AppFonts.splashScreenColorizeTextStyle,
                colors: ListColors.colorizeColors,
              ),
              ColorizeAnimatedText(
                speed: const Duration(milliseconds: 200),
                ConstantTexts.devast,
                textStyle: AppFonts.splashScreenColorizeTextStyle,
                colors: ListColors.devastColorList,
              ),
            ],
            isRepeatingAnimation: false,
          ),
        ),
      )),
    );
  }
}
