import 'package:youcanpay_sdk/src/configs/constants.dart';
import 'package:youcanpay_sdk/src/models/card_information.dart';
import 'package:youcanpay_sdk/src/models/ycp_response_sale.dart';
import 'package:youcanpay_sdk/src/models/ycpay_response.dart';
import 'package:youcanpay_sdk/src/services/based_service.dart';

import '../factories/card_information_factory.dart';
import '../factories/ycp_response_factory.dart';
import '../models/http_response.dart';

class PayWithCardService extends BasedService {
  Future<YCPayResponse> payWithCard({
    required String token,
    required String pubKey,
    required CardInformation cardInformation,
  }) async {
    Map<String, String> params = CardInformationFactory.toMap(cardInformation);
    params['token_id'] = token;
    params['pub_key'] = pubKey;
    params['is_mobile'] = "1";

    HttpResponse response = await httpAdapter.post(url: Constants.PAY_WITH_CARD_URL, body: params);
    YCPayResponse ycPayResponse = YCPResponseFactory.fromJSON(response);

    return ycPayResponse;
  }
}
