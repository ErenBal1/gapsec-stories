import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/cache/service/database_service.dart';
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
      /*  appBar: AppBar(
        title: Observer(builder: (_) => Text(ss.amount.toString())),
      ), */
      body: MainMenuView(
        shops: ss,
        vm: vm,
      ),
    );
  }
}
