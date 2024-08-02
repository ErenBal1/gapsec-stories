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

  //Her bir hikayenin depolanması için
  List<NewGame?> murderRepo = [];
  List<NewGame?> dontLookBackRepo = [];
  List<NewGame?> lostLucyRepo = [];
  List<NewGame?> nightGameRepo = [];
  List<NewGame?> runKaityRepo = [];
  List<NewGame?> smileRepo = [];
  List<NewGame?> behindRepo = [];
  List<NewGame?> luckyRepo = [];

  //Bütün her şeyi siler!!!
  Future<void> deleteListElements({required TextType type}) async {
    final allGames = await isar.newGames.where().findAll();
    final allIds = allGames.map((game) => game.id).toList();
    await isar.writeTxn(() => isar.newGames.deleteAll(allIds));
    //Sonra bütün listeyi yeniden temizle getir
    await selectedStoryUpdate(type: type);
  }

  //seçili storyyi siler datadan
  Future<void> selectedStoryDelete({required TextType type}) async {
    switch (type) {
      case TextType.murderType:
        await isar.writeTxn(() async {
          final items =
              await isar.newGames.filter().murderTextsIsNotEmpty().findAll();
          for (var item in items) {
            await isar.newGames.delete(item.id);
          }
        });
        murderRepo.clear();
        await selectedStoryUpdate(type: TextType.murderType);
        break;
      case TextType.dontLookBackType:
        await isar.writeTxn(() async {
          final items = await isar.newGames
              .filter()
              .dontLookBackTextsIsNotEmpty()
              .findAll();
          for (var item in items) {
            await isar.newGames.delete(item.id);
          }
        });
        dontLookBackRepo.clear();
        await selectedStoryUpdate(type: TextType.dontLookBackType);
        break;
      default:
    }
  }

  Future<void> selectedStoryUpdate({required TextType type}) async {
    final newGames = await isar.newGames.where().findAll();
    switch (type) {
      case TextType.murderType:
        murderRepo = newGames
            .where((item) =>
                item.murderTexts != null && item.murderTexts!.isNotEmpty)
            .toList();
        print("murderRepo => $murderRepo");
        print("murder story updated");
        break;
      case TextType.dontLookBackType:
        dontLookBackRepo = newGames
            .where((item) =>
                item.dontLookBackTexts != null &&
                item.dontLookBackTexts!.isNotEmpty)
            .toList();
        print("dontLookBackRepo => $dontLookBackRepo");
        print("dontlookback story updated");
        break;
      default:
    }
  }

  Future<void> selectedStoryAdd(
      {required String eklenicekMetin, required TextType type}) async {
    switch (type) {
      case TextType.murderType:
        if (eklenicekMetin.isNotEmpty && eklenicekMetin != "") {
          final item = NewGame()..murderTexts = eklenicekMetin;
          await isar.writeTxn(() async {
            await isar.newGames.put(item);
          });
          selectedStoryUpdate(type: TextType.murderType);
        }
        break;
      case TextType.dontLookBackType:
        if (eklenicekMetin.isNotEmpty && eklenicekMetin != "") {
          final item = NewGame()..dontLookBackTexts = eklenicekMetin;
          await isar.writeTxn(() async {
            await isar.newGames.put(item);
          });
          selectedStoryUpdate(type: TextType.dontLookBackType);
        }
        break;
      default:
    }
  }
}
