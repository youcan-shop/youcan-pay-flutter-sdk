import 'strings/ar_strings.dart';
import 'strings/en_strings.dart';
import 'strings/fr_strings.dart';
import 'ycpay_locale.dart';

class YCPayStrings {
  static String get(String key) {
    switch (YCPayLocale.locale) {
      case "fr":
        return french[key] ?? key;
      case "ar":
        return arabic[key] ?? key;
      default:
        return english[key] ?? key;
    }
  }
}
