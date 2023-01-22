import 'package:flutter/cupertino.dart';

@immutable
abstract class YCPayResponse {
  final String transactionId;

  /// Creates a new [YCPayResponse] object.
  const YCPayResponse({
    this.transactionId = "",
  });

  @override
  String toString() {
    return 'YCPayResponse{transactionId: $transactionId}';
  }
}
