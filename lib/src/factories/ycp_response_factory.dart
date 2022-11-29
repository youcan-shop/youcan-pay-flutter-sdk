import 'package:youcanpay_sdk/src/models/ycp_response_3ds.dart';
import 'package:youcanpay_sdk/src/models/ycp_response_sale.dart';

import '../exceptions/invalid_decoded_json_exception.dart';
import '../exceptions/invalid_response_exception.dart';
import '../models/http_response.dart';
import '../models/ycp_response_cashplus.dart';
import '../models/ycpay_response.dart';

class YCPResponseFactory {
  static YCPayResponse fromJSON(HttpResponse response) {
    late YCPayResponse ycPayResponse;
    if(response.statusCode == -1){
      ycPayResponse = YCPResponseSale(
        transactionId:  "",
        success: false,
        code: "-1",
        message: response.message // "Network Error"
      );

      return ycPayResponse;
    }

    try {
      Map<String, dynamic> jsonObject = response.body;

      if (jsonObject.containsKey("success")) {
        ycPayResponse = YCPResponseSale(
          transactionId: jsonObject["transaction_id"] ?? "",
          success: jsonObject["success"] ?? false,
          code: jsonObject["code"] ?? "",
          message: jsonObject["message"] ?? "",
        );

        return ycPayResponse;
      }

      if (jsonObject.containsKey("redirect_url") && jsonObject.containsKey("return_url")) {
        ycPayResponse = YCPResponse3ds(
          returnUrl: jsonObject["return_url"] ?? "",
          redirectUrl: jsonObject["redirect_url"] ?? "",
        );

        return ycPayResponse;
      }

      if (jsonObject.containsKey("token")) {
        ycPayResponse = YCPResponseCashPlus(
          transactionId: jsonObject["transaction_id"] ?? "",
          token: jsonObject["token"] ?? "",
        );

        return ycPayResponse;
      }
    } catch (exception) {
      throw InvalidDecodedJSONException(exception.toString());
    }

    throw InvalidResponseException("Error occurred while decoding data");
  }
}
