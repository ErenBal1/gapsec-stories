import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';

part 'stories_state.g.dart';

class StoriesState = _StoriesStateBase with _$StoriesState;

abstract class _StoriesStateBase with Store {
  @observable
  late VideoPlayerController? controller;

  @observable
  bool isVideoInitialized = false;

  @action
  Future<void> initializeVideo() async {
    controller = VideoPlayerController.asset('assets/videos/thunder.mp4')
      ..setLooping(true);
    try {
      await controller?.initialize();
      isVideoInitialized = true;
      controller?.play();
    } catch (e) {
      debugPrint('Video initialization failed: $e');
    }
  }

  @action
  Future<void> closeVideo() async {
    controller?.pause();
    controller?.dispose();
    controller =
        null; // controller'ı null yaparak artık kullanılmaz hale getiriyoruz
    isVideoInitialized = false;
  }

  @action
  void goBack({required BuildContext context}) {
    Navigator.pop(
        context,
        PageTransition(
          child: Container(),
          type: PageTransitionType.fade,
        ));
  }

  @action
  void dispose() {
    if (controller != null) {
      controller!.pause();
      controller!.dispose();
      controller = null;
    }
    isVideoInitialized = false;
  }
}
