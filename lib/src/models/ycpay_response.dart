class YCPayResponse {
  String transactionId = "";

  YCPayResponse({required this.transactionId});

  @override
  String toString() {
    return 'YCPayResponse{transactionId: $transactionId}';
  }
}
