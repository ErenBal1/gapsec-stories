import 'package:flutter/material.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/utils/app_colors.dart';

class SettingsButton extends StatelessWidget {
  final HomeState vm;
  const SettingsButton({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {},
        iconSize: 30.0,
        color: CustomColors.white,
      ),
    );
  }
}
