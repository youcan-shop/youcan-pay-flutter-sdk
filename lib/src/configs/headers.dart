import '../localization/local/ycpay_locale.dart';
import 'package:meta/meta.dart';

@immutable
class YouCanPayAPIHeaders {
  const YouCanPayAPIHeaders();

  /// The default headers for the API requests.
  /// it does only defines the **Content-Type** and **Accept** headers.
  Map<String, dynamic> get defaultHeaders => <String, String>{
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

  /// The headers for the API requests, with the localization header included.
  Map<String, dynamic> jsonLocalized() {
    final String headerLocale = YCPayLocaleHandler.locale.abbreviationName;

    assert(headerLocale.length == 2, "Locale must be 2 characters long");
    final localizedDefaultHeaders = Map<String, dynamic>.from(defaultHeaders)
      ..addAll({"Accept-Language": headerLocale});
    return localizedDefaultHeaders;
  }
}
