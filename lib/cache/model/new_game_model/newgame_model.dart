import 'package:isar/isar.dart';

part 'newgame_model.g.dart';

@collection
class NewGame {
  Id id = Isar.autoIncrement;

  String? murderTexts;
  String? gravehurstTexts;
  String? webOfDeceitTexts;
  String? zetaTexts;
  String? unknownTexts;
  String? mysteriousTexts;
  String? spaceTexts;
  String? luckyTexts;
}

enum TextType {
  murderType,
  gravehurstType,
  webOfDeceitType,
  zetaType,
  unknownType,
  mysteriousType,
  spaceType,
  luckyType,
}
