/// Represents the current locale of the app.
enum YCPayLocale {
  english,
  french,
  arabic,
}

class YCPayLocaleHandler {
  static YCPayLocale _defaultLocale = YCPayLocale.english;

  /// Returns the current locale, defaults to [YCPayLocale.english].
  static YCPayLocale get locale => _defaultLocale;

  static void setLocale(YCPayLocale newLocale) {
    _defaultLocale = newLocale;
  }
}

extension YCPayLocaleExtension on YCPayLocale {
  String get abbreviationName =>
      toString().split('.').last.substring(0, 2).toLowerCase();
}
