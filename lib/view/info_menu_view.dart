import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/utils/app_colors.dart';
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
            "assets/images/arkaa.png",
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Column(
              children: [
                Align(
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
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: CustomColors.white,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 7),

                Column(
                  children: [
                    _buildCreditText('Created By', 'DEVAST'),
                    const SizedBox(height: 8),
                    _buildCreditText(
                        'Developers', 'TAHA YASIN BIKE   EREN BAL'),
                    const SizedBox(height: 8),
                    _buildCreditText(
                        'Contributors', 'TAHA YASIN BIKE   EREN BAL'),
                  ],
                ),
                const Spacer(),
                // Version Info
                const Text(
                  'Version 1.0.0',
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
