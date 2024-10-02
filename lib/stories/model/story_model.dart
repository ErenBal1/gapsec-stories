import 'package:easy_localization/easy_localization.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/utils/constants.dart';

class StoryModel {
  final String name;
  final String description;
  bool isLock;
  String finish;
  final List<NewGame?> whichRepo;
  StoryModel(
      {required this.name,
      required this.finish,
      required this.description,
      required this.isLock,
      required this.whichRepo});
}

StoryModel murder = StoryModel(
    finish: "5",
    name: "Murder",
    description: ConstantTexts.MurderDescription.tr(),
    isLock: false,
    whichRepo: DatabaseService().murderRepo);
StoryModel gravehurst = StoryModel(
    finish: "33",
    name: "Gravehurst",
    description: ConstantTexts.GravehurstDescription.tr(),
    isLock: DatabaseService().gravehurstIsLockDefault ?? true,
    whichRepo: DatabaseService().gravehurstRepo);
StoryModel webOfDeceit = StoryModel(
    finish: "20",
    name: "Web Of Deceit",
    description: ConstantTexts.WebOfDeceitDescription.tr(),
    isLock: DatabaseService().webOfDeceitIsLockDefault ?? true,
    whichRepo: DatabaseService().webOfDeceitRepo);
StoryModel zeta = StoryModel(
    finish: "13",
    name: "Zeta",
    description: ConstantTexts.ZetaDescription.tr(),
    isLock: DatabaseService().zetaIsLockDefault ?? true,
    whichRepo: DatabaseService().zetaRepo);
StoryModel unknown = StoryModel(
    finish: "22",
    name: "Unknown Number",
    description: ConstantTexts.unknownDescription.tr(),
    isLock: DatabaseService().unknownIsLockDefault ?? true,
    whichRepo: DatabaseService().unknownRepo);
StoryModel mysterious = StoryModel(
    finish: "11",
    name: "Mysterious Loss",
    description: ConstantTexts.mysteriousLossDescription.tr(),
    isLock: DatabaseService().mysteriousIsLockDefault ?? true,
    whichRepo: DatabaseService().mysteriousRepo);
StoryModel space = StoryModel(
    finish: "10",
    name: "Survival in Space",
    description: ConstantTexts.survivalinSpaceDescription.tr(),
    isLock: true,
    whichRepo: DatabaseService().spaceRepo);
StoryModel lucky = StoryModel(
    finish: "0",
    name: "Lucky",
    description: "Lucky best tool",
    isLock: DatabaseService().luckyIsLockDefault ?? true,
    whichRepo: DatabaseService().luckyRepo);

class Games {
  List historiesGames = [
    murder,
    gravehurst,
    webOfDeceit,
    zeta,
    unknown,
    mysterious,
    space,
    //lucky
  ];
}
