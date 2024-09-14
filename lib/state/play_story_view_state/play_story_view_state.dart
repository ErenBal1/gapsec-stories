import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';
part 'play_story_view_state.g.dart';

class PlayStoryViewState = _PlayStoryViewStateBase with _$PlayStoryViewState;

abstract class _PlayStoryViewStateBase with Store {
  @observable
  bool isEnable = true;

  @observable
  String selectedTexts = "";

  @observable
  bool textCompleted = false;

  @observable
  late VideoPlayerController mp3controller;

  @observable
  int storyMapId = 0;

  @observable
  late List repo = [];

  @observable
  late ScrollController scrollController;

  @observable
  late List<Map<String, dynamic>> selectedList = [];

  @observable
  late Map<String, dynamic> left = {}; // tek olan map

  @observable
  late Map<String, dynamic> right = {}; //çift olan map

  @action
  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @action
  void updateStoryMapId(int newId) {
    storyMapId = newId;
  }
}
