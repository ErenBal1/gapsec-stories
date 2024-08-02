import 'package:flutter/material.dart';
import 'package:gapsec/main.dart';
import 'package:page_transition/page_transition.dart';

void restartApp(BuildContext context) {
  Navigator.pushAndRemoveUntil(
      context,
      PageTransition(type: PageTransitionType.fade, child: const MainApp()),
      (route) => false);
}
