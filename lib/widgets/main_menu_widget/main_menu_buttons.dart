import 'package:flutter/material.dart';
import 'package:gapsec/view/new_game_view.dart';
import 'package:gapsec/widgets/main_menu_widget/animated_main_menu_button.dart';

class MenuButtons extends StatelessWidget {
  const MenuButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedMenuButton(
          text: 'YENI OYUN',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewGameView()),
            );
          },
        ),
        const SizedBox(height: 10),
        AnimatedMenuButton(
          text: 'DEVAM ET',
          onPressed: () {},
        ),
        const SizedBox(height: 10),
        AnimatedMenuButton(
          text: 'HIKAYELER',
          onPressed: () {},
        ),
      ],
    );
  }
}
