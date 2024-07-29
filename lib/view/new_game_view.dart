import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';

class NewGameView extends StatefulWidget {
  const NewGameView({super.key});

  @override
  State<NewGameView> createState() => _NewGameViewState();
}

class _NewGameViewState extends State<NewGameView> {
  final StoriesState vm = StoriesState();
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return PopScope(
        canPop: false,
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: Config.screenHeight! * 0.05,
                left: Config.screenWidth! * 0.02,
                child: Observer(builder: (_) {
                  return IconButton(
                    onPressed: () async {
                      vm.goBack(context: context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: CustomColors.white,
                    ),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
