import 'package:youcanpay_sdk/src/networking/dio_http_adapter.dart';
import 'package:youcanpay_sdk/src/networking/http_adapter.dart';

class BasedService{
  HttpAdapter httpAdapter = DioHttpAdapter();
}
