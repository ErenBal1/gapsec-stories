import 'package:flutter/material.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:mobx/mobx.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';
part 'new_game_view_state.g.dart';

class NewGameViewState = _NewGameViewStateBase with _$NewGameViewState;

abstract class _NewGameViewStateBase with Store {
  final DatabaseService _databaseService = DatabaseService();

  @observable
  late VideoPlayerController controller;

  @action
  Future<void> updateDefaultValues() async {
    await _databaseService.updateDefaultValues();
  }

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
