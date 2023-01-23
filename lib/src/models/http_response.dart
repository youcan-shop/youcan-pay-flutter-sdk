import 'package:meta/meta.dart';

/// This class represents the response of a http request.
@immutable
@protected
class HttpResponse {
  /// The response body.
  final Map<String, dynamic> body;

  /// The response status code.
  final int statusCode;

  /// The response message.
  final String message;

  /// Creates a new [HttpResponse] object.
  const HttpResponse({
    required this.statusCode,
    required this.body,
    this.message = '',
  });

  /// Defines if the response is a success.
  bool get isSuccess {
    return statusCode >= 200 && statusCode < 300;
  }

  @override
  String toString() {
    return 'HttpResponse{statusCode: $statusCode, success: $isSuccess, body: $body, message: $message}';
  }
}
