import '../exceptions/invalid_card_information_exception.dart';
import '../localization/ycpay_strings.dart';
import '../models/card_information.dart';

class CardInformationValidator {
  static const String _cardNumberRegex = r'^[0-9]{16}$';
  static const String _cardCvvRegex = r'^[0-9]{3}$';

  /// returns true if the [cardNumber] is valid.
  static bool isCardNumberValid(String cardNumber) {
    return RegExp(_cardNumberRegex).hasMatch(cardNumber);
  }

  /// returns true if the [cardCvv] is valid.
  static bool isCardCvvValid(String cardCvv) {
    return RegExp(_cardCvvRegex).hasMatch(cardCvv);
  }

  /// returns true if the [year] and [month] is valid.
  static bool isCardExpiryValid({required String year, required String month}) {
    final int? yearInt = int.tryParse(year), monthInt = int.tryParse(month);
    assert(
      yearInt != null && monthInt != null,
      "year and month must be able to be parsed to int,",
    );

    DateTime expiresDate = DateTime(2000 + yearInt!, monthInt!);
    DateTime now = DateTime.now();

    return expiresDate.isAfter(now);
  }

  /// Checks if the [cardInformation] is valid.
  static void isValid(CardInformation cardInformation) {
    if (cardInformation.cardHolderName.isEmpty) {
      throw InvalidCardInformationException(
        YCPayStrings.get("card_number_is_empty"),
      );
    }

    if (!isCardNumberValid(cardInformation.cardNumber)) {
      throw InvalidCardInformationException(
        YCPayStrings.get("card_number_is_not_valid"),
      );
    }

    if (!isCardExpiryValid(
        year: cardInformation.expireDateYear,
        month: cardInformation.expireDateMonth)) {
      throw InvalidCardInformationException(
        YCPayStrings.get("card_expiry_date_is_not_valid"),
      );
    }

    if (!isCardCvvValid(cardInformation.cvv)) {
      throw InvalidCardInformationException(
          YCPayStrings.get("card_cvv_is_not_valid"));
    }
  }
}

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
