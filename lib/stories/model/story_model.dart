import 'package:easy_localization/easy_localization.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/utils/constants.dart';

class StoryModel {
  final String name;
  final String description;
  bool isLock;
  final List<NewGame?> whichRepo;
  StoryModel(
      {required this.name,
      required this.description,
      required this.isLock,
      required this.whichRepo});
}

StoryModel murder = StoryModel(
    name: "Murder",
    description: ConstantTexts.MurderDescription.tr(),
    isLock: false,
    whichRepo: DatabaseService().murderRepo);
StoryModel gravehurst = StoryModel(
    name: "Gravehurst",
    description: "Gravehurst best tool",
    isLock: DatabaseService().gravehurstIsLockDefault ?? true,
    whichRepo: DatabaseService().gravehurstRepo);
StoryModel webOfDeceit = StoryModel(
    name: "Web Of Deceit",
    description: "Web Of Deceit best tool",
    isLock: DatabaseService().webOfDeceitIsLockDefault ?? true,
    whichRepo: DatabaseService().webOfDeceitRepo);
StoryModel nightGame = StoryModel(
    name: "Night Game",
    description: "Night Game best tool",
    isLock: DatabaseService().nightGameIsLockDefault ?? true,
    whichRepo: DatabaseService().nightGameRepo);
StoryModel runKaity = StoryModel(
    name: "Run Kaity",
    description: "Run Kaity best tool",
    isLock: DatabaseService().runKaityIsLockDefault ?? true,
    whichRepo: DatabaseService().runKaityRepo);
StoryModel smile = StoryModel(
    name: "Smile",
    description: "Smile best tool",
    isLock: DatabaseService().smileIsLockDefault ?? true,
    whichRepo: DatabaseService().smileRepo);
StoryModel behind = StoryModel(
    name: "Behind",
    description: "Behind best tool",
    isLock: true,
    whichRepo: DatabaseService().behindRepo);
StoryModel lucky = StoryModel(
    name: "Lucky",
    description: "Lucky best tool",
    isLock: DatabaseService().luckyIsLockDefault ?? true,
    whichRepo: DatabaseService().luckyRepo);

class Games {
  List historiesGames = [
    murder,
    gravehurst,
    webOfDeceit,
    nightGame,
    runKaity,
    smile,
    behind,
    lucky
  ];
}
