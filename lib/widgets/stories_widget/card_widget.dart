import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/utils/app_font.dart';

class customCardWidgets {
  Widget customCard(
      {required BuildContext context,
      required String name,
      required String description}) {
    return Container(
      //color: CustomColors.white,
      child: Column(
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
      ),
    );
  }

  Widget customIcon(
      {required BuildContext context,
      required IconData icon,
      required Color color,
      required StoriesState vm}) {
    return IconButton(
      onPressed: () {
        //vm.goBack(context: context,);
        //vm.printIndexs(3, 3);
      },
      icon: Icon(icon),
      color: color,
    );
  }
}
