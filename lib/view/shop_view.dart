import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/adMobService/ad_mob_service.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/state/shop_state/shop_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/app_font.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/widgets/shop_view_widget/watch_ad_button.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ShopView extends StatefulWidget {
  const ShopView({
    super.key,
  });

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  RewardedAd? _rewardedAd;

  final _databaseService = DatabaseService();
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

  Future<void> _addTokens(int amount) async {
    await _databaseService.addTokens(amount);
    setState(() {});
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createRewardedAd();
          print("Reklam Kapatıldı");
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createRewardedAd();
          print('Reklam gösterilemedi: $error');
        },
      );
      _rewardedAd!.show(
          onUserEarnedReward: (ad, reward) => setState(() {
                _addTokens(2);
              }));
      print("Kullanıcı ödülü kazandı");
      _rewardedAd = null;
    } else {
      print("Reklam yüklü değil");
    }
  }

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: AdMobService.rewardedAdUnitId!,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad) => setState(() {
                  _rewardedAd = ad;
                  print("Reklam başarıyla yüklendi");
                }),
            onAdFailedToLoad: (error) => setState(() {
                  _rewardedAd = null;
                  print('Reklam yüklenemedi: $error');
                })));
  }

  @override
  void initState() {
    super.initState();
    _createRewardedAd();
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
        {required String productId,
        required BuildContext context,
        required amount}) async {
      final bool available = await iap.isAvailable();
      if (!available) {
        return showOkAlertDialogWidget(context,
            "In-app purchases are not available. Please try again later.");
      }

      final ProductDetailsResponse response =
          await iap.queryProductDetails({productId}.toSet());

      if (response.notFoundIDs.isNotEmpty) {
        // Ürün bulunamadı
        _addTokens(amount); // tabiki yeri burası değil denemek içim koyuyoz
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

    const Color cardColor = CustomColors.storyCardColor;
    Color cardTitleColor = const Color.fromARGB(255, 218, 204, 204);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.red[400]!],
        ),
      ),
      child: Scaffold(
        backgroundColor: CustomColors.transparent,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => ss.goBack(context),
              icon: const Icon(
                Icons.close,
                size: 25,
                color: CustomColors.white,
              )),
          title: Image.asset('assets/images/MystokenShop-title.png'),
          backgroundColor: CustomColors.storyCardColor,
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
                          color: Colors.red.withOpacity(0.6),
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
        bottomNavigationBar: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red[400]!, Colors.black],
            ),
            color: Colors.red[800],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ElevatedButton.icon(
            onPressed: _showRewardedAd,
            icon: const Icon(Icons.videocam),
            label: const Text('Watch Ad for Free Tokens'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.symmetric(vertical: 15),
              textStyle:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            // TextButton(onPressed: _showRewardedAd, child: const Text("ad")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
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
                              color: cardTitleColor,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () async {
                              buyToken(
                                  productId: 'token_100',
                                  context: context,
                                  amount: 100);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child:
                                Text('Buy Now', style: AppFonts.shopBuyButton),
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
                              color: cardTitleColor,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              // Buy Now Pressed
                              buyToken(
                                  productId: 'token_100',
                                  context: context,
                                  amount: 200);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Buy Now',
                              style: AppFonts.shopBuyButton,
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
                              color: cardTitleColor,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              // Buy Now Pressed
                              buyToken(
                                  productId: 'token_100',
                                  context: context,
                                  amount: 300);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Buy Now',
                              style: AppFonts.shopBuyButton,
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
                              color: cardTitleColor,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              // Buy Now Pressed
                              buyToken(
                                  productId: 'token_100',
                                  context: context,
                                  amount: 500);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Buy Now',
                              style: AppFonts.shopBuyButton,
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
                              color: cardTitleColor,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              // Buy Now Pressed
                              buyToken(
                                  productId: 'token_100',
                                  context: context,
                                  amount: 600);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Buy Now',
                              style: AppFonts.shopBuyButton,
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
                              color: cardTitleColor,
                            ),
                          ),
                          const SizedBox(height: 15),
                          ElevatedButton(
                            onPressed: () {
                              // Buy Now Pressed
                              buyToken(
                                  productId: 'token_100',
                                  context: context,
                                  amount: 750);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Text(
                              'Buy Now',
                              style: AppFonts.shopBuyButton,
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
