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

  @override
  String toString() {
    return "AccountConfig(success: $success, message: $message, acceptsCreditCards: $acceptsCreditCards, acceptsCashPlus: $acceptsCashPlus, cashPlusTransactionEnabled: $cashPlusTransactionEnabled, acceptsYouCanPayWallet: $acceptsYouCanPayWallet, walletTransactionEnabled: $walletTransactionEnabled, helpCenterEnabled: $helpCenterEnabled, paymentsActive: $paymentsActive)";
  }
}
