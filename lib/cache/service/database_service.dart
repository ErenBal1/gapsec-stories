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

  //Her bir hikayenin depolanması için
  List<NewGame> murderRepo = [];
  List<NewGame> dontLookBackRepo = [];
  List<NewGame> lostLucyRepo = [];
  List<NewGame> nightGameRepo = [];
  List<NewGame> runKaityRepo = [];
  List<NewGame> smileRepo = [];
  List<NewGame> behindRepo = [];
  List<NewGame> luckyRepo = [];

  //Seçimi listeye ekle
  Future<void> addToList(text) async {
    final newMessage = NewGame()..text = text;
    await isar.writeTxn(() => isar.newGames.put(newMessage));
    await getUpdatedList();
  }

  //Bütün Listeyi getir
  Future<void> getUpdatedList() async {
    events = await isar.newGames.where().findAll();
  }

  //Bütün listeyi temizle yeni oyunda
  Future<void> deleteListElements() async {
    final allGames = await isar.newGames.where().findAll();
    final allIds = allGames.map((game) => game.id).toList();
    await isar.writeTxn(() => isar.newGames.deleteAll(allIds));
    //Sonra bütün listeyi yeniden temizle getir
    await getUpdatedList();
  }
}
