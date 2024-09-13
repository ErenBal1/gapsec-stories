import 'package:flutter/material.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/state/shop_state/shop_state.dart';
import 'package:gapsec/view/main_menu_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeState vm = HomeState();
  final ShopState ss = ShopState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainMenuView(
        shops: ss,
        vm: vm,
      ),
    );
  }
}
