import 'package:meta/meta.dart';
import 'ycpay_response.dart';

/// This class represents the response of a 3ds payment.
@immutable
class YCPResponse3ds extends YCPayResponse {
  /// The redirect url.
  final String redirectUrl;

  /// The return url.
  final String returnUrl;

  /// Creates a new [YCPResponse3ds] object.
  const YCPResponse3ds({
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
  @protected
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
