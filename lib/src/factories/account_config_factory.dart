import 'package:youcanpay_sdk/src/validators/card_information_validator.dart';

import '../exceptions/invalid_decoded_json_exception.dart';
import '../exceptions/invalid_response_exception.dart';
import '../models/account_config.dart';
import '../models/http_response.dart';

/// Factory class for handling external [AccountConfig] objects from the response of the server.
class AccountConfigFactory {
  /// Decodes the response from the server and returns an [AccountConfig] object
  static AccountConfig fromResponse(HttpResponse response) {
    try {
      final Map<String, dynamic> jsonObject = response.body;

      if (jsonObject.canBeParsedToAccountConfig()) {
        return AccountConfig.fromMap(jsonObject, success: true);
      } else if (jsonObject.containsMessage()) {
        final String message = jsonObject["message"];
        return AccountConfig.fromMessage(message, success: false);
      } else {
        throw InvalidResponseException("Error occurred while decoding data");
      }
    } catch (e) {
      throw InvalidDecodedJSONException(e.toString());
    }
  }
}
