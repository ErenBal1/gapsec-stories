import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';

class MystokenBuyContainer extends StatelessWidget {
  final Color cardColor = CustomColors.storyCardColor;
  final cardTitleColor = const Color.fromARGB(255, 218, 204, 204);
  final String productID;
  final String amountOfToken;

  final Function buyToken;
  const MystokenBuyContainer(
      {super.key,
      required this.buyToken,
      required this.productID,
      required this.amountOfToken});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                ConstantPaths.tokenImagePath,
                height: 60,
                width: 60,
              ),
              const SizedBox(height: 10),
              Text(
                amountOfToken,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: cardTitleColor,
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  buyToken(productId: productID, context: context, amount: 100);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(ConstantTexts.BuyNow.tr(),
                    style: AppFonts.shopBuyButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
