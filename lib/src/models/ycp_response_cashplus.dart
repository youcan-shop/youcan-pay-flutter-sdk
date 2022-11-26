import 'package:youcanpay_sdk/src/models/ycpay_response.dart';

class YCPResponseCashPlus extends YCPayResponse {
  String token;

  YCPResponseCashPlus({required super.transactionId, required this.token});

  // to string
  @override
  String toString() {
    return 'YCPResponseCashPlus{transactionId: $transactionId, token: $token}';
  }
}
