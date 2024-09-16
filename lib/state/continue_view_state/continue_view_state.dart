import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';
part 'continue_view_state.g.dart';

class ContinueViewState = _ContinueViewStateBase with _$ContinueViewState;

abstract class _ContinueViewStateBase with Store {
  @observable
  late VideoPlayerController controller;

  @action
  void goToPageRemoveUntilPush(
      {required BuildContext context, required Widget page}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: page,
      ),
      (route) => false,
    );
  }

  @action
  void goToPage({required BuildContext context, required Widget page}) {
    Navigator.push(
        context, PageTransition(type: PageTransitionType.fade, child: page));
  }
}
