import 'package:flutter/material.dart';
import 'package:gapsec/utils/app_colors.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

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
