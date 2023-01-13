import 'ycpay_response.dart';

class YCPResponseSale extends YCPayResponse {
  bool success;
  String message;
  String code;

  YCPResponseSale({required super.transactionId, required this.success, required this.message, required this.code});

  @override
  String toString() {
    return 'YCPResponseSale{transactionId: $transactionId, success: $success, message: $message, code: $code}';
  }
}
