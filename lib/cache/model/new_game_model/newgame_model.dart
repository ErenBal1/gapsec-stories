import 'package:isar/isar.dart';

part 'newgame_model.g.dart';

@collection
class NewGame {
  Id id = Isar.autoIncrement;

  String? murderTexts;
  String? dontLookBackTexts;
  String? erenTexts;
}

enum TextType { murderType, dontLookBackType, erenType }
