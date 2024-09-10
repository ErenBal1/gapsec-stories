import 'dart:io';

class AdMobService {
  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3311093782197009/4432898821";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3311093782197009/5720572524";
      //ca-app-pub-3940256099942544/5224354917
    }
    return null;
  }
}
