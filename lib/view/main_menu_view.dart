import 'package:flutter/material.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/utils/gradient_text.dart';
import 'package:gapsec/view/shop_view.dart';
import 'package:gapsec/widgets/main_menu_widget/main_menu_buttons.dart';
import 'package:gapsec/widgets/main_menu_widget/settings.dart';
import 'package:gapsec/widgets/main_menu_widget/token_counter.dart';

class MainMenuView extends StatelessWidget {
  final HomeState vm;

  const MainMenuView({super.key, required this.vm});

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
        TokenCounter(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GradientText(
              'G A P S E C',
              style: AppFonts.mainMenuTitle,
              gradient: LinearGradient(
                colors: CustomColors.GAPSECtitleColors,
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
        const SettingsButtons(),
      ],
    );
  }
}
