/// Exception thrown when the decoded JSON is invalid.
class InvalidDecodedJSONException implements Exception {
  final String message;

  InvalidDecodedJSONException(this.message);

  @override
  String toString() {
    return 'InvalidDecodedJSONException: $message';
  }
}
