import 'package:flutter/material.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/view/shop_view.dart';
import 'package:gapsec/widgets/language_settings_widget/flag_button.dart';
import 'package:gapsec/widgets/main_menu_widget/token_counter.dart';

class SettingsButtons extends StatefulWidget {
  const SettingsButtons({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsButtonState createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButtons> {
  bool _isLanguageExpanded = false;
  HomeState hs = HomeState();

  void _toggleLanguageMenu() {
    setState(() {
      _isLanguageExpanded = !_isLanguageExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () => hs.goToPageBottomToTop(
                    context: context, page: const ShopView()),
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
                color: Colors.white,
                iconSize: 30,
              ),
              Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _isLanguageExpanded ? 150 : 0,
                    height: 40,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_isLanguageExpanded) ...[
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
                  ),
                  IconButton(
                    icon: const Icon(Icons.language),
                    onPressed: _toggleLanguageMenu,
                    iconSize: 30.0,
                    color: CustomColors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
