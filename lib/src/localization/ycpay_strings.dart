import '../exceptions/invalid_locale_exception.dart';
import 'strings/ar_strings.dart';
import 'strings/en_strings.dart';
import 'strings/fr_strings.dart';
import 'ycpay_locale.dart';

/// This class is used to manage the strings of the app.
class YCPayStrings {
  /// Returns the string associated with the given [key] in the current locale.
  static String get(String key) {
    switch (YCPayLocaleHandler.locale) {
      case YCPayLocale.french:
        return french[key] ?? key;
      case YCPayLocale.arabic:
        return arabic[key] ?? key;
      case YCPayLocale.english:
        return english[key] ?? key;
      default:
        throw InvalidLocaleException(
          "The locale ${YCPayLocaleHandler.locale} is not supported.",
        );
    }
  }
}
