import '../models/http_response.dart';
import 'package:meta/meta.dart';

@immutable
@protected
abstract class HttpAdapter {
  /// Sends a POST request to the given [url] with the given [body].
  Future<HttpResponse> post({
    required String url,
    Map<String, String> body = const {},
  });

  /// Sends a GET request to the given [url] with the given [params].
  Future<HttpResponse> get({
    required String url,
    Map<String, String> params = const {},
  });
}
