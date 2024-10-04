import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/model/token_isLock_model/bool_model.dart';
import 'package:gapsec/state/shop_state/shop_state.dart';
import 'package:gapsec/stories/model/story_model.dart';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static late Isar isar;

  //İsar başlat
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar =
        await Isar.open([NewGameSchema, BoolModelSchema], directory: dir.path);
/*     final boolValues = await isar.boolModels.where().findFirst(); */
  }

  //ilk önce default uygulama kilit durumlarını tanımla
  int? tokenAmountDefault = 0;
  bool? murderIsLockDefault = true;
  bool? gravehurstIsLockDefault = true;
  bool? webOfDeceitIsLockDefault = true;
  bool? zetaIsLockDefault = true;
  bool? unknownIsLockDefault = true;
  bool? mysteriousIsLockDefault = true;
  bool? spaceIsLockDefault = true;
  bool? luckyIsLockDefault = true;

  //Uygulama açılınca kilit durumlarını update fonksiyonu yap
  Future<void> updateDefaultValues() async {
    final boolValues = await isar.boolModels.where().findFirst();
    if (boolValues == null) {
      // print("BoolModel bulunamadı, varsayılan değerler kullanılacak.");
      return;
    }
    murderIsLockDefault = boolValues.murderIsLock ?? true;
    gravehurstIsLockDefault = boolValues.gravehurstIsLock ?? true;
    webOfDeceitIsLockDefault = boolValues.webOfDeceitIsLock ?? true;
    zetaIsLockDefault = boolValues.zetaIsLock ?? true;
    unknownIsLockDefault = boolValues.unknownIsLock ?? true;
    mysteriousIsLockDefault = boolValues.mysteriousIsLock ?? true;
    spaceIsLockDefault = boolValues.spaceIsLock ?? true;
    luckyIsLockDefault = boolValues.luckyIsLock ?? true;

    murder.isLock = murderIsLockDefault!;
    gravehurst.isLock = gravehurstIsLockDefault!;
    webOfDeceit.isLock = webOfDeceitIsLockDefault!;
    zeta.isLock = zetaIsLockDefault!;
    unknown.isLock = unknownIsLockDefault!;
    mysterious.isLock = mysteriousIsLockDefault!;
    space.isLock = spaceIsLockDefault!;
    lucky.isLock = luckyIsLockDefault!;
  }

  Future<void> addTokens(int amount) async {
    final boolValues = await isar.boolModels.where().findFirst();
    if (boolValues == null) {
      final newBoolModel = BoolModel()..tokenAmount = amount;

      await isar.writeTxn(() async {
        await isar.boolModels.put(newBoolModel);
      });
    } else {
      // Eğer kayıt varsa, tokenAmount null değilse ekle, null ise önce 0 olarak ayarla
      boolValues.tokenAmount = (boolValues.tokenAmount ?? 0) + amount;
      tokenAmountDefault = boolValues.tokenAmount;
      //print("tokenAmountDefault = $tokenAmountDefault");
      await isar.writeTxn(() async {
        await isar.boolModels.put(boolValues);
      });
    }
    final updatedBoolModel = await isar.boolModels.where().findFirst();
    //print("Güncellenmiş token miktarı: ${updatedBoolModel?.tokenAmount}");
    ShopState().updateAmount(updatedBoolModel?.tokenAmount ?? 0);
    await updateDefaultValues();
  }

  //belirli hikayenin kilit durumunu aç
  Future<void> changeDefaultValue(
      {required bool newValue, required TextType type}) async {
    final boolValues = await isar.boolModels.where().findFirst();
    switch (type) {
      case TextType.murderType:
        if (boolValues != null) {
          boolValues.murderIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(boolValues);
          });
        } else {
          // Eğer daha önce bir kayıt yoksa, yeni bir kayıt oluşturur
          final newBoolModel = BoolModel()..murderIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(newBoolModel);
          });
        }
        break;
      case TextType.gravehurstType:
        if (boolValues != null) {
          boolValues.gravehurstIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(boolValues);
          });
        } else {
          // Eğer daha önce bir kayıt yoksa, yeni bir kayıt oluşturur
          final newBoolModel = BoolModel()..gravehurstIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(newBoolModel);
          });
        }
        break;
      case TextType.webOfDeceitType:
        if (boolValues != null) {
          boolValues.webOfDeceitIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(boolValues);
          });
        } else {
          // Eğer daha önce bir kayıt yoksa, yeni bir kayıt oluşturur
          final newBoolModel = BoolModel()..webOfDeceitIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(newBoolModel);
          });
        }
        break;
      case TextType.zetaType:
        if (boolValues != null) {
          boolValues.zetaIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(boolValues);
          });
        } else {
          // Eğer daha önce bir kayıt yoksa, yeni bir kayıt oluşturur
          final newBoolModel = BoolModel()..zetaIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(newBoolModel);
          });
        }
        break;
      case TextType.unknownType:
        if (boolValues != null) {
          boolValues.unknownIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(boolValues);
          });
        } else {
          // Eğer daha önce bir kayıt yoksa, yeni bir kayıt oluşturur
          final newBoolModel = BoolModel()..unknownIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(newBoolModel);
          });
        }
        break;
      case TextType.mysteriousType:
        if (boolValues != null) {
          boolValues.mysteriousIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(boolValues);
          });
        } else {
          // Eğer daha önce bir kayıt yoksa, yeni bir kayıt oluşturur
          final newBoolModel = BoolModel()..mysteriousIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(newBoolModel);
          });
        }
        break;
      case TextType.spaceType:
        if (boolValues != null) {
          boolValues.spaceIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(boolValues);
          });
        } else {
          // Eğer daha önce bir kayıt yoksa, yeni bir kayıt oluşturur
          final newBoolModel = BoolModel()..spaceIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(newBoolModel);
          });
        }
        break;
      case TextType.luckyType:
        if (boolValues != null) {
          boolValues.luckyIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(boolValues);
          });
        } else {
          // Eğer daha önce bir kayıt yoksa, yeni bir kayıt oluşturur
          final newBoolModel = BoolModel()..luckyIsLock = newValue;
          await isar.writeTxn(() async {
            await isar.boolModels.put(newBoolModel);
          });
        }
        break;

      default:
    }

    await updateDefaultValues();
  }

  //Her bir hikayenin depolanması için
  List<NewGame?> murderRepo = [];
  List<NewGame?> gravehurstRepo = [];
  List<NewGame?> webOfDeceitRepo = [];
  List<NewGame?> zetaRepo = [];
  List<NewGame?> unknownRepo = [];
  List<NewGame?> mysteriousRepo = [];
  List<NewGame?> spaceRepo = [];
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
      case TextType.gravehurstType:
        await isar.writeTxn(() async {
          final items = await isar.newGames
              .filter()
              .gravehurstTextsIsNotEmpty()
              .findAll();
          for (var item in items) {
            await isar.newGames.delete(item.id);
          }
        });
        gravehurstRepo.clear();
        await selectedStoryUpdate(type: TextType.gravehurstType);
        break;
      case TextType.webOfDeceitType:
        await isar.writeTxn(() async {
          final items = await isar.newGames
              .filter()
              .webOfDeceitTextsIsNotEmpty()
              .findAll();
          for (var item in items) {
            await isar.newGames.delete(item.id);
          }
        });
        webOfDeceitRepo.clear();
        await selectedStoryUpdate(type: TextType.webOfDeceitType);
        break;
      case TextType.zetaType:
        await isar.writeTxn(() async {
          final items =
              await isar.newGames.filter().zetaTextsIsNotEmpty().findAll();
          for (var item in items) {
            await isar.newGames.delete(item.id);
          }
        });
        zetaRepo.clear();
        await selectedStoryUpdate(type: TextType.zetaType);
        break;
      case TextType.unknownType:
        await isar.writeTxn(() async {
          final items =
              await isar.newGames.filter().unknownTextsIsNotEmpty().findAll();
          for (var item in items) {
            await isar.newGames.delete(item.id);
          }
        });
        unknownRepo.clear();
        await selectedStoryUpdate(type: TextType.unknownType);
        break;
      case TextType.mysteriousType:
        await isar.writeTxn(() async {
          final items = await isar.newGames
              .filter()
              .mysteriousTextsIsNotEmpty()
              .findAll();
          for (var item in items) {
            await isar.newGames.delete(item.id);
          }
        });
        mysteriousRepo.clear();
        await selectedStoryUpdate(type: TextType.mysteriousType);
        break;
      case TextType.spaceType:
        await isar.writeTxn(() async {
          final items =
              await isar.newGames.filter().spaceTextsIsNotEmpty().findAll();
          for (var item in items) {
            await isar.newGames.delete(item.id);
          }
        });
        spaceRepo.clear();
        await selectedStoryUpdate(type: TextType.spaceType);
        break;
      case TextType.luckyType:
        await isar.writeTxn(() async {
          final items =
              await isar.newGames.filter().luckyTextsIsNotEmpty().findAll();
          for (var item in items) {
            await isar.newGames.delete(item.id);
          }
        });
        luckyRepo.clear();
        await selectedStoryUpdate(type: TextType.luckyType);
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
        //print("murderRepo => $murderRepo");
        //print("murder story updated");
        break;
      case TextType.gravehurstType:
        gravehurstRepo = newGames
            .where((item) =>
                item.gravehurstTexts != null &&
                item.gravehurstTexts!.isNotEmpty)
            .toList();
        //print("dontLookBackRepo => $dontLookBackRepo");
        //print("dontlookback story updated");
        break;
      case TextType.webOfDeceitType:
        webOfDeceitRepo = newGames
            .where((item) =>
                item.webOfDeceitTexts != null &&
                item.webOfDeceitTexts!.isNotEmpty)
            .toList();
        //print("lostLucyRepo => $lostLucyRepo");
        //print("lostLucy story updated");
        break;
      case TextType.zetaType:
        zetaRepo = newGames
            .where(
                (item) => item.zetaTexts != null && item.zetaTexts!.isNotEmpty)
            .toList();
        //print("nighGameRepo => $nightGameRepo");
        //print("nighGame story updated");
        break;
      case TextType.unknownType:
        unknownRepo = newGames
            .where((item) =>
                item.unknownTexts != null && item.unknownTexts!.isNotEmpty)
            .toList();
        //print("runKaityRepo => $runKaityRepo");
        //print("runKaity story updated");
        break;
      case TextType.mysteriousType:
        mysteriousRepo = newGames
            .where((item) =>
                item.mysteriousTexts != null &&
                item.mysteriousTexts!.isNotEmpty)
            .toList();
        //print("smileRepo => $smileRepo");
        //print("smile story updated");
        break;
      case TextType.spaceType:
        spaceRepo = newGames
            .where((item) =>
                item.spaceTexts != null && item.spaceTexts!.isNotEmpty)
            .toList();
        //print("behindRepo => $behindRepo");
        //print("behind story updated");
        break;
      case TextType.luckyType:
        luckyRepo = newGames
            .where((item) =>
                item.luckyTexts != null && item.luckyTexts!.isNotEmpty)
            .toList();
        //print("luckyRepo => $luckyRepo");
        //print("lucky story updated");
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
      case TextType.gravehurstType:
        if (eklenicekMetin.isNotEmpty && eklenicekMetin != "") {
          final item = NewGame()..gravehurstTexts = eklenicekMetin;
          await isar.writeTxn(() async {
            await isar.newGames.put(item);
          });
          selectedStoryUpdate(type: TextType.gravehurstType);
        }
        break;
      case TextType.webOfDeceitType:
        if (eklenicekMetin.isNotEmpty && eklenicekMetin != "") {
          final item = NewGame()..webOfDeceitTexts = eklenicekMetin;
          await isar.writeTxn(() async {
            await isar.newGames.put(item);
          });
          selectedStoryUpdate(type: TextType.webOfDeceitType);
        }
        break;
      case TextType.zetaType:
        if (eklenicekMetin.isNotEmpty && eklenicekMetin != "") {
          final item = NewGame()..zetaTexts = eklenicekMetin;
          await isar.writeTxn(() async {
            await isar.newGames.put(item);
          });
          selectedStoryUpdate(type: TextType.zetaType);
        }
        break;
      case TextType.unknownType:
        if (eklenicekMetin.isNotEmpty && eklenicekMetin != "") {
          final item = NewGame()..unknownTexts = eklenicekMetin;
          await isar.writeTxn(() async {
            await isar.newGames.put(item);
          });
          selectedStoryUpdate(type: TextType.unknownType);
        }
        break;
      case TextType.mysteriousType:
        if (eklenicekMetin.isNotEmpty && eklenicekMetin != "") {
          final item = NewGame()..mysteriousTexts = eklenicekMetin;
          await isar.writeTxn(() async {
            await isar.newGames.put(item);
          });
          selectedStoryUpdate(type: TextType.mysteriousType);
        }
        break;
      case TextType.spaceType:
        if (eklenicekMetin.isNotEmpty && eklenicekMetin != "") {
          final item = NewGame()..spaceTexts = eklenicekMetin;
          await isar.writeTxn(() async {
            await isar.newGames.put(item);
          });
          selectedStoryUpdate(type: TextType.spaceType);
        }
        break;
      case TextType.luckyType:
        if (eklenicekMetin.isNotEmpty && eklenicekMetin != "") {
          final item = NewGame()..luckyTexts = eklenicekMetin;
          await isar.writeTxn(() async {
            await isar.newGames.put(item);
          });
          selectedStoryUpdate(type: TextType.luckyType);
        }
        break;
      default:
    }
  }
}
