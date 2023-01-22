import 'package:meta/meta.dart';
import 'ycpay_response.dart';

@immutable
class YCPResponseSale extends YCPayResponse {
  final bool success;
  final String message;
  final String code;

  /// Creates a new [YCPResponseSale] object.
  const YCPResponseSale({
    required super.transactionId,
    required this.success,
    required this.message,
    required this.code,
  });

  /// Creates a new [YCPResponseSale] object from a [Map].
  factory YCPResponseSale.fromMap(Map<String, dynamic> map) {
    return YCPResponseSale(
      transactionId: map['transaction_id'] ?? "",
      success: map['success'] ?? false,
      message: map['message'] ?? "",
      code: map['code'] ?? "",
    );
  }
  @override
  String toString() =>
      'YCPResponseSale(success: $success, message: $message, code: $code)';

  /// Copy this object with the given fields replaced with the new values.
  YCPResponseSale copyWith({
    bool? success,
    String? message,
    String? code,
  }) {
    return YCPResponseSale(
      transactionId: transactionId,
      success: success ?? this.success,
      message: message ?? this.message,
      code: code ?? this.code,
    );
  }

  @override
  bool operator ==(covariant YCPResponseSale other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.message == message &&
        other.code == code;
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ code.hashCode;
}
