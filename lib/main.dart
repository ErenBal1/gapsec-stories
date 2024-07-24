import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gapsec/theme/app_theme.dart';
import 'package:gapsec/view/home_view.dart';

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
        home: const HomeView());
  }
}
