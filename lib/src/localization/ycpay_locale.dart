class YCPayLocale {
  static const String defaultLocale = "en";
  static String locale = defaultLocale;
  static const List<String> supportedLanguage = ["en", "fr", "ar"];

  static void setLocale(String locale) {
    if (supportedLanguage.contains(locale)) {
      YCPayLocale.locale = locale;

      return;
    }
    YCPayLocale.locale = defaultLocale;
  }
}
