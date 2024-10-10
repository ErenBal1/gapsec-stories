import 'dart:io';

class AdMobService {
  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      print("platform android");
      return "ca-app-pub-3311093782197009/4432898821";
    } else if (Platform.isIOS) {
      print("platform ios");
      return "ca-app-pub-3311093782197009/3819997607"; // bu gerçek id

      //ca-app-pub-3940256099942544/5224354917 bu test id
    }
    return null;
  }
}
