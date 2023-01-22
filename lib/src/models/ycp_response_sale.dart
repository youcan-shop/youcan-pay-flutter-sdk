import 'ycpay_response.dart';

class YCPResponseSale extends YCPayResponse {
  bool success;
  String message;
  String code;

  YCPResponseSale({
    required super.transactionId,
    required this.success,
    required this.message,
    required this.code,
  });

factory YCPResponseSale.fromMap(Map<String, dynamic> map) {
    return YCPResponseSale(
      transactionId: map['transaction_id'] ?? "",
      success: map['success'] ?? false,
      message: map['message'] ?? "",
      code: map['code'] ?? "",
    );
  }
  @override
  String toString() {
    return 'YCPResponseSale{transactionId: $transactionId, success: $success, message: $message, code: $code}';
  }
}
