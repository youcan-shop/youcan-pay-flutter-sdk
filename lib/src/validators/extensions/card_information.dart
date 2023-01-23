import '../../../youcanpay_sdk.dart';

extension CardExtension on CardInformation {
  static const String _cardNumberRegex = r'^[0-9]{16}$';
  static const String _cardCvvRegex = r'^[0-9]{3}$';

  /// returns true if the [cardNumber] is valid.
  bool hasCardNumberValid() {
    return RegExp(_cardNumberRegex).hasMatch(cardNumber);
  }

  /// returns true if the [cardCvv] is valid.
  bool hasCardCvvValid() {
    return RegExp(_cardCvvRegex).hasMatch(cvv);
  }

  /// returns true if the [year] and [month] are valid and not expired.
  bool hasCardExpiryValid() {
    final int? yearInt = int.tryParse(expireDateYear);
    final int? monthInt = int.tryParse(expireDateMonth);

    assert(
      yearInt != null && monthInt != null,
      "year and month must be able to be parsed to int,",
    );

    DateTime expiresDate = DateTime(2000 + yearInt!, monthInt!);
    DateTime now = DateTime.now();

    return expiresDate.isAfter(now);
  }
}
