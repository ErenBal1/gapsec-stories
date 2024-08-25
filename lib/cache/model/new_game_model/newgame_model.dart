import 'package:isar/isar.dart';

part 'newgame_model.g.dart';

@collection
class NewGame {
  Id id = Isar.autoIncrement;

  String? murderTexts;
  String? dontLookBackTexts;
  String? lostLucyTexts;
  String? nightGameTexts;
  String? runKaityTexts;
  String? smileTexts;
  String? behindTexts;
  String? luckyTexts;
}

enum TextType {
  murderType,
  dontLookBackType,
  lostLucyType,
  nightGameType,
  runKaityType,
  smileType,
  behindType,
  luckyType,
}
