import 'ycpay_response.dart';

class YCPResponse3ds extends YCPayResponse {
  String redirectUrl;
  String returnUrl;

  YCPResponse3ds({required this.redirectUrl, required this.returnUrl});

  @override
  String toString() {
    return 'YCPResponse3ds{redirectUrl: $redirectUrl, returnUrl: $returnUrl}';
  }
}
