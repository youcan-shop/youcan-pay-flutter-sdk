import '../exceptions/invalid_card_information_exception.dart';
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
      throw InvalidCardInformationException("Card number is empty");
    }

    if (!isCardNumberValid(cardInformation.cardNumber)) {
      throw InvalidCardInformationException("Card number is not valid");
    }

    if (!isCardExpiryValid(year: cardInformation.expireDateYear, month: cardInformation.expireDateMonth)) {
      throw InvalidCardInformationException("Card expiry date is not valid");
    }

    if (!isCardCvvValid(cardInformation.cvv)) {
      throw InvalidCardInformationException("Card cvv is not valid");
    }
  }
}
