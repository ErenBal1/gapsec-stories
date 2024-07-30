import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static late Isar isar;

  //İsar başlat
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NewGameSchema], directory: dir.path);
  }

  //Olay akışı için liste oluştur
  List<NewGame> events = [];

  //Seçimi listeye ekle
  Future<void> addToList(text) async {
    final newMessage = NewGame()..text = text;
    isar.writeTxn(() => isar.newGames.put(newMessage));
  }

  //Bütün Listeyi getir
  Future<void> getUpdatedList() async {
    events = await isar.newGames.where().findAll();
  }

  //Bütün listeyi temizle yeni oyunda
  Future<void> deleteListElements(NewGame games) async {
    await isar.writeTxn(() => isar.newGames.deleteAll([games.id]));
    //Sonra bütün listeyi yeniden temizle getir
    await getUpdatedList();
  }
}
