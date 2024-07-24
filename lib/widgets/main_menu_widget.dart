import 'package:flutter/material.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/widgets/animated_title.dart';
import 'package:gapsec/widgets/main_menu_buttons.dart';
import 'package:gapsec/widgets/settings_button.dart';

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildTitle(context),
        _buildMenuButtons(context),
        const SettingsButton(),
      ],
    );
  }

  Widget _buildBackground() {
    return Positioned.fill(
      child: Opacity(
        opacity: 1,
        child: Image.asset(
          Constants.mainPageBackgroundImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.19,
      left: MediaQuery.of(context).size.width * 0.44,
      child: const AnimatedTitle(text: 'GAPSEC'),
    );
  }

  Widget _buildMenuButtons(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.43,
      left: MediaQuery.of(context).size.width * 0.44,
      child: const MenuButtons(),
    );
  }
}
