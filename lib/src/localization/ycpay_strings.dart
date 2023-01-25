import 'package:youcanpay_sdk/src/localization/strings/strings.dart';
import '../exceptions/invalid_locale_exception.dart';
import 'local/enum.dart';
import 'local/ycpay_locale.dart';

/// This class is used to manage the strings of the app.
class YCPayStrings {
  /// Returns the string associated with the given [key] in the current locale.
  static String get(String key) {
    switch (YCPayLocaleHandler.locale) {
      case YCPayLocale.french:
        return YCPayLocalizedStrings.french[key] ?? key;
      case YCPayLocale.arabic:
        return YCPayLocalizedStrings.arabic[key] ?? key;
      case YCPayLocale.english:
        return YCPayLocalizedStrings.english[key] ?? key;
      default:
        throw InvalidLocaleException(
          "The locale ${YCPayLocaleHandler.locale} is not supported.",
        );
    }
  }
}
