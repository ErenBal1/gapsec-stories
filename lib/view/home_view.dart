import 'package:flutter/material.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/view/main_menu_view.dart';

class HomeView extends StatelessWidget {
  final HomeState vm = HomeState();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainMenuView(vm: vm),
    );
  }
}
