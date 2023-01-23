import '../models/card_information.dart';

/// Factory class for handling external [CardInformation] objects from the response of the server.
class CardInformationFactory {
  /// Takes a [CardInformation] object and returns a [Map<String, String>] object.
  static Map<String, String> toMap(CardInformation cardInformation) {
    return cardInformation.toMap();
  }
  
}
