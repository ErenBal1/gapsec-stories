import 'package:isar/isar.dart';

part 'newgame_model.g.dart';

@collection
class NewGame {
  Id id = Isar.autoIncrement;

  String? murderTexts;
  String? gravehurstTexts;
  String? webOfDeceitTexts;
  String? nightGameTexts;
  String? runKaityTexts;
  String? smileTexts;
  String? behindTexts;
  String? luckyTexts;
}

enum TextType {
  murderType,
  gravehurstType,
  webOfDeceitType,
  nightGameType,
  runKaityType,
  smileType,
  behindType,
  luckyType,
}
