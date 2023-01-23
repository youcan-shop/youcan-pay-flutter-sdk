import 'package:flutter/material.dart';
import 'package:youcanpay_sdk/src/validators/card_information_validator.dart';

import '../../youcanpay_sdk.dart';
import '../configs/constants.dart';
import '../factories/card_information_factory.dart';
import '../factories/ycp_response_factory.dart';
import '../models/http_response.dart';
import '../models/ycp_response_3ds.dart';
import '../models/ycp_response_sale.dart';
import '../models/ycpay_response.dart';
import '../widgets/ycp_webview.dart';
import 'based_service.dart';

class PayWithCardService extends BasedService {
  PayWithCardService();

  /// Executes the payment with a given [CardInformation] object.
  Future<void> payWithCard({
    required String token,
    required String pubKey,
    required CardInformation cardInformation,
    required Function(String? transactionId) onSuccessfulPayment,
    required Function(String? message) onFailedPayment,
    required BuildContext context,
  }) async {
    final Map<String, String> params =
        CardInformationFactory.toMap(cardInformation)
          ..token(token)
          ..pubKey(pubKey)
          ..isMobile("1");

    try {
      HttpResponse response = await httpAdapter.post(
        url: Constants.endpoints.payWithCardUrl,
        body: params,
      );
      YCPayResponse ycPayResponse = YCPResponseFactory.fromJSON(response);

      if (ycPayResponse is YCPResponseSale) {
        if (ycPayResponse.success) {
          onSuccessfulPayment(ycPayResponse.transactionId);
        } else {
          onFailedPayment(ycPayResponse.message);
        }

        return;
      }

      if (ycPayResponse is YCPResponse3ds) {
        on3dsPayment(
          context: context,
          onFailedPayment: onFailedPayment,
          onSuccessfulPayment: onSuccessfulPayment,
          response: ycPayResponse,
        );

        return;
      }
    } catch (e) {
      onFailedPayment(e.toString());
    }
  }

  /// This method is called when the payment is 3DSecure, it shows a modal bottom sheet with the [YCPWebView] widget.
  Future on3dsPayment({
    required YCPResponse3ds response,
    required Function(String? transactionId) onSuccessfulPayment,
    required Function(String? message) onFailedPayment,
    required BuildContext context,
  }) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext builderContext) {
        return SizedBox(
          height: MediaQuery.of(builderContext).size.height * 0.9,
          child: YCPWebView(
            onFailedPayment: (String? message) {
              onFailedPayment(message);
            },
            onSuccessfulPayment: (String? transactionId) {
              onSuccessfulPayment(transactionId);
            },
            response: response,
          ),
        );
      },
    );
  }
}
