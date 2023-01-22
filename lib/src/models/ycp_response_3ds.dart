import 'ycpay_response.dart';

class YCPResponse3ds extends YCPayResponse {
  String redirectUrl;
  String returnUrl;

  /// Creates a new [YCPResponse3ds] object.
  YCPResponse3ds({
    required this.redirectUrl,
    required this.returnUrl,
  });

  /// Creates a new [YCPResponse3ds] object from a [Map].
  factory YCPResponse3ds.fromMap(Map<String, dynamic> map) {
    return YCPResponse3ds(
      redirectUrl: map['redirect_url'] ?? "",
      returnUrl: map['return_url'] ?? "",
    );
  }
  @override
  String toString() =>
      'YCPResponse3ds(redirectUrl: $redirectUrl, returnUrl: $returnUrl)';

  /// Creates a new [YCPResponse3ds] object with the same properties as this instance,
  YCPResponse3ds copyWith({
    String? redirectUrl,
    String? returnUrl,
  }) {
    return YCPResponse3ds(
      redirectUrl: redirectUrl ?? this.redirectUrl,
      returnUrl: returnUrl ?? this.returnUrl,
    );
  }

  @override
  bool operator ==(covariant YCPResponse3ds other) {
    if (identical(this, other)) return true;

    return other.redirectUrl == redirectUrl && other.returnUrl == returnUrl;
  }

  @override
  int get hashCode => redirectUrl.hashCode ^ returnUrl.hashCode;
}
