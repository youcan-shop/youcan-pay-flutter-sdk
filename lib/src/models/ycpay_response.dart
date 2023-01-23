// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:meta/meta.dart';

/// This class represents the response of a http request.
@immutable
@protected
abstract class YCPayResponse {
  /// The transaction id of the payment.
  final String transactionId;

  /// Creates a new [YCPayResponse] object.
  @protected
  const YCPayResponse({
    this.transactionId = "",
  });

  @override
  String toString() {
    return 'YCPayResponse{transactionId: $transactionId}';
  }

  @override
  bool operator ==(covariant YCPayResponse other) {
    if (identical(this, other)) return true;

    return other.transactionId == transactionId;
  }

  @override
  int get hashCode => transactionId.hashCode;
}
