import '../exceptions/invalid_card_information_exception.dart';
import '../localization/ycpay_strings.dart';
import '../models/card_information.dart';

class CardInformationValidator {
  static const String _cardNumberRegex = r'^[0-9]{16}$';
  static const String _cardExpiryRegex = r'^[0-9]{2}$';
  static const String _cardCvvRegex = r'^[0-9]{3}$';

  static bool isCardNumberValid(String cardNumber) {
    return RegExp(_cardNumberRegex).hasMatch(cardNumber);
  }

  static bool isCardCvvValid(String cardCvv) {
    return RegExp(_cardCvvRegex).hasMatch(cardCvv);
  }

  static bool isCardExpiryValid({required String year, required String month}) {
    DateTime now = DateTime.now();

    int currentYear = now.year;
    int currentMonth = now.month;

    if (RegExp(_cardExpiryRegex).hasMatch(year) && RegExp(_cardExpiryRegex).hasMatch(month)) {
      DateTime expiryDate = DateTime.parse("20$year-$month-01");

      int expiryYear = expiryDate.year;
      int expiryMonth = expiryDate.year;

      if (expiryYear > currentYear) {
        return true;
      } else if (expiryYear == currentYear) {
        if (expiryMonth >= currentMonth) {
          return true;
        }
      }
    }

    return false;
  }

  static void isValid(CardInformation cardInformation) {
    if (cardInformation.cardHolderName.isEmpty) {
      throw InvalidCardInformationException(YCPayStrings.get("card_number_is_empty"));
    }

    if (!isCardNumberValid(cardInformation.cardNumber)) {
      throw InvalidCardInformationException(YCPayStrings.get("card_number_is_not_valid"));
    }

    if (!isCardExpiryValid(year: cardInformation.expireDateYear, month: cardInformation.expireDateMonth)) {
      throw InvalidCardInformationException(YCPayStrings.get("card_expiry_date_is_not_valid"));
    }

    if (!isCardCvvValid(cardInformation.cvv)) {
      throw InvalidCardInformationException(YCPayStrings.get("card_cvv_is_not_valid"));
    }
  }
}
