extension ResponseMapValidationExtension on Map<String, dynamic> {
  /// Checks if the map contains the keys required to create an [AccountConfig] object.
  bool canBeParsedToAccountConfig() {
    return containsKey("acceptsCreditCards") &&
        containsKey("acceptsCashPlus") &&
        containsKey("cashPlusTransactionEnabled") &&
        containsKey("account");
  }

  /// Checks if the [Map<String, dynamic>] contains a message key.
  bool containsMessage() {
    return containsKey("message");
  }

  /// Checks if the [Map<String, dynamic>] contains a redirect_url or return_url key.
  bool requires3dAuthentication() {
    return containsKey("redirect_url") && containsKey("return_url");
  }

  /// Checks if the [Map<String, dynamic>] contains a token key.
  bool tokenized() {
    return containsKey("token");
  }

  /// Inserts the token to the [Map<String, dynamic>].
  void token(String token) {
    this["token"] = token;
  }

  /// Inserts the pubKey to the [Map<String, dynamic>].
  void pubKey(String pubKey) {
    this["pub_key"] = pubKey;
  }

  /// Inserts the isMobile to the [Map<String, dynamic>].
  void isMobile(String isMobile) {
    this["is_mobile"] = isMobile;
  }
}
