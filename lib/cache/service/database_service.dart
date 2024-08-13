import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/model/token_isLock_model/bool_model.dart';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static late Isar isar;

  //İsar başlat
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar =
        await Isar.open([NewGameSchema, BoolModelSchema], directory: dir.path);
  }

  //ilk önce default uygulama kilit durumlarını tanımla
  int? tokenAmountDefault = 0;
  bool? murderIsLockDefault = false;
  bool? dontLookBackIsLockDefault = true;
  bool? lostLucyIsLockDefault = true;
  bool? nightGameIsLockDefault = true;
  bool? runKaityIsLockDefault = true;
  bool? smileIsLockDefault = true;
  bool? behindIsLockDefault = true;
  bool? luckyIsLockDefault = true;

  //Uygulama açılınca kilit durumlarını update fonksiyonu yap

  Future<void> updateDefaultValues() async {
    final boolValues = await isar.boolModels.where().findAll();
    if (boolValues.isNotEmpty) {
      final item = boolValues.firstWhere(
        (item) => item.murderIsLock != null,
        orElse: () => BoolModel()..murderIsLock = null,
      );

      murderIsLockDefault = item.murderIsLock;
      print("=> $murderIsLockDefault");
    } else {
      // Eğer hiç kayıt yoksa, null döndür
      print("=> $murderIsLockDefault");
    }
  }

  //belirli hikayenin kilit durumunu aç
  Future<void> changeDefaultValue(bool newValue) async {
    final item = BoolModel()..murderIsLock = newValue;
    await isar.writeTxn(() async {
      await isar.boolModels.put(item);
    });
    updateDefaultValues();
  }

  //Her bir hikayenin depolanması için
  List<NewGame?> erenRepo = [];
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
    final allBools = await isar.boolModels.where().findAll();
    final allBoolIds = allBools.map((e) => e.id).toList();
    await isar.writeTxn(() => isar.boolModels.deleteAll(allBoolIds));
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
      case TextType.erenType:
        await isar.writeTxn(() async {
          final items =
              await isar.newGames.filter().erenTextsIsNotEmpty().findAll();
          for (var item in items) {
            await isar.newGames.delete(item.id);
          }
        });
        erenRepo.clear();
        await selectedStoryUpdate(type: TextType.erenType);
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
      case TextType.erenType:
        erenRepo = newGames
            .where(
                (item) => item.erenTexts != null && item.erenTexts!.isNotEmpty)
            .toList();
        print("EREN REPO => $erenRepo");
        print("eren story updated");
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
      case TextType.erenType:
        if (eklenicekMetin.isNotEmpty && eklenicekMetin != "") {
          final item = NewGame()..erenTexts = eklenicekMetin;
          await isar.writeTxn(() async {
            await isar.newGames.put(item);
          });
          selectedStoryUpdate(type: TextType.erenType);
        }
        break;
      default:
    }
  }
}
