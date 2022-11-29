import 'package:flutter/material.dart';
import 'package:youcanpay_sdk/src/configs/constants.dart';
import 'package:youcanpay_sdk/src/models/card_information.dart';
import 'package:youcanpay_sdk/src/models/ycp_response_sale.dart';
import 'package:youcanpay_sdk/src/models/ycpay_response.dart';
import 'package:youcanpay_sdk/src/services/based_service.dart';

import '../factories/card_information_factory.dart';
import '../factories/ycp_response_factory.dart';
import '../models/http_response.dart';
import '../models/ycp_response_3ds.dart';
import '../widgets/ycp_webview.dart';

class PayWithCardService extends BasedService {
  BuildContext context;
  PayWithCardService({required this.context});

  void payWithCard({
    required String token,
    required String pubKey,
    required CardInformation cardInformation,
    required Function(String? transactionId) onSuccessfulPayment,
    required Function(String? message) onFailedPayment
  }) async {
    Map<String, String> params = CardInformationFactory.toMap(cardInformation);
    params['token_id'] = token;
    params['pub_key'] = pubKey;
    params['is_mobile'] = "1";

    try{
      HttpResponse response = await httpAdapter.post(url: Constants.PAY_WITH_CARD_URL, body: params);
      YCPayResponse ycPayResponse = YCPResponseFactory.fromJSON(response);

      if (ycPayResponse is YCPResponseSale) {
        if (ycPayResponse.success) {
          onSuccessfulPayment(ycPayResponse.transactionId);

          return;
        }
        onFailedPayment(ycPayResponse.message);

        return;
      }

      if (ycPayResponse is YCPResponse3ds) {
        on3dsPayment(onFailedPayment: onFailedPayment, onSuccessfulPayment: onSuccessfulPayment, response: ycPayResponse);

        return;
      }
    } catch (e) {
      onFailedPayment(e.toString());
    }
  }

  void on3dsPayment({
    required YCPResponse3ds response,
    required Function(String? transactionId) onSuccessfulPayment,
    required Function(String? message) onFailedPayment
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: YCPWebView(
              onFailedPayment: (message) {
                onFailedPayment(message);
              },
              onSuccessfulPayment:(transactionId) {
                onSuccessfulPayment(transactionId);
              },
              response: response,
            ));
      },
    );
  }
}
