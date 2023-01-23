import 'ycpay_response.dart';
import 'package:meta/meta.dart';

/// This class represents the response of a cash plus payment.
@immutable
class YCPResponseCashPlus extends YCPayResponse {
  /// The payment token.
  final String token;

  /// Creates a new [YCPResponseCashPlus] object.
  const YCPResponseCashPlus({
    super.transactionId,
    required this.token,
  });

  ///  Creates a new [YCPResponseCashPlus] object from a [Map].
  factory YCPResponseCashPlus.fromMap(Map<String, dynamic> map) {
    return YCPResponseCashPlus(
      transactionId: map['transaction_id'] ?? "",
      token: map['token'] ?? "",
    );
  }

  @override
  String toString() => 'YCPResponseCashPlus(token: $token)';

  /// Copy this object with the given fields replaced with the new values.
  @protected
  YCPResponseCashPlus copyWith({
    String? token,
  }) {
    return YCPResponseCashPlus(
      token: token ?? this.token,
    );
  }

  @override
  bool operator ==(covariant YCPResponseCashPlus other) {
    if (identical(this, other)) return true;

    return other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
