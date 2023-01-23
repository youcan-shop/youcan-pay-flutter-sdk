// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../validators/card_information_validator.dart';
import 'package:meta/meta.dart';

@immutable
class CardInformation {
  final String cardHolderName;
  final String cardNumber;
  final String expireDateYear;
  final String expireDateMonth;
  final String cvv;

  /// Creates a new [CardInformation] object.
  CardInformation({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expireDateYear,
    required this.expireDateMonth,
    required this.cvv,
  }) {
    CardInformationValidator.isValid(this);
  }

  /// Creates a new [CardInformation] object from a [Map].
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

  @override
  String toString() {
    return 'CardInformation(cardHolderName: $cardHolderName, cardNumber: $cardNumber, expireDateYear: $expireDateYear, expireDateMonth: $expireDateMonth, cvv: $cvv)';
  }

  /// Copy the current [CardInformation] object with the given parameters.
  CardInformation copyWith({
    String? cardHolderName,
    String? cardNumber,
    String? expireDateYear,
    String? expireDateMonth,
    String? cvv,
  }) {
    return CardInformation(
      cardHolderName: cardHolderName ?? this.cardHolderName,
      cardNumber: cardNumber ?? this.cardNumber,
      expireDateYear: expireDateYear ?? this.expireDateYear,
      expireDateMonth: expireDateMonth ?? this.expireDateMonth,
      cvv: cvv ?? this.cvv,
    );
  }


  @override
  bool operator ==(covariant CardInformation other) {
    if (identical(this, other)) return true;

    return other.cardHolderName == cardHolderName &&
        other.cardNumber == cardNumber &&
        other.expireDateYear == expireDateYear &&
        other.expireDateMonth == expireDateMonth &&
        other.cvv == cvv;
  }

  @override
  int get hashCode {
    return cardHolderName.hashCode ^
        cardNumber.hashCode ^
        expireDateYear.hashCode ^
        expireDateMonth.hashCode ^
        cvv.hashCode;
  }

  factory CardInformation.testCard(Map<String, dynamic> json) {
    return CardInformation(
      cardHolderName: json['cardHolderName'] as String,
      cardNumber: json['cardNumber'] as String,
      expireDateYear: json['expireDateYear'] as String,
      expireDateMonth: json['expireDateMonth'] as String,
      cvv: json['cvv'] as String,
    );
  }
}

