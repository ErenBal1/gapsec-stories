import 'package:flutter/material.dart';
import 'package:gapsec/widgets/shop_view_widget/buy_token_container.dart';
import 'package:gapsec/widgets/shop_view_widget/watch_ad_button.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Token Shop', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[800],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple[800]!, Colors.purple[200]!],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return BuyTokenContainer(
                    tokens: (index + 1) * 20,
                    price: (index + 1) * 5.0,
                  );
                },
              ),
            ),
            const WatchAdButton(),
          ],
        ),
      ),
    );
  }
}
