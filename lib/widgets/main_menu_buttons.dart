import 'package:flutter/material.dart';
import 'package:gapsec/widgets/animated_menu_button.dart';

class MenuButtons extends StatelessWidget {
  const MenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedMenuButton(text: 'YENI OYUN'),
        SizedBox(height: 10),
        AnimatedMenuButton(text: 'DEVAM ET'),
        SizedBox(height: 10),
        AnimatedMenuButton(text: 'HIKAYELER'),
      ],
    );
  }
}
