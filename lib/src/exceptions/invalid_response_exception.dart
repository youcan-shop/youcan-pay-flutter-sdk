class InvalidResponseException implements Exception {
  final String message;

  InvalidResponseException(this.message);

  @override
  String toString() {
    return 'InvalidResponseException: $message';
  }
}
