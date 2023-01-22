class InvalidLocaleException implements Exception {
  final String message;

  InvalidLocaleException(this.message);

  @override
  String toString() => message;
}
