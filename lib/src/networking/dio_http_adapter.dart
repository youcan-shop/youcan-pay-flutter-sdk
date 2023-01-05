import 'package:youcanpay_sdk/src/localization/ycpay_locale.dart';
import 'package:youcanpay_sdk/src/models/http_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

import '../configs/constants.dart';
import 'http_adapter.dart';

class DioHttpAdapter extends HttpAdapter {
  late Dio _dio;
  final Map<String, dynamic> _header = {"Content-Type": "application/json", "Accept": "application/json", "X-Preferred-Locale": YCPayLocale.locale};

  DioHttpAdapter() {
    _dio = Dio(BaseOptions(baseUrl: Constants.BASE_URL, headers: _header));
    _dio.interceptors.add(PrettyDioLogger(requestBody: true,requestHeader: true));
  }

  @override
  Future<HttpResponse> get({required String url, Map<String, String> params = const {}}) async {
    Response response;
    HttpResponse httpResponse;

    try {
      response = await _dio.get(url, queryParameters: params);
      httpResponse = HttpResponse(body: response.data, statusCode: response.statusCode!);
    } on DioError catch (e) {
      httpResponse = HttpResponse(body: e.response?.data ?? {}, statusCode: e.response?.statusCode ?? -1, message: e.message);
    }

    return httpResponse;
  }

  @override
  Future<HttpResponse> post({required String url, Map<String, String> body = const {}}) async {
    Response response;
    HttpResponse httpResponse;

    try {
      response = await _dio.post(url, data: body);
      httpResponse = HttpResponse(body: response.data, statusCode: response.statusCode!);
    } on DioError catch (e) {
      httpResponse = HttpResponse(body: e.response?.data ?? {}, statusCode: e.response?.statusCode ?? -1, message: e.message);
    }

    return httpResponse;
  }
}
