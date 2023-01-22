import 'ycpay_response.dart';

class YCPResponseCashPlus extends YCPayResponse {
  String token;

  YCPResponseCashPlus({required super.transactionId, required this.token});


  factory YCPResponseCashPlus.fromMap(Map<String, dynamic> map) {
    return YCPResponseCashPlus(
      transactionId: map['transaction_id'] ?? "",
      token: map['token'] ?? "",
    );
  }
  @override
  String toString() {
    return 'YCPResponseCashPlus{transactionId: $transactionId, token: $token}';
  }
}
