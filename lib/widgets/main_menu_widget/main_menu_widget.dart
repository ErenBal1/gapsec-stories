import 'package:flutter/material.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/widgets/main_menu_widget/animated_title.dart';
import 'package:gapsec/widgets/main_menu_widget/main_menu_buttons.dart';
import 'package:gapsec/widgets/main_menu_widget/settings_button.dart';

class MainMenuWidget extends StatelessWidget {
  final HomeState vm;
  const MainMenuWidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildTitle(context),
        _buildMenuButtons(context: context, vm: vm),
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

  Widget _buildMenuButtons(
      {required BuildContext context, required HomeState vm}) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.43,
      left: MediaQuery.of(context).size.width * 0.44,
      child: MenuButtons(vm: vm),
    );
  }
}
