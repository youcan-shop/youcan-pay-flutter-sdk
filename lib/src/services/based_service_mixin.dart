import 'package:flutter/widgets.dart';

import '../networking/dio_http_adapter.dart';
import '../networking/http_adapter.dart';

/// This mixin provides the [httpAdapter] property.
/// It is used to make http requests.
@protected
@immutable
mixin BasedServiceMixin {
  /// The  [DioHttpAdapter] instance.
  HttpAdapter get httpAdapter => DioHttpAdapter();
}
