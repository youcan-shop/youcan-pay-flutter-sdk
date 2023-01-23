import '../localization/ycpay_locale.dart';
import 'package:meta/meta.dart';

@immutable
class YouCanPayAPIHeaders {
  const YouCanPayAPIHeaders();

  /// The headers for the API requests, with the localization header included.
  Map<String, dynamic> get jsonLocalized {
    final String headerLocale = YCPayLocaleHandler.locale.abbreviationName;

    assert(headerLocale.length == 2, "Locale must be 2 characters long");

    return <String, String>{
      "Content-Type": "application/json",
      "Accept": "application/json",
      "X-Preferred-Locale": headerLocale,
    };
  }
}
