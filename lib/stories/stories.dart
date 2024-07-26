import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gapsec/stories/model/story_model.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/widgets/stories_widget/card_widget.dart';

List<List<Widget>> stories({required BuildContext context}) =>
    [page1(context), page2(context)];
List<List<Widget>> tabs = [page1Tabs, page2Tabs];
List<Widget> page1(BuildContext context) => <Widget>[
      customCard(
          context: context, name: murder.name, description: murder.description),
      customCard(
          context: context,
          name: dontLookBack.name,
          description: dontLookBack.description),
      customCard(
          context: context,
          name: lostLucy.name,
          description: lostLucy.description),
      customCard(
          context: context,
          name: nightGame.name,
          description: nightGame.description)
    ];
List<Widget> page1Tabs = [
  customIcon(icon: Icons.star, color: CustomColors.white),
  customIcon(icon: Icons.star, color: CustomColors.white),
  customIcon(icon: Icons.star, color: CustomColors.white),
  customIcon(icon: Icons.star, color: CustomColors.white)
];
List<Widget> page2(BuildContext context) => <Widget>[
      customCard(
          context: context,
          name: runKaity.name,
          description: runKaity.description),
      customCard(
          context: context, name: smile.name, description: smile.description),
      customCard(
          context: context, name: behind.name, description: behind.description),
      customCard(
          context: context, name: lucky.name, description: lucky.description)
    ];
List<Widget> page2Tabs = [
  customIcon(icon: Icons.lock, color: CustomColors.red),
  customIcon(icon: Icons.lock, color: CustomColors.red),
  customIcon(icon: Icons.lock, color: CustomColors.red),
  customIcon(icon: Icons.lock, color: CustomColors.red)
];
///////
StoryModel murder =
    StoryModel(name: "Murder", description: "Discipline is the best tool");
StoryModel dontLookBack = StoryModel(
    name: "Don't Look Back", description: "Discipline is the best tool");
StoryModel lostLucy =
    StoryModel(name: "Lost Lucy", description: "Discipline is the best tool");
StoryModel nightGame =
    StoryModel(name: "Night Game", description: "Discipline is the best tool");
///////

StoryModel runKaity =
    StoryModel(name: "Run Kaity", description: "Discipline is the best tool");
StoryModel smile =
    StoryModel(name: "Smile", description: "Discipline is the best tool");
StoryModel behind =
    StoryModel(name: "Behind", description: "Discipline is the best tool");
StoryModel lucky =
    StoryModel(name: "Lucky", description: "Discipline is the best tool");
