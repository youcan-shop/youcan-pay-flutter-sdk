import '../localization/ycpay_locale.dart';

class Constants {
  /// The base URL for the API.
  static const String baseUrl = "https://youcanpay.com/";
  static const String sandboxBasedUrl = "${baseUrl}sandbox/";
  static const String configUrl = "get-account-configs/";
  static const String payWithCardUrl = "api/pay/";
  static const String payWithCashPlusUrl = "api/cashplus/init/";

  ///  The headers for the API.
  static Map<String, dynamic> get headers {
    final String headerLocale = YCPayLocaleHandler.locale.abbreviationName;

    assert(headerLocale.length == 2, "Locale must be 2 characters long");

    return <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
      "X-Preferred-Locale": headerLocale,
    };
  }
}
