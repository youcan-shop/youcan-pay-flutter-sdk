import '../networking/dio_http_adapter.dart';
import '../networking/http_adapter.dart';

abstract class BasedService {
  /// The  [DioHttpAdapter] instance.
  HttpAdapter get httpAdapter => DioHttpAdapter();
}
