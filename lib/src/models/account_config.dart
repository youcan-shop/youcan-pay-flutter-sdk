import 'package:meta/meta.dart';

@immutable
class AccountConfig {
  final bool success;
  final String message;
  final bool acceptsCreditCards;
  final bool acceptsCashPlus;
  final bool cashPlusTransactionEnabled;
  final bool acceptsYouCanPayWallet;
  final bool walletTransactionEnabled;
  final bool helpCenterEnabled;
  final bool paymentsActive;

  /// Creates a new [AccountConfig] object.
  const AccountConfig({
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

  /// Creates a new [AccountConfig] object from a [Map].
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

  /// Creates a new [AccountConfig] object from a [String].
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
    return 'AccountConfig(success: $success, message: $message, acceptsCreditCards: $acceptsCreditCards, acceptsCashPlus: $acceptsCashPlus, cashPlusTransactionEnabled: $cashPlusTransactionEnabled, acceptsYouCanPayWallet: $acceptsYouCanPayWallet, walletTransactionEnabled: $walletTransactionEnabled, helpCenterEnabled: $helpCenterEnabled, paymentsActive: $paymentsActive)';
  }

  /// Copy the current [AccountConfig] object with the given fields replaced with the new values.
  AccountConfig copyWith({
    bool? success,
    String? message,
    bool? acceptsCreditCards,
    bool? acceptsCashPlus,
    bool? cashPlusTransactionEnabled,
    bool? acceptsYouCanPayWallet,
    bool? walletTransactionEnabled,
    bool? helpCenterEnabled,
    bool? paymentsActive,
  }) {
    return AccountConfig(
      success: success ?? this.success,
      message: message ?? this.message,
      acceptsCreditCards: acceptsCreditCards ?? this.acceptsCreditCards,
      acceptsCashPlus: acceptsCashPlus ?? this.acceptsCashPlus,
      cashPlusTransactionEnabled:
          cashPlusTransactionEnabled ?? this.cashPlusTransactionEnabled,
      acceptsYouCanPayWallet:
          acceptsYouCanPayWallet ?? this.acceptsYouCanPayWallet,
      walletTransactionEnabled:
          walletTransactionEnabled ?? this.walletTransactionEnabled,
      helpCenterEnabled: helpCenterEnabled ?? this.helpCenterEnabled,
      paymentsActive: paymentsActive ?? this.paymentsActive,
    );
  }

  @override
  bool operator ==(covariant AccountConfig other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.message == message &&
        other.acceptsCreditCards == acceptsCreditCards &&
        other.acceptsCashPlus == acceptsCashPlus &&
        other.cashPlusTransactionEnabled == cashPlusTransactionEnabled &&
        other.acceptsYouCanPayWallet == acceptsYouCanPayWallet &&
        other.walletTransactionEnabled == walletTransactionEnabled &&
        other.helpCenterEnabled == helpCenterEnabled &&
        other.paymentsActive == paymentsActive;
  }

  @override
  int get hashCode {
    return success.hashCode ^
        message.hashCode ^
        acceptsCreditCards.hashCode ^
        acceptsCashPlus.hashCode ^
        cashPlusTransactionEnabled.hashCode ^
        acceptsYouCanPayWallet.hashCode ^
        walletTransactionEnabled.hashCode ^
        helpCenterEnabled.hashCode ^
        paymentsActive.hashCode;
  }
}
