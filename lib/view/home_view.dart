import 'package:flutter/material.dart';
import 'package:gapsec/widgets/main_menu_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: MainMenuWidget(),
    );
  }
}
