import 'package:youcanpay_sdk/src/configs/enpoints.dart';
import 'package:youcanpay_sdk/src/configs/headers.dart';
import 'package:meta/meta.dart';

/// The constants for the SDK.
@immutable
class Constants {
  /// The base YouCan pay API endpoints.
  static YouCanPayAPIEndpoints get endpoints => const YouCanPayAPIEndpoints();

  ///  The headers for the API.
  static YouCanPayAPIHeaders get headers => const YouCanPayAPIHeaders();
}
