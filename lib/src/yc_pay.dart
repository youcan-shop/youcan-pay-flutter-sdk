import 'package:flutter/widgets.dart';

import 'localization/ycpay_locale.dart';
import 'models/account_config.dart';
import 'models/card_information.dart';
import 'services/account_config_service.dart';
import 'services/pay_with_card_service.dart';

class YCPay {
  String publicKey;
  BuildContext context;
  String locale;

  late PayWithCardService payWithCardService;
  late AccountConfigService accountConfigService = AccountConfigService();

  YCPay({
    required this.publicKey,
    required this.context,
    this.locale = YCPayLocale.defaultLocale
  }) {
    YCPayLocale.locale = locale;
    payWithCardService = PayWithCardService(context: context);
  }

  Future<AccountConfig> getAccountConfig() async {
    return await accountConfigService.getAccountConfig(pubKey: publicKey);
  }

  Future payWithCard({
    required String token,
    required CardInformation cardInformation,
    required Function(String? transactionId) onSuccessfulPayment,
    required Function(String? message) onFailedPayment
  }) async {
    payWithCardService.payWithCard(
        token: token,
        pubKey: publicKey,
        cardInformation: cardInformation,
        onSuccessfulPayment: onSuccessfulPayment,
        onFailedPayment: onFailedPayment
    );
  }
}
