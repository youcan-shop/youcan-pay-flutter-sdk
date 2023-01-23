/// Exception thrown when the response from the server is invalid.
class InvalidResponseException implements Exception {
  final String message;

  InvalidResponseException(this.message);

  @override
  String toString() {
    return 'InvalidResponseException: $message';
  }
}
