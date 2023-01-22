import 'package:meta/meta.dart';

@immutable
class HttpResponse {
  final Map<String, dynamic> body;
  final int statusCode;
  final String message;

  const HttpResponse({
    required this.statusCode,
    required this.body,
    this.message = '',
  });

  /// defines if the response is a success.
  bool get isSuccess {
    return statusCode >= 200 && statusCode < 300;
  }

  @override
  String toString() {
    return 'HttpResponse{statusCode: $statusCode, success: $isSuccess, body: $body, message: $message}';
  }
}
