import '../exceptions/invalid_decoded_json_exception.dart';
import '../exceptions/invalid_response_exception.dart';
import '../models/account_config.dart';
import '../models/http_response.dart';

class AccountConfigFactory {
  static fromJSON(HttpResponse response) {
    late AccountConfig accountConfig;

    try {
      Map<String, dynamic> jsonObject = response.body;

      if (jsonObject.containsKey("acceptsCreditCards") && jsonObject.containsKey("acceptsCashPlus") && jsonObject.containsKey("cashPlusTransactionEnabled") && jsonObject.containsKey("account")) {
        accountConfig = AccountConfig(
          success: true,
          acceptsCreditCards: jsonObject["acceptsCreditCards"],
          acceptsCashPlus: jsonObject["acceptsCashPlus"],
          cashPlusTransactionEnabled: jsonObject["cashPlusTransactionEnabled"],
          acceptsYouCanPayWallet: jsonObject["acceptsYouCanPayWallet"] ?? false,
          walletTransactionEnabled: jsonObject["walletTransactionEnabled"] ?? false,
          helpCenterEnabled: jsonObject["helpCenterEnabled"] ?? false,
          paymentsActive: (jsonObject["account"] as Map)["payments_active"],
        );

        return accountConfig;
      }

      if (jsonObject.containsKey("message")) {
        accountConfig = AccountConfig(
          success: false,
          message: jsonObject["message"],
        );

        return accountConfig;
      }
    } catch (e) {
      throw InvalidDecodedJSONException(e.toString());
    }

    throw InvalidResponseException("Error occurred while decoding data");
  }
}
