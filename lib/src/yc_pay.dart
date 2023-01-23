import 'package:flutter/widgets.dart';
import 'localization/ycpay_locale.dart';
import 'models/account_config.dart';
import 'models/card_information.dart';
import 'services/account_config_service.dart';
import 'controllers/sandbox_controller.dart';
import 'services/pay_with_card_service.dart';
import 'services/pay_with_cashplus_service.dart';

class YCPay {
  late final String _publicKey;
  late final BuildContext _context;
  late PayWithCardService _payWithCardService;
  late PayWithCashPlusService _payWithCashPlusService;
  late AccountConfigService _accountConfigService;

  YCPay({
    required String publicKey,
    required BuildContext context,
    bool sandbox = false,
    YCPayLocale? locale,
  }) {
    _publicKey = publicKey;
    _context = context;

    YCPayLocaleHandler.setLocale(locale ?? YCPayLocaleHandler.locale);
    SandboxController.setSandbox(sandbox);

    _payWithCardService = PayWithCardService();
    _payWithCashPlusService = PayWithCashPlusService();
    _accountConfigService = AccountConfigService();
  }

  Future<AccountConfig> getAccountConfig() async {
    return await _accountConfigService.getAccountConfig(pubKey: _publicKey);
  }

  Future payWithCard(
      {required String token,
      required CardInformation cardInformation,
      required Function(String? transactionId) onSuccessfulPayment,
      required Function(String? message) onFailedPayment}) async {
    _payWithCardService.payWithCard(
      token: token,
      pubKey: _publicKey,
      cardInformation: cardInformation,
      onSuccessfulPayment: onSuccessfulPayment,
      onFailedPayment: onFailedPayment,
      context: _context,
    );
  }

  void payWithCashPlus(
      {required String token,
      required Function(String? transactionId, String? cashPlusToken)
          onSuccessfulPayment,
      required Function(String? message) onFailedPayment}) async {
    _payWithCashPlusService.payWithCashPlus(
        token: token,
        pubKey: _publicKey,
        onSuccessfulPayment: onSuccessfulPayment,
        onFailedPayment: onFailedPayment);
  }
}
