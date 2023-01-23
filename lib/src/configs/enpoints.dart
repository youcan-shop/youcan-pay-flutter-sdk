import "package:meta/meta.dart";

import '../controllers/sandbox_controller.dart';

@immutable
class YouCanPayAPIEndpoints {
  const YouCanPayAPIEndpoints();

  /// The base URL for the API.
  String get baseUrl => "https://youcanpay.com/";

  /// The base URL for the sandbox API.
  String get sandboxBasedUrl => "${baseUrl}sandbox/";

  /// The base endpoint for the account configs.
  String get configUrl => "get-account-configs/";

  /// The base endpoint for the payment with card.
  String get payWithCardUrl => "api/pay/";

  /// The base endpoint for the payment with cash plus.
  String get payWithCashPlusUrl => "api/cashplus/init/";

  /// The base url builder based on the sandbox mode.
  /// If the sandbox mode is enabled, it will return the [sandboxBasedUrl] url.
  /// Otherwise, it will return the [baseUrl] url.
  String baseUrlBasedOnSandBox() {
    return SandboxController.isSandbox ? sandboxBasedUrl : baseUrl;
  }

  /// The endpoint builder for the account config url with the given [pubKey].
  String keyConfigUrl(String pubKey) {
    return configUrl + pubKey;
  }
}
