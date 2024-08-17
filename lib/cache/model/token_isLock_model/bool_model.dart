import 'package:isar/isar.dart';
part 'bool_model.g.dart';

@collection
class BoolModel {
  Id id = Isar.autoIncrement;

  int? tokenAmount;
  bool? murderIsLock;
  bool? dontLookBackIsLock;
  bool? lostLucyIsLock;
  bool? nightGameIsLock;
  bool? runKaityIsLock;
  bool? smileIsLock;
  bool? behindIsLock;
  bool? luckyIsLock;

  firstWhere(bool Function(dynamic item) param0) {}
}
/*
oyunu ilk indirdiğimizde default değerler database serviste yazılı.
token satın aldıkça database e kaydedilcek. uygulamayı silersede aşşağıdaki fonksiyon ile geçmiş satın alımlardan tokenleri geri getiricez

void restorePurchases() async {
  final InAppPurchaseConnection connection = InAppPurchaseConnection.instance;
  final bool available = await connection.isAvailable();
  
  if (available) {
    final QueryPurchaseDetailsResponse response = await connection.queryPastPurchases();
    if (response.error == null) {
      for (PurchaseDetails purchase in response.pastPurchases) {
        if (purchase.status == PurchaseStatus.purchased) {
          // Her bir satın alım için gerekli işlemleri yapın
          if (purchase.productID == 'token_100') {
            // 100 token ekle
            addTokens(100);
          } else if (purchase.productID == 'token_300') {
            // 300 token ekle
            addTokens(300);
          }
          // Daha fazla ürün ID'si ve token ekleme işlemi burada yapılabilir
        }
      }
    } else {
      // Hata durumunda hata mesajını işleyin
      print('Error restoring purchases: ${response.error}');
    }
  } else {
    // Store kullanılabilir değilse kullanıcıya bildirin
    print('Store is not available');
  }
}

void addTokens(int amount) {
  // Isar veya başka bir yöntemle token miktarını güncelleyin
  final tokens = isar.tokens.getSync(1);
  tokens.amount += amount;
  isar.writeTxnSync(() => isar.tokens.putSync(tokens));
}

*/

