/// This exception is thrown when the card information is invalid.
class InvalidCardInformationException implements Exception {
  final String message;

  InvalidCardInformationException(this.message);

  @override
  String toString() {
    return 'InvalidCardInformationException: $message';
  }
}
