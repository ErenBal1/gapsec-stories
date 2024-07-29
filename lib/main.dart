import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gapsec/theme/app_theme.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/view/home_view.dart';
import 'package:gapsec/view/splash_view.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: "Gapsec",
      home: AnimatedSplashScreen(
          splash: const SplashView(),
          duration: 8000,
          backgroundColor: CustomColors.black,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          nextScreen: HomeView()),
    );
  }
}
