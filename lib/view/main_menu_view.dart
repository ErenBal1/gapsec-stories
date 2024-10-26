import 'package:animated_glitch/animated_glitch.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/state/shop_state/shop_state.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/widgets/main_menu_widget/main_menu_buttons.dart';
import 'package:gapsec/widgets/main_menu_widget/settings.dart';
import 'package:gapsec/widgets/main_menu_widget/token_counter.dart';

class MainMenuView extends StatelessWidget {
  final HomeState vm;
  final ShopState shops;

  const MainMenuView({super.key, required this.vm, required this.shops});
  @override
  @override
  Widget build(BuildContext context) {
    final controller = AnimatedGlitchController(
      frequency: const Duration(milliseconds: 350),
      level: 1.8,
      distortionShift: const DistortionShift(count: 3),
    );
    bool showDistortion = true;
    bool showColorChannel = true;
    return FutureBuilder(
      future: DatabaseService().addTokens(0),
      builder: (context, snapshot) => Stack(
        children: [
          AnimatedGlitch(
            showColorChannels: showColorChannel,
            showDistortions: showDistortion,
            controller: controller,
            child: Image.asset(
              ConstantPaths.mainPageBackgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          TokenCounter(ss: shops),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                  child: Text(ConstantTexts.GAPSEC,
                      style: AppFonts.mainMenuTitle)),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: MenuButtons(vm: vm),
              ),
            ],
          ),
          SettingsButtons(),
        ],
      ),
    );
  }
}
