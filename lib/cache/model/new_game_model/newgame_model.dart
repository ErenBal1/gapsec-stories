import 'package:isar/isar.dart';

part 'newgame_model.g.dart';

@collection
class NewGame {
  Id id = Isar.autoIncrement;

  late String murderTexts;
  // late String dontLookBackTexts;
}

enum TextType { murderType, dontLookBackType }
