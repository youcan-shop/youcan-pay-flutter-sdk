import '../models/card_information.dart';

class CardInformationFactory {
  static Map<String, String> toMap(CardInformation cardInformation) {
    return {
      'card_holder_name': cardInformation.cardHolderName,
      'credit_card': cardInformation.cardNumber,
      'expire_date': "${cardInformation.expireDateMonth}/${cardInformation.expireDateYear}",
      'cvv': cardInformation.cvv,
    };
  }
}
