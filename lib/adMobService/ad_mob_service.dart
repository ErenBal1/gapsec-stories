import 'dart:io';

class AdMobService {
  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/5224354917";
    }
    return null;
  }
}
