import '../validators/card_information_validator.dart';

class CardInformation {
  String cardHolderName;
  String cardNumber;
  String expireDateYear;
  String expireDateMonth;
  String cvv;

  CardInformation({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expireDateYear,
    required this.expireDateMonth,
    required this.cvv,
  }) {
    CardInformationValidator.isValid(this);
  }

  Map<String, String> toMap() {
    return {
      'card_holder_name': cardHolderName,
      'credit_card': cardNumber,
      'expire_date': formattedExpireDate,
      'cvv': cvv,
    };
  }

  /// Returns the [expireDateMonth] and [expireDateYear] in the format MM/YY.
  String get formattedExpireDate {
    final String padLeftMonth = expireDateMonth.padLeft(2, "0");
    final String padLeftYear = expireDateYear.padLeft(2, "0");
    return "$padLeftMonth/$padLeftYear";
  }
}
