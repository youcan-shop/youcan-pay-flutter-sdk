import 'package:flutter/widgets.dart';
import 'localization/ycpay_locale.dart';
import 'models/account_config.dart';
import 'models/card_information.dart';
import 'services/account_config_service.dart';
import 'controllers/sandbox_controller.dart';
import 'services/pay_with_card_service.dart';
import 'services/pay_with_cashplus_service.dart';

/// The main class of the SDK, used to initialize the SDK and execute the payments.
///
@immutable
class YCPay {
  /// The public key of your account.
  final String publicKey;

  /// The public sandbox mode boolean.
  final bool sandbox;

  /// The used locale for the SDK, if not provided, the default locale [YCPayLocale.english] will be applied.

  /// The available locales are:
  /// * For english use [YCPayLocale.english].
  /// * For french use [YCPayLocale.french].
  /// * For arabic use [YCPayLocale.arabic].
  final YCPayLocale? locale;

  late final PayWithCardService _payWithCardService;
  late final PayWithCashPlusService _payWithCashPlusService;
  late final AccountConfigService _accountConfigService;

  YCPay({
    required this.publicKey,
    this.locale = YCPayLocale.english,
    this.sandbox = false,
  }) {
    YCPayLocaleHandler.setLocale(locale ?? YCPayLocaleHandler.locale);
    SandboxController.setSandbox(sandbox);
    _initializeServices();
  }

  /// Fetch the account configuration, and returns an [AccountConfig] object.
  Future<AccountConfig> getAccountConfig() async {
    return await _accountConfigService.getAccountConfig(pubKey: publicKey);
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
      pubKey: publicKey,
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
      pubKey: publicKey,
      onSuccessfulPayment: onSuccessfulPayment,
      onFailedPayment: onFailedPayment,
    );
  }

  // initialize the services of the SDK, this is called in the constructor.
  void _initializeServices() {
    _payWithCardService = PayWithCardService();
    _payWithCashPlusService = PayWithCashPlusService();
    _accountConfigService = AccountConfigService();
  }
}
