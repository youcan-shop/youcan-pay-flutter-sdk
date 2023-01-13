class HttpResponse {
  Map<String, dynamic> body;
  int statusCode;
  String message;

  HttpResponse(
      {required this.statusCode, required this.body, this.message = ''});

  bool get isSuccess {
    return statusCode >= 200 && statusCode < 300;
  }

  @override
  String toString() {
    return 'HttpResponse{statusCode: $statusCode, success: $isSuccess, body: $body, message: $message}';
  }
}
