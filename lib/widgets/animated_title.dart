import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gapsec/utils/app_font.dart';

class AnimatedTitle extends StatelessWidget {
  final String text;

  const AnimatedTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 100,
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            text,
            textStyle: AppFonts.norm
                .copyWith(fontSize: 50.0, fontWeight: FontWeight.bold),
            speed: const Duration(milliseconds: 100),
          ),
        ],
        totalRepeatCount: 1,
        pause: const Duration(milliseconds: 1000),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      ),
    );
  }
}
