import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/adMobService/ad_mob_service.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/state/shop_state/shop_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/widgets/shop_view_widget/buy_token_container.dart';
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
      case 'mystoken_100':
        return 100;
      case 'mystoken_200':
        return 200;
      case 'mystoken_300':
        return 300;
      case 'mystoken_500':
        return 500;
      case 'mystoken_600':
        return 600;
      case 'mystoken_750':
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

        return showOkAlertDialogWidget(context, "Product not found.");
      }

      final ProductDetails productDetails = response.productDetails.first;
      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: productDetails);

      iap
          .buyConsumable(purchaseParam: purchaseParam, autoConsume: true)
          .then((_) {
        showOkAlertDialogWidget(context, 'Purchase initiated.');
        _addTokens(amount);
      }).catchError((error) {
        showOkAlertDialogWidget(context, 'Error initiating purchase: $error');
      });
    }

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
          title: Image.asset(ConstantPaths.shopTitle),
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
                      ConstantPaths.tokenImagePath,
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
            label: Text(ConstantTexts.watchADforFreeTokens.tr()),
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
                mystokenBuyContainer(
                  buyToken: buyToken,
                  productID: 'mystoken_100',
                  amountOfToken: '100 Mystoken',
                ),
                mystokenBuyContainer(
                  buyToken: buyToken,
                  productID: 'mystoken_200',
                  amountOfToken: '200 Mystoken',
                )
              ],
            ),
            Row(
              children: [
                mystokenBuyContainer(
                  buyToken: buyToken,
                  productID: 'mystoken_300',
                  amountOfToken: '300 Mystoken',
                ),
                mystokenBuyContainer(
                  buyToken: buyToken,
                  productID: 'mystoken_500',
                  amountOfToken: '500 Mystoken',
                ),
              ],
            ),
            Row(
              children: [
                mystokenBuyContainer(
                  buyToken: buyToken,
                  productID: 'mystoken_600',
                  amountOfToken: '600 Mystoken',
                ),
                mystokenBuyContainer(
                  buyToken: buyToken,
                  productID: 'mystoken_750',
                  amountOfToken: '750 Mystoken',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
