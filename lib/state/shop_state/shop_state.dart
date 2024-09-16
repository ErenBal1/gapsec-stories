import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:page_transition/page_transition.dart';

part 'shop_state.g.dart';

// Use a singleton pattern for ShopState
class ShopState extends _ShopStateBase with _$ShopState {
  static final ShopState _singleton = ShopState._internal();

  factory ShopState() {
    return _singleton;
  }

  ShopState._internal();
}

abstract class _ShopStateBase with Store {
  @observable
  int amount = 0;

  @action
  Future<void> updateAmount(int newAmount) async {
    amount = newAmount;
    //print("updatedAmount shopstate => $amount");
  }

  @action
  void goBack(BuildContext context) {
    Navigator.pop(
        context,
        PageTransition(
          child: Container(),
          type: PageTransitionType.theme,
        ));
  }
}
