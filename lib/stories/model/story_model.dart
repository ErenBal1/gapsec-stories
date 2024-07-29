import 'package:easy_localization/easy_localization.dart';

class StoryModel {
  final String name;
  final String description;
  final bool isLock;
  StoryModel(
      {required this.name, required this.description, required this.isLock});
}

StoryModel murder = StoryModel(
    name: "Murder", description: "Discipline is the best tool", isLock: false);
StoryModel dontLookBack = StoryModel(
    name: "Don't Look Back",
    description: "Don't Look Back best tool",
    isLock: false);
StoryModel lostLucy = StoryModel(
    name: "Lost Lucy", description: "Lost Lucy best tool", isLock: true);
StoryModel nightGame = StoryModel(
    name: "Night Game", description: "Night Game best tool", isLock: true);
StoryModel runKaity = StoryModel(
    name: "Run Kaity", description: "Run Kaity best tool", isLock: true);
StoryModel smile =
    StoryModel(name: "Smile", description: "Smile best tool", isLock: true);
StoryModel behind =
    StoryModel(name: "Behind", description: "Behind best tool", isLock: true);
StoryModel lucky =
    StoryModel(name: "Lucky", description: "Lucky best tool", isLock: true);
