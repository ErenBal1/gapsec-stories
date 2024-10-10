import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'theme/app_theme.dart';
import 'utils/app_colors.dart';
import 'utils/constants.dart';
import 'view/home_view.dart';
import 'view/splash_view.dart';

import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await DatabaseService.initialize();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
/* 
  await requestIDFA(); */

  runApp(EasyLocalization(
    supportedLocales: const [
      LanguageConstants.enLocale,
      LanguageConstants.trLocale,
    ],
    fallbackLocale: LanguageConstants.enLocale,
    startLocale: LanguageConstants.enLocale,
    path: LanguageConstants.langPath,
    child: const MainApp(),
  ));
}

// IDFA izni istemek için kullanılan fonksiyon
/* Future<void> requestIDFA() async {
  final status = await AppTrackingTransparency.trackingAuthorizationStatus;

  // Eğer izni daha önce sormadıysanız, kullanıcıdan izin isteyin
  if (status == TrackingStatus.notDetermined) {
    final newStatus =
        await AppTrackingTransparency.requestTrackingAuthorization();
    print("IDFA tracking status: $newStatus");
  }
  /* if (kDebugMode) {
    RequestConfiguration requestConfiguration = RequestConfiguration(
      testDeviceIds: ['b973c9d2d665a8fcd5bbdcc18bc0dfb3'], // Test cihazı ID
    );
    MobileAds.instance.updateRequestConfiguration(requestConfiguration);
    print("Test cihazı modunda reklamlar gösterilecek");
  } */

  // IDFA izni verildikten sonra reklamları başlatabilirsiniz
  // Reklamlar için gerekli fonksiyonları buraya ekleyin.
} */

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: "Gapsec",
      home: AnimatedSplashScreen(
        function: () async => DatabaseService().updateDefaultValues(),
        splash: const SplashView(),
        duration: 8000,
        backgroundColor: CustomColors.black,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        nextScreen: HomeView(),
      ),
    );
  }
}
