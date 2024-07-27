import 'package:flutter/material.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/view/stories_view.dart';
import 'package:gapsec/widgets/main_menu_widget/animated_main_menu_button.dart';
import 'package:easy_localization/easy_localization.dart';

class MenuButtons extends StatelessWidget {
  final HomeState vm;
  const MenuButtons({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedMenuButton(
            text: "new_game_button".tr(), vm: vm, page: StoriesView()),
        const SizedBox(height: 10),
        AnimatedMenuButton(
            text: 'load_game_button'.tr(), vm: vm, page: StoriesView()),
        const SizedBox(height: 10),
        AnimatedMenuButton(
            text: 'stories_button'.tr(), vm: vm, page: StoriesView()),
      ],
    );
  }
}
