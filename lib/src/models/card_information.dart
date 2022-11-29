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
}
