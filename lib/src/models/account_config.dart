class AccountConfig {
  bool success;
  String message;
  bool acceptsCreditCards;
  bool acceptsCashPlus;
  bool cashPlusTransactionEnabled;
  bool acceptsYouCanPayWallet;
  bool walletTransactionEnabled;
  bool helpCenterEnabled;
  bool paymentsActive;

  AccountConfig({
    required this.success,
    this.message = "",
    this.acceptsCreditCards = false,
    this.acceptsCashPlus = false,
    this.cashPlusTransactionEnabled = false,
    this.acceptsYouCanPayWallet = false,
    this.walletTransactionEnabled = false,
    this.helpCenterEnabled = false,
    this.paymentsActive = false,
  });

  factory AccountConfig.fromMap(
    Map<String, dynamic> map, {
    required bool success,
  }) {
    return AccountConfig(
      success: success,
      acceptsCreditCards: map["acceptsCreditCards"],
      acceptsCashPlus: map["acceptsCashPlus"],
      cashPlusTransactionEnabled: map["cashPlusTransactionEnabled"],
      acceptsYouCanPayWallet: map["acceptsYouCanPayWallet"] ?? false,
      walletTransactionEnabled: map["walletTransactionEnabled"] ?? false,
      helpCenterEnabled: map["helpCenterEnabled"] ?? false,
      paymentsActive:
          map["account"] is Map ? map["account"]["payments_active"] : false,
    );
  }

  factory AccountConfig.fromMessage(
    String message, {
    required bool success,
  }) {
    return AccountConfig(
      success: success,
      message: message,
    );
  }
  @override
  String toString() {
    return "AccountConfig(success: $success, message: $message, acceptsCreditCards: $acceptsCreditCards, acceptsCashPlus: $acceptsCashPlus, cashPlusTransactionEnabled: $cashPlusTransactionEnabled, acceptsYouCanPayWallet: $acceptsYouCanPayWallet, walletTransactionEnabled: $walletTransactionEnabled, helpCenterEnabled: $helpCenterEnabled, paymentsActive: $paymentsActive)";
  }
}
