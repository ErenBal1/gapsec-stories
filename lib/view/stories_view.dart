import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:video_player/video_player.dart';

class StoriesView extends StatelessWidget {
  final StoriesState videoStore = StoriesState();

  StoriesView({super.key}) {
    videoStore.initializeVideo();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Config.screenHeight,
            width: Config.screenWidth,
            child: Observer(
              builder: (_) {
                if (videoStore.controller.value.isInitialized) {
                  return AspectRatio(
                    aspectRatio: videoStore.controller.value.aspectRatio,
                    child: VideoPlayer(videoStore.controller),
                  );
                } else {
                  return const CircularProgressIndicator(
                    color: CustomColors.red,
                  );
                }
              },
            ),
          ),
          Positioned(
            top: (Config.screenHeight! *
                0.70), // istediğiniz pozisyona göre ayarlayın
            left: (Config.screenWidth! * 0.10),
            child: Text(
              "STORIES",
              style: AppFonts.normRed,
            ),
          ),
        ],
      ),
    );
  }
}
