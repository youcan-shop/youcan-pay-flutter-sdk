import 'package:youcanpay_sdk/src/models/ycpay_response.dart';

class YCPResponse3ds extends YCPayResponse {
  String redirectUrl;
  String returnUrl;

  YCPResponse3ds({required super.transactionId, required this.redirectUrl, required this.returnUrl});

  @override
  String toString() {
    return 'YCPResponse3ds{transactionId: $transactionId, redirectUrl: $redirectUrl, returnUrl: $returnUrl}';
  }
}
