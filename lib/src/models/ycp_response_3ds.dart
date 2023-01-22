import 'ycpay_response.dart';

class YCPResponse3ds extends YCPayResponse {
  String redirectUrl;
  String returnUrl;

  YCPResponse3ds({
    required this.redirectUrl,
    required this.returnUrl,
  });

  factory YCPResponse3ds.fromMap(Map<String, dynamic> map) {
    return YCPResponse3ds(
      redirectUrl: map['redirect_url'] ?? "",
      returnUrl: map['return_url'] ?? "",
    );
  }
  @override
  String toString() {
    return 'YCPResponse3ds{redirectUrl: $redirectUrl, returnUrl: $returnUrl}';
  }
}
