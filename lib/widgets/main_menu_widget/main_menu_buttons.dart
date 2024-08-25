import 'package:flutter/material.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/view/continue_view.dart';
import 'package:gapsec/view/new_game_view.dart';
import 'package:gapsec/view/stories_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gapsec/utils/app_font.dart';

class MenuButtons extends StatefulWidget {
  final HomeState vm;
  const MenuButtons({super.key, required this.vm});

  @override
  _MenuButtonsState createState() => _MenuButtonsState();
}

class _MenuButtonsState extends State<MenuButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          onTap: () =>
              widget.vm.goToPage(context: context, page: const NewGameView()),
          animatedTexts: [
            TypewriterAnimatedText(
              "new_game_button".tr(),
              textStyle: AppFonts.mainMenuButton,
              speed: const Duration(milliseconds: 80),
            ),
          ],
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        const SizedBox(height: 20),
        AnimatedTextKit(
          onTap: () =>
              widget.vm.goToPage(context: context, page: const ContinueView()),
          animatedTexts: [
            TypewriterAnimatedText(
              'load_game_button'.tr(),
              textStyle: AppFonts.mainMenuButton,
              speed: const Duration(milliseconds: 80),
            ),
          ],
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
        const SizedBox(height: 20),
        AnimatedTextKit(
          onTap: () =>
              widget.vm.goToPage(context: context, page: const StoriesView()),
          animatedTexts: [
            TypewriterAnimatedText(
              'stories_button'.tr(),
              textStyle: AppFonts.mainMenuButton,
              speed: const Duration(milliseconds: 80),
            ),
          ],
          totalRepeatCount: 1,
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
      ],
    );
  }
}
