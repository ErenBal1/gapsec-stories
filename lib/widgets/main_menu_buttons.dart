import 'package:flutter/material.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/view/stories_view.dart';
import 'package:gapsec/widgets/animated_menu_button.dart';

class MenuButtons extends StatelessWidget {
  final HomeState vm;
  const MenuButtons({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedMenuButton(text: 'YENI OYUN', vm: vm, page: StoriesView()),
        const SizedBox(height: 10),
        AnimatedMenuButton(text: 'DEVAM ET', vm: vm, page: StoriesView()),
        const SizedBox(height: 10),
        AnimatedMenuButton(text: 'HIKAYELER', vm: vm, page: StoriesView()),
      ],
    );
  }
}
