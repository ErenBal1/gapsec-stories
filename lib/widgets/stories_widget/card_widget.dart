import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gapsec/utils/app_font.dart';

Widget customCard(
    {required BuildContext context,
    required String name,
    required String description}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(name, style: AppFonts.storyCard),
      const Spacer(),
      DefaultTextStyle(
        style: const TextStyle(
          fontSize: 30.0,
          fontFamily: 'HorrorFont',
        ),
        child: AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TyperAnimatedText(description,
                speed: const Duration(milliseconds: 100)),
          ],
        ),
      ),
      const Spacer(),
    ],
  );
}

Widget customIcon({required IconData icon, required Color color}) {
  return Icon(
    icon,
    color: color,
  );
}
