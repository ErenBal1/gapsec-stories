import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';

class StoryModel {
  final String name;
  final String description;
  final bool isLock;
  final List<NewGame?> whichRepo;
  StoryModel(
      {required this.name,
      required this.description,
      required this.isLock,
      required this.whichRepo});
}

StoryModel eren = StoryModel(
    name: "Eren",
    description: "eren description",
    isLock: false,
    whichRepo: DatabaseService().erenRepo);
StoryModel murder = StoryModel(
    name: "Murder",
    description: "Discipline is the best tool",
    isLock: false,
    whichRepo: DatabaseService().murderRepo);
StoryModel dontLookBack = StoryModel(
    name: "Don't Look Back",
    description: "Don't Look Back best tool",
    isLock: false,
    whichRepo: DatabaseService().dontLookBackRepo);
StoryModel lostLucy = StoryModel(
    name: "Lost Lucy",
    description: "Lost Lucy best tool",
    isLock: true,
    whichRepo: DatabaseService().lostLucyRepo);
StoryModel nightGame = StoryModel(
    name: "Night Game",
    description: "Night Game best tool",
    isLock: true,
    whichRepo: DatabaseService().nightGameRepo);
StoryModel runKaity = StoryModel(
    name: "Run Kaity",
    description: "Run Kaity best tool",
    isLock: true,
    whichRepo: DatabaseService().runKaityRepo);
StoryModel smile = StoryModel(
    name: "Smile",
    description: "Smile best tool",
    isLock: true,
    whichRepo: DatabaseService().smileRepo);
StoryModel behind = StoryModel(
    name: "Behind",
    description: "Behind best tool",
    isLock: true,
    whichRepo: DatabaseService().behindRepo);
StoryModel lucky = StoryModel(
    name: "Lucky",
    description: "Lucky best tool",
    isLock: true,
    whichRepo: DatabaseService().luckyRepo);

class games {
  List historiesGames = [
    murder,
    eren,
    dontLookBack,
    lostLucy,
    nightGame,
    runKaity,
    smile,
    behind,
    lucky
  ];
}
