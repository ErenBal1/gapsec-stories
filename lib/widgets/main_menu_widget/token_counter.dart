import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/state/homse_state/home_state.dart';
import 'package:gapsec/state/shop_state/shop_state.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/view/shop_view.dart';

class TokenCounter extends StatelessWidget {
  final ShopState ss;
  TokenCounter({super.key, required this.ss});

  final HomeState vm = HomeState();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () => vm.goToPageBottomToTop(
              page: const ShopView(),
              context: context,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.red.withOpacity(0.5),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.2),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 5,
                      bottom: 5,
                      top: 5,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GlowingIcon(Icons.add, Colors.red),
                        const SizedBox(width: 30),
                        Observer(builder: (_) {
                          return Text(
                            ss.amount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.blue.withOpacity(0.6),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          );
                        }),
                        const SizedBox(width: 6),
                        GlowingToken(ConstantPaths.tokenImagePath, Colors.red),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget GlowingIcon(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.6),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  Widget GlowingToken(String assetPath, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.6),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Image.asset(
        assetPath,
        height: 30,
        width: 30,
      ),
    );
  }
}
