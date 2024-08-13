import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/state/shop_state/shop_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/widgets/shop_view_widget/watch_ad_button.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ShopView extends StatefulWidget {
  const ShopView({
    super.key,
  });

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  final InAppPurchase iap = InAppPurchase.instance;
  final ShopState ss = ShopState();
  Future<void> showOkAlertDialogWidget(
      BuildContext context, String message) async {
    final result = await showOkAlertDialog(
      context: context,
      title: 'Error',
      message: message,
      okLabel: 'OK',
    );
    if (result == OkCancelResult.ok) {
      print("okey");
    }
  }

  @override
  void initState() {
    super.initState();
    iap.purchaseStream.listen((purchaseDetailsList) {
      _handlePurchaseUpdates(purchaseDetailsList);
    }, onError: (error) {
      showOkAlertDialogWidget(
          context, 'An error occurred in purchase stream: $error');
    });
  }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchaseDetailsList) {
    for (var purchase in purchaseDetailsList) {
      if (purchase.status == PurchaseStatus.purchased) {
        if (purchase.pendingCompletePurchase) {
          iap.completePurchase(purchase);
          // Satın alma başarılı, token miktarını güncelle
          _updateTokenBalance(purchase.productID);
        }
      } else if (purchase.status == PurchaseStatus.error) {
        showOkAlertDialogWidget(
            context, 'Purchase Error: ${purchase.error!.message}');
      }
    }
  }

  void _updateTokenBalance(String productId) {
    int tokensToAdd = _tokensFromProductId(productId);
    setState(() {
      ss.amount += tokensToAdd;
    });
    showOkAlertDialogWidget(
        context, '$tokensToAdd tokens have been added to your account.');
  }

  int _tokensFromProductId(String productId) {
    switch (productId) {
      case 'token_100':
        return 100;
      case 'token_200':
        return 200;
      case 'token_300':
        return 300;
      case 'token_500':
        return 500;
      case 'token_600':
        return 600;
      case 'token_750':
        return 750;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    void buyToken(
        {required String productId, required BuildContext context}) async {
      final bool available = await iap.isAvailable();
      if (!available) {
        return showOkAlertDialogWidget(context,
            "In-app purchases are not available. Please try again later.");
      }

      final ProductDetailsResponse response =
          await iap.queryProductDetails({productId}.toSet());

      if (response.notFoundIDs.isNotEmpty) {
        // Ürün bulunamadı
        return showOkAlertDialogWidget(context, "Product not found.");
      }

      final ProductDetails productDetails = response.productDetails.first;
      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: productDetails);

      iap
          .buyConsumable(purchaseParam: purchaseParam, autoConsume: true)
          .then((_) {
        showOkAlertDialogWidget(context, 'Purchase initiated.');
      }).catchError((error) {
        showOkAlertDialogWidget(context, 'Error initiating purchase: $error');
      });
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purple[800]!, Colors.purple[200]!],
        ),
      ),
      child: Scaffold(
        backgroundColor: CustomColors.transparent,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => ss.goBack(context),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 40,
                color: CustomColors.white,
              )),
          title: const Text('Mystoken Shop',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.purple[800],
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  //amount of token
                  Observer(builder: (_) {
                    return Text(
                      ss.amount.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    );
                  }),
                  const SizedBox(
                    width: 6,
                  ),
                  //token icon
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purpleAccent.withOpacity(0.6),
                          spreadRadius: 4,
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Image.asset(
                      Constants.tokenImagePath,
                      height: 30,
                      width: 30,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: const WatchAdButton(),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                            '100 Mystoken',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '14.99 TL',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.green[700],
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              buyToken(
                                  productId: 'token_100', context: context);
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
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                            '200 Mystoken',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '25.99 TL',
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
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                            '300 Mystoken',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '35.99 TL',
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
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                            '500 Mystoken',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '55.99 TL',
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
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                            '600 Mystoken',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '68.99 TL',
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
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                            '750 Mystoken',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple[800],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '80.99 TL',
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
                    ),
                  ),
                )
              ],
            ),
            /* Expanded(
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
                    price: priceFunc(index, 6),
                  );
                },
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
