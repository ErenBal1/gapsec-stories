import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gapsec/adMobService/ad_mob_service.dart';
import 'package:gapsec/cache/service/database_service.dart';
import 'package:gapsec/state/shop_state/shop_state.dart';
import 'package:gapsec/utils/app_colors.dart';
import 'package:gapsec/utils/constants.dart';
import 'package:gapsec/widgets/alert_widgets/alert_widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  RewardedAd? _rewardedAd;
  final AlertWidgets _alertWidgets = AlertWidgets();
  final _databaseService = DatabaseService();
  final InAppPurchase iap = InAppPurchase.instance;
  final ShopState ss = ShopState();

  Future<void> showOkAlertDialogWidget(
      BuildContext context, String message) async {
    await _alertWidgets.showOkAlert(
      context,
      message,
      ConstantTexts.error.tr(),
      ConstantTexts.okay.tr(),
      () {
        print("okay");
      },
    );
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
          print("Ad closed");
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createRewardedAd();
          print('Failed to show ad: $error');
        },
      );
      _rewardedAd!.show(
          onUserEarnedReward: (ad, reward) => setState(() {
                _addTokens(2);
              }));
      print("User earned reward");
      _rewardedAd = null;
    } else {
      print("Ad not loaded");
    }
  }

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: AdMobService.rewardedAdUnitId!,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad) => setState(() {
                  _rewardedAd = ad;
                  print("Ad loaded successfully");
                }),
            onAdFailedToLoad: (error) => setState(() {
                  _rewardedAd = null;
                  print('Failed to load ad: $error');
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
          context, ConstantTexts.purchase_error.tr(args: [error.toString()]));
    });
  }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchaseDetailsList) {
    for (var purchase in purchaseDetailsList) {
      if (purchase.status == PurchaseStatus.purchased) {
        if (purchase.pendingCompletePurchase) {
          iap.completePurchase(purchase);
          _updateTokenBalance(purchase.productID);
        }
      } else if (purchase.status == PurchaseStatus.error) {
        showOkAlertDialogWidget(context,
            ConstantTexts.purchase_error.tr(args: [purchase.error!.message]));
      }
    }
  }

  void _updateTokenBalance(String productId) {
    int tokensToAdd = _tokensFromProductId(productId);
    setState(() {
      ss.amount += tokensToAdd;
    });
    showOkAlertDialogWidget(
        context, ConstantTexts.tokens_added.tr(args: [tokensToAdd.toString()]));
  }

  int _tokensFromProductId(String productId) {
    switch (productId) {
      case ConstantTexts.mystoken_100_id:
        return 100;
      case ConstantTexts.mystoken_200_id:
        return 200;
      case ConstantTexts.mystoken_300_id:
        return 300;
      case ConstantTexts.mystoken_500_id:
        return 500;
      case ConstantTexts.mystoken_600_id:
        return 600;
      case ConstantTexts.mystoken_750_id:
        return 750;
      default:
        return 0;
    }
  }

  void buyToken(
      {required String productId,
      required BuildContext context,
      required int amount}) async {
    final bool available = await iap.isAvailable();
    if (!available) {
      return showOkAlertDialogWidget(
          context, ConstantTexts.iap_not_available.tr());
    }

    final ProductDetailsResponse response =
        await iap.queryProductDetails({productId}.toSet());

    if (response.notFoundIDs.isNotEmpty) {
      return showOkAlertDialogWidget(
          context, ConstantTexts.product_not_found.tr());
    }

    final ProductDetails productDetails = response.productDetails.first;
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: productDetails);

    iap
        .buyConsumable(purchaseParam: purchaseParam, autoConsume: true)
        .then((_) {
      showOkAlertDialogWidget(context, ConstantTexts.purchase_initiated.tr());
      _addTokens(amount);
    }).catchError((error) {
      showOkAlertDialogWidget(
          context, ConstantTexts.purchase_error.tr(args: [error.toString()]));
    });
  }

  Widget _buildTokenPackage(String productId, String title, String subtitle) {
    return GestureDetector(
      onTap: () => buyToken(
          productId: productId,
          context: context,
          amount: _tokensFromProductId(productId)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.amber[700]!, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ConstantPaths.tokenImagePath, height: 60, width: 60),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(color: Colors.amber[300], fontSize: 14),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => buyToken(
                  productId: productId,
                  context: context,
                  amount: _tokensFromProductId(productId)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: const Text('Buy Now',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.red[900]!],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () => ss.goBack(context),
              icon: const Icon(
                Icons.close,
                color: CustomColors.white,
              ),
            ),
          ),
          title: SizedBox(
              height: 120, child: Image.asset(ConstantPaths.shopTitle)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Observer(builder: (_) {
                    return Text(
                      ss.amount.toString(),
                      style: TextStyle(
                        color: Colors.amber[300],
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    );
                  }),
                  const SizedBox(width: 6),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.withOpacity(0.6),
                          spreadRadius: 2,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      ConstantPaths.tokenImagePath,
                      height: 35,
                      width: 35,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 20),
            Text(
              'Boost Your Experience!',
              style: TextStyle(
                color: Colors.amber[100],
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Get MysTokens to unlock exclusive content and features',
              style: TextStyle(
                color: Colors.amber[50],
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildTokenPackage(ConstantTexts.mystoken_100_id,
                    ConstantTexts.mystoken_100_title, '🔥 Starter Pack'),
                _buildTokenPackage(ConstantTexts.mystoken_200_id,
                    ConstantTexts.mystoken_200_title, '💪 Power Pack'),
                _buildTokenPackage(ConstantTexts.mystoken_300_id,
                    ConstantTexts.mystoken_300_title, '🚀 Boost Pack'),
                _buildTokenPackage(ConstantTexts.mystoken_500_id,
                    ConstantTexts.mystoken_500_title, '💎 Premium Pack'),
                _buildTokenPackage(ConstantTexts.mystoken_600_id,
                    ConstantTexts.mystoken_600_title, '👑 Royal Pack'),
                _buildTokenPackage(ConstantTexts.mystoken_750_id,
                    ConstantTexts.mystoken_750_title, '🌟 Ultimate Pack'),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red[900]!, Colors.black],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: ElevatedButton.icon(
            onPressed: _showRewardedAd,
            icon: const Icon(Icons.videocam, color: Colors.black),
            label: Text(
              ConstantTexts.watchADforFreeTokens.tr(),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
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
      ),
    );
  }
}
