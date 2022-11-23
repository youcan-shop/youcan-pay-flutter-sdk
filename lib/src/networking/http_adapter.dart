import '../models/http_response.dart';

abstract class HttpAdapter {
  Future<HttpResponse> post({required String url, Map<String, String> params = const {}});

  Future<HttpResponse> get({required String url, Map<String, String> params = const {}});
}
