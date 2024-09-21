import 'package:easy_localization/easy_localization.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/utils/constants.dart';

class StoryModel {
  final String name;
  final String description;
  bool isLock;
  final List<NewGame?> whichRepo;
  final int price;
  StoryModel(
      {required this.name,
      required this.description,
      required this.isLock,
      required this.whichRepo,
      required this.price});
}

StoryModel murder = StoryModel(
    name: "Murder",
    description: ConstantTexts.MurderDescription.tr(),
    isLock: false,
    whichRepo: DatabaseService().murderRepo,
    price: 100);
StoryModel dontLookBack = StoryModel(
    name: "Don't Look Back",
    description:
        "Geçmişin gölgeleri peşini bırakmıyor. Arkana bakmadan kaçabilecek misin, yoksa geçmişinle yüzleşmek zorunda mı kalacaksın?",
    isLock: DatabaseService().dontLookBackIsLockDefault ?? true,
    whichRepo: DatabaseService().dontLookBackRepo,
    price: 0);
StoryModel lostLucy = StoryModel(
    name: "Lost Lucy",
    description:
        "Kayıp bir kızın hikayesi, labirent gibi bir ormanda saklı. Lucy'yi bulabilecek misin, yoksa sen de mi kaybolacaksın?",
    isLock: DatabaseService().lostLucyIsLockDefault ?? true,
    whichRepo: DatabaseService().lostLucyRepo,
    price: 0);
StoryModel nightGame = StoryModel(
    name: "Night Game",
    description:
        "Gece yarısı başlayan ölümcül bir oyun. Kuralları çöz, hayatta kal. Şafak sökmeden oyunu bitirebilecek misin?",
    isLock: DatabaseService().nightGameIsLockDefault ?? true,
    whichRepo: DatabaseService().nightGameRepo,
    price: 100);
StoryModel runKaity = StoryModel(
    name: "Run Kaity",
    description:
        "Kaity için zaman daralıyor. Onu kurtarmak için koş, saklan ve savaş. Ama dikkatli ol, her köşede yeni bir tehlike seni bekliyor.",
    isLock: DatabaseService().runKaityIsLockDefault ?? true,
    whichRepo: DatabaseService().runKaityRepo,
    price: 100);
StoryModel smile = StoryModel(
    name: "Smile",
    description:
        "Gülümsemeler her zaman mutluluk belirtisi değildir. Bu kasabadaki ürkütücü gülümsemelerin ardındaki karanlık sırrı keşfet.",
    isLock: DatabaseService().smileIsLockDefault ?? true,
    whichRepo: DatabaseService().smileRepo,
    price: 100);
StoryModel behind = StoryModel(
    name: "Behind",
    description:
        "Arkanda ne var bilmiyorsun, ama onun orada olduğunu hissediyorsun. Dönüp bakmaya cesaretin var mı?",
    isLock: true,
    whichRepo: DatabaseService().behindRepo,
    price: 100);
StoryModel lucky = StoryModel(
    name: "Lucky",
    description:
        "Şans mı, yoksa lanet mi? Her seçimin seni ya kurtuluşa ya da yıkıma götürecek. Ne kadar şanslı olduğunu görelim.",
    isLock: DatabaseService().luckyIsLockDefault ?? true,
    whichRepo: DatabaseService().luckyRepo,
    price: 100);

class Games {
  List historiesGames = [
    murder,
    dontLookBack,
    lostLucy,
    nightGame,
    runKaity,
    smile,
    behind,
    lucky
  ];
}
