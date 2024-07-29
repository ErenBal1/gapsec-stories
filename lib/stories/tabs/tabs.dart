import 'package:flutter/material.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/widgets/stories_widget/card_widget.dart';

class tabsClass {
  List<List<Widget>> tabs({
    required BuildContext context,
    required StoriesState vm,
  }) =>
      [
        page1Tabs(context: context, vm: vm),
        page2Tabs(context: context, vm: vm)
      ];

  List<Widget> page1Tabs({
    required BuildContext context,
    required StoriesState vm,
  }) =>
      <Widget>[
        customCardWidgets().customIcon(
          icon: Icons.star,
          color: CustomColors.white,
          context: context,
          vm: vm,
        ),
        customCardWidgets().customIcon(
          icon: Icons.star,
          color: CustomColors.white,
          context: context,
          vm: vm,
        ),
        customCardWidgets().customIcon(
          icon: Icons.star,
          color: CustomColors.white,
          context: context,
          vm: vm,
        ),
        customCardWidgets().customIcon(
          icon: Icons.star,
          color: CustomColors.white,
          context: context,
          vm: vm,
        )
      ];
  List<Widget> page2Tabs({
    required BuildContext context,
    required StoriesState vm,
  }) =>
      <Widget>[
        customCardWidgets().customIcon(
          icon: Icons.lock,
          color: CustomColors.red,
          context: context,
          vm: vm,
        ),
        customCardWidgets().customIcon(
          icon: Icons.lock,
          color: CustomColors.red,
          context: context,
          vm: vm,
        ),
        customCardWidgets().customIcon(
          icon: Icons.lock,
          color: CustomColors.red,
          context: context,
          vm: vm,
        ),
        customCardWidgets().customIcon(
          icon: Icons.lock,
          color: CustomColors.red,
          context: context,
          vm: vm,
        )
      ];
}
