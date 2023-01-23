import 'package:youcanpay_sdk/src/validators/extensions/card_information.dart';

import '../exceptions/invalid_card_information_exception.dart';
import '../localization/ycpay_strings.dart';
import '../models/card_information.dart';

class CardInformationValidator {
  /// Checks if the [cardInformation] is valid.
  /// Throws an [InvalidCardInformationException] if the [cardInformation] informations are not valid.
  static void isValid(CardInformation cardInformation) {
    if (cardInformation.cardHolderName.isEmpty) {
      throw InvalidCardInformationException(
        YCPayStrings.get("card_number_is_empty"),
      );
    }

    if (!cardInformation.hasCardNumberValid()) {
      throw InvalidCardInformationException(
        YCPayStrings.get("card_number_is_not_valid"),
      );
    }

    if (!cardInformation.hasCardExpiryValid()) {
      throw InvalidCardInformationException(
        YCPayStrings.get("card_expiry_date_is_not_valid"),
      );
    }

    if (!cardInformation.hasCardCvvValid()) {
      throw InvalidCardInformationException(
          YCPayStrings.get("card_cvv_is_not_valid"));
    }
  }
}

