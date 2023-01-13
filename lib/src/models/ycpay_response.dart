class YCPayResponse {
  String transactionId = "";

  YCPayResponse({this.transactionId = ""});

  @override
  String toString() {
    return 'YCPayResponse{transactionId: $transactionId}';
  }
}
