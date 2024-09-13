import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:page_transition/page_transition.dart';

class InfoMenuView extends StatelessWidget {
  const InfoMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            ConstantPaths.infoPageBackgroundImage,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Observer(
                      builder: (_) => IconButton(
                          onPressed: () => Navigator.pop(
                                context,
                                PageTransition(
                                  child: Container(),
                                  type: PageTransitionType.fade,
                                ),
                              ),
                          icon: AppFonts.backButtonIcon),
                    ),
                  ),
                ),
                const Spacer(flex: 7),

                Column(
                  children: [
                    _buildCreditText(
                        ConstantTexts.CreatedBy.tr(), ConstantTexts.devast),
                    const SizedBox(height: 8),
                    _buildCreditText(ConstantTexts.Developers.tr(),
                        ConstantTexts.developersnames),
                    const SizedBox(height: 8),
                    _buildCreditText(ConstantTexts.Contributors.tr(),
                        ConstantTexts.contributorsnames),
                  ],
                ),
                const Spacer(),
                // Version Info
                const Text(
                  ConstantTexts.Version,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditText(String title, String names) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          letterSpacing: 1.5,
          height: 1.5,
        ),
        children: [
          TextSpan(
            text: '$title\n',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: names,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
