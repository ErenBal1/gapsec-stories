import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/view/info_menu_view.dart';
import 'package:gapsec/widgets/language_settings_widget/flag_button.dart';

class SettingsButtons extends StatelessWidget {
  SettingsButtons({super.key});

  final HomeState hs = HomeState();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 30,
          left: 20,
          child: IconButton(
            icon: const Icon(
              size: 30,
              Icons.info,
              color: CustomColors.white,
            ),
            onPressed: () =>
                hs.goToPage(context: context, page: const InfoMenuView()),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Observer(builder: (_) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: hs.isLanguageExpanded ? 150 : 0,
                          height: 40,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (hs.isLanguageExpanded) ...[
                                  FlagButton(
                                    path: LanguageConstants.TRflagPath,
                                  ),
                                  const SizedBox(width: 5),
                                  FlagButton(
                                    path: LanguageConstants.UKflagPath,
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      }),
                      IconButton(
                        icon: const Icon(Icons.language),
                        onPressed: hs.toggleLanguageMenu,
                        iconSize: 30.0,
                        color: CustomColors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
