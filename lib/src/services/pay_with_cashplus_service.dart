import '../configs/constants.dart';
import '../models/ycp_response_cashplus.dart';
import '../models/ycp_response_sale.dart';
import '../models/ycpay_response.dart';
import '../services/based_service.dart';
import '../factories/ycp_response_factory.dart';
import '../models/http_response.dart';

class PayWithCashPlusService extends BasedService {
  void payWithCashPlus({
      required String token,
      required String pubKey,
      required Function(String? transactionId, String? token) onSuccessfulPayment,
      required Function(String? message) onFailedPayment
  }) async {

    Map<String, String> params = {};

    params['token_id'] = token;
    params['pub_key'] = pubKey;
    params['is_mobile'] = "1";

    try {
      HttpResponse response = await httpAdapter.post(
          url: Constants.PAY_WITH_CASHPLUS_URL, body: params);
      YCPayResponse ycPayResponse = YCPResponseFactory.fromJSON(response);

      if (ycPayResponse is YCPResponseCashPlus) {
        onSuccessfulPayment(ycPayResponse.transactionId, ycPayResponse.token);

        return;
      }

      onFailedPayment((ycPayResponse as YCPResponseSale).message);
    } catch (e) {
      onFailedPayment(e.toString());
    }
  }
}
