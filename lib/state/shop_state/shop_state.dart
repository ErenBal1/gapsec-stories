import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:page_transition/page_transition.dart';
part 'shop_state.g.dart';

class ShopState = _ShopStateBase with _$ShopState;

abstract class _ShopStateBase with Store {
  @observable
  int amount = 0;

  @action
  void goBack(BuildContext context) {
    Navigator.pop(
        context,
        PageTransition(
          child: Container(),
          type: PageTransitionType.fade,
        ));
  }
}
