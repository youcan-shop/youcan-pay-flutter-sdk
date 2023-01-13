import '../networking/dio_http_adapter.dart';
import '../networking/http_adapter.dart';

class BasedService {
  HttpAdapter httpAdapter = DioHttpAdapter();
}
