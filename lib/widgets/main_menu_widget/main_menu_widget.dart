import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/utils/gradient_text.dart';
import 'package:gapsec/widgets/main_menu_widget/main_menu_buttons.dart';
import 'package:gapsec/widgets/main_menu_widget/settings_button.dart';

class MainMenuWidget extends StatelessWidget {
  final HomeState vm;
  const MainMenuWidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 1,
            child: Image.asset(
              Constants.mainPageBackgroundImage,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientText(
              'G A P S E C',
              style: AppFonts.mainMenuTitle,
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.cyan.shade50,
                  Colors.blue,
                  Colors.cyan.shade50,
                  Colors.blue,
                  Colors.cyan.shade50,
                  Colors.blue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MenuButtons(vm: vm),
          ],
        ),
        const SettingsButton(),
      ],
    );
  }
}
