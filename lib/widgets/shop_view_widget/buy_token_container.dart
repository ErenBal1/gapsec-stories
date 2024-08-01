// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:gapsec/utils/constants.dart';

class BuyTokenContainer extends StatelessWidget {
  int tokens;
  double price;

  BuyTokenContainer({
    super.key,
    required this.tokens,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
          Image.asset(
            Constants.tokenImagePath,
            height: 60,
            width: 60,
          ),
          const SizedBox(height: 10),
          Text(
            '$tokens Tokens',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.purple[800],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '\$$price',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.green[700],
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Buy Now Pressed
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Buy Now',
              style: TextStyle(color: Colors.white60),
            ),
          ),
        ],
      ),
    );
  }
}
