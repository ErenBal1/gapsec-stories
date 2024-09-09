import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/cache/model/new_game_model/newgame_model.dart';
import 'package:gapsec/state/stories_state/stories_state.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/utils/restart_app.dart';
import 'package:gapsec/widgets/alert_widgets/alert_widgets.dart';

class FlagButton extends StatelessWidget {
  String path;

  FlagButton({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    bool isSelected = (path == LanguageConstants.TRflagPath &&
            context.locale == LanguageConstants.trLocale) ||
        (path == LanguageConstants.UKflagPath &&
            context.locale == LanguageConstants.enLocale);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: isSelected ? Border.all(color: Colors.amber, width: 2) : null,
      ),
      child: ElevatedButton(
        onPressed: () async {
          AlertWidgets().showOkAlert(
            context,
            ConstantTexts.languageChanged.tr(),
            ConstantTexts.manualRestartNeeded.tr(),
            ConstantTexts.okay.tr(),
            () async {
              if (path == LanguageConstants.TRflagPath &&
                  context.locale != LanguageConstants.trLocale) {
                context.setLocale(LanguageConstants.trLocale);
              } else if (path == LanguageConstants.UKflagPath &&
                  context.locale != LanguageConstants.enLocale) {
                context.setLocale(LanguageConstants.enLocale);
              }
            },
          );
          await StoriesState().deleteAllStories(type: TextType.murderType);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.blueGrey.shade700,
          padding: const EdgeInsets.all(5),
        ),
        child: Image.asset(path),
      ),
    );
  }
}
