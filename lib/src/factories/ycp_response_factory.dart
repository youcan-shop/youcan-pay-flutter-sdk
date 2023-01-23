import 'package:youcanpay_sdk/src/validators/card_information_validator.dart';
import 'package:youcanpay_sdk/src/validators/extensions/map.dart';

import '../models/ycp_response_3ds.dart';
import '../models/ycp_response_sale.dart';
import '../exceptions/invalid_decoded_json_exception.dart';
import '../exceptions/invalid_response_exception.dart';
import '../models/http_response.dart';
import '../models/ycp_response_cashplus.dart';
import '../models/ycpay_response.dart';

/// Factory class for creating [YCPayResponse] object.
class YCPResponseFactory {
  /// Creates a [YCPayResponse] object from a [HttpResponse] object.
  static YCPayResponse fromResponse(HttpResponse response) {
    // ! response.statusCode == -1 ??
    if (response.statusCode == -1) {
      return YCPResponseSale.failure(response.message);
    }

    final Map<String, dynamic> body = response.body;

    // ! response.statusCode == 200 ??
    if (body.containsKey("success")) {
      return YCPResponseSale.fromMap(body);
    } else if (body.requires3dAuthentication()) {
      return YCPResponse3ds.fromMap(body);
    } else if (body.tokenized()) {
      return YCPResponseCashPlus.fromMap(body);
    } else {
      throw InvalidResponseException("Error occurred while decoding data");
    }
  }
}
