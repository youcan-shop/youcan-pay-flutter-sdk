/// Exception thrown when a locale is invalid.
class InvalidLocaleException implements Exception {
  final String message;

  InvalidLocaleException(this.message);

  @override
  String toString() => message;
}
