import 'package:flutter/material.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:gapsec/widgets/stories_widget/card_widget.dart';

class pagesClass {
  List<List<Widget>> pages({required BuildContext context}) =>
      [page1(context), page2(context)];

  List<Widget> page1(BuildContext context) => <Widget>[
        CustomCardWidgets().customCard(
            context: context,
            name: murder.name,
            description: murder.description),
        CustomCardWidgets().customCard(
            context: context,
            name: dontLookBack.name,
            description: dontLookBack.description),
        CustomCardWidgets().customCard(
            context: context,
            name: lostLucy.name,
            description: lostLucy.description),
        CustomCardWidgets().customCard(
            context: context,
            name: nightGame.name,
            description: nightGame.description)
      ];
  List<Widget> page2(BuildContext context) => <Widget>[
        CustomCardWidgets().customCard(
            context: context,
            name: runKaity.name,
            description: runKaity.description),
        CustomCardWidgets().customCard(
            context: context, name: smile.name, description: smile.description),
        CustomCardWidgets().customCard(
            context: context,
            name: behind.name,
            description: behind.description),
        CustomCardWidgets().customCard(
            context: context, name: lucky.name, description: lucky.description)
      ];
}
