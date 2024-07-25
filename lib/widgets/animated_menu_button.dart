import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/utils/app_font.dart';

class AnimatedMenuButton extends StatelessWidget {
  final HomeState vm;
  final String text;
  final Widget page;

  const AnimatedMenuButton(
      {super.key, required this.text, required this.vm, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            textStyle: AppFonts.mainMenuButton,
            speed: const Duration(milliseconds: 50),
          ),
        ],
        onTap: () => vm.goToPage(context: context, page: page),
        totalRepeatCount: 1,
        pause: const Duration(milliseconds: 1000),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      ),
    );
  }
}
