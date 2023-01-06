import 'package:flutter/material.dart';
import 'package:youcanpay_sdk/src/configs/constants.dart';
import 'package:youcanpay_sdk/src/models/ycp_response_cashplus.dart';
import 'package:youcanpay_sdk/src/models/ycp_response_sale.dart';
import 'package:youcanpay_sdk/src/models/ycpay_response.dart';
import 'package:youcanpay_sdk/src/services/based_service.dart';

import '../factories/ycp_response_factory.dart';
import '../models/http_response.dart';

class PayWithCashPlusService extends BasedService {
  BuildContext context;
  PayWithCashPlusService({required this.context});

  void payWithCashPlus({
    required String token,
    required String pubKey,
    required Function(String? transactionId,String? token) onSuccessfulPayment,
    required Function(String? message) onFailedPayment
  }) async {
    Map<String, String> params = {};

    params['token_id'] = token;
    params['pub_key'] = pubKey;
    params['is_mobile'] = "1";

    try{
      HttpResponse response = await httpAdapter.post(url: Constants.PAY_WITH_CASHPLUS_URL, body: params);
      YCPayResponse ycPayResponse = YCPResponseFactory.fromJSON(response);

      if(ycPayResponse is YCPResponseSale){
        onFailedPayment(ycPayResponse.message);

        return;
      }

      onSuccessfulPayment((ycPayResponse as YCPResponseCashPlus).transactionId,ycPayResponse.token);
    } catch (e) {
      onFailedPayment(e.toString());
    }
  }
}
