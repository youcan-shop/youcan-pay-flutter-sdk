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
  late PayWithCardService _payWithCardService;
  late PayWithCashPlusService _payWithCashPlusService;
  late AccountConfigService _accountConfigService;

  YCPay({
    required String publicKey,
    bool sandbox = false,
    YCPayLocale? locale,
  }) {
    _publicKey = publicKey;

    YCPayLocaleHandler.setLocale(locale ?? YCPayLocaleHandler.locale);
    SandboxController.setSandbox(sandbox);

    _payWithCardService = PayWithCardService();
    _payWithCashPlusService = PayWithCashPlusService();
    _accountConfigService = AccountConfigService();
  }

  /// Fetch the account configuration, and returns an [AccountConfig] object.
  Future<AccountConfig> getAccountConfig() async {
    return await _accountConfigService.getAccountConfig(pubKey: _publicKey);
  }

  /// Executes the payment with a given [CardInformation] object.
  Future<void> payWithCard({
    required String token,
    required CardInformation cardInformation,
    required Function(String? transactionId) onSuccessfulPayment,
    required Function(String? message) onFailedPayment,
    required BuildContext context,
  }) async {
    _payWithCardService.payWithCard(
      token: token,
      pubKey: _publicKey,
      cardInformation: cardInformation,
      onSuccessfulPayment: onSuccessfulPayment,
      onFailedPayment: onFailedPayment,
      context: context,
    );
  }

  /// Executes the payment with CashPlus using a given payment token.
  Future<void> payWithCashPlus({
    required String token,
    required Function(String? transactionId, String? cashPlusToken)
        onSuccessfulPayment,
    required Function(String? message) onFailedPayment,
  }) async {
    return await _payWithCashPlusService.payWithCashPlus(
      token: token,
      pubKey: _publicKey,
      onSuccessfulPayment: onSuccessfulPayment,
      onFailedPayment: onFailedPayment,
    );
  }
}
