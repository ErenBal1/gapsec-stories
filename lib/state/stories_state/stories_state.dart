import 'package:mobx/mobx.dart';
import 'package:video_player/video_player.dart';
part 'stories_state.g.dart';

class StoriesState = _StoriesStateBase with _$StoriesState;

abstract class _StoriesStateBase with Store {
  @observable
  late VideoPlayerController controller;
  @action
  Future<void> initializeVideo() async {
    controller = VideoPlayerController.asset('assets/videos/thunder.mp4')
      ..setLooping(true);
    await controller.initialize();
    controller.play();
  }

  @action
  void dispose() {
    controller.dispose();
  }
}
