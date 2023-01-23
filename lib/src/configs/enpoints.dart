import "package:meta/meta.dart";

@immutable
class YouCanPayAPIEndpoints {
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
}
