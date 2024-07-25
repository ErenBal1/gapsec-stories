import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:page_transition/page_transition.dart';

part 'home_state.g.dart';

class HomeState = _HomeStateBase with _$HomeState;

abstract class _HomeStateBase with Store {
  @action
  void goToPage({required BuildContext context, required Widget page}) {
    Navigator.push(
        context, PageTransition(type: PageTransitionType.fade, child: page));
  }

  @action
  void printHello() {
    print("hello");
  }
}
