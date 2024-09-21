import 'package:isar/isar.dart';
part 'bool_model.g.dart';

@collection
class BoolModel {
  Id id = Isar.autoIncrement;

  int? tokenAmount;
  bool? murderIsLock;
  bool? gravehurstIsLock;
  bool? lostLucyIsLock;
  bool? nightGameIsLock;
  bool? runKaityIsLock;
  bool? smileIsLock;
  bool? behindIsLock;
  bool? luckyIsLock;

  firstWhere(bool Function(dynamic item) param0) {}
}
