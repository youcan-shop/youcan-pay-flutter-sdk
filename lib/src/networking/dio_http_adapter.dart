import '../localization/ycpay_locale.dart';
import '../models/http_response.dart';
import 'package:dio/dio.dart';
import '../configs/constants.dart';
import '../controllers/sandbox_controller.dart';
import 'http_adapter.dart';

class DioHttpAdapter extends HttpAdapter {
  /// The [Dio] instance.
  late Dio _dio;

  final Map<String, dynamic> _header = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "X-Preferred-Locale": YCPayLocaleHandler.locale.abbreviationName
  };

  // This is a private constructor, so it can only be called from within the class.
  DioHttpAdapter._() {
    String basedUrl = SandboxController.isSandbox
        ? Constants.sandboxBasedUrl
        : Constants.baseUrl;
    _dio = Dio(BaseOptions(baseUrl: basedUrl, headers: _header));
  }

  /// This is the factory constructor, it returns a singleton instance of [DioHttpAdapter] every time it is called.
  factory DioHttpAdapter() {
    return DioHttpAdapter._();
  }
  @override
  Future<HttpResponse> get(
      {required String url, Map<String, String> params = const {}}) async {
    Response response;
    HttpResponse httpResponse;

    try {
      response = await _dio.get(url, queryParameters: params);
      httpResponse =
          HttpResponse(body: response.data, statusCode: response.statusCode!);
    } on DioError catch (e) {
      httpResponse = HttpResponse(
          body: e.response?.data ?? {},
          statusCode: e.response?.statusCode ?? -1,
          message: e.message);
    }

    return httpResponse;
  }

  @override
  Future<HttpResponse> post(
      {required String url, Map<String, String> body = const {}}) async {
    Response response;
    HttpResponse httpResponse;

    try {
      response = await _dio.post(url, data: body);
      httpResponse =
          HttpResponse(body: response.data, statusCode: response.statusCode!);
    } on DioError catch (e) {
      httpResponse = HttpResponse(
          body: e.response?.data ?? {},
          statusCode: e.response?.statusCode ?? -1,
          message: e.message);
    }

    return httpResponse;
  }
}
