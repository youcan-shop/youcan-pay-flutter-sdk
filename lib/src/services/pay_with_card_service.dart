import 'package:flutter/material.dart';
import 'package:youcanpay_sdk/src/validators/card_information_validator.dart';
import 'package:youcanpay_sdk/src/validators/extensions/map.dart';

import '../../youcanpay_sdk.dart';
import '../configs/constants.dart';
import '../factories/card_information_factory.dart';
import '../factories/ycp_response_factory.dart';
import '../models/http_response.dart';
import '../models/ycp_response_3ds.dart';
import '../models/ycp_response_sale.dart';
import '../models/ycpay_response.dart';
import '../widgets/ycp_webview.dart';
import 'based_service_mixin.dart';

/// The service for the payment with a card.
/// It is used to handle the payment with a card.
@immutable
@protected
class PayWithCardService with BasedServiceMixin {
  /// The constructor of the [PayWithCardService] class.
  /// It is used to initialize the an instance of the class.
  PayWithCardService();

  /// Executes the payment with a given [CardInformation] object.
  Future<void> payWithCard({
    required String token,
    required String pubKey,
    required CardInformation cardInformation,
    required BuildContext context,
    required void Function(String? transactionId) onSuccessfulPayment,
    required void Function(String? message) onFailedPayment,
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
      YCPayResponse ycPayResponse = YCPResponseFactory.fromResponse(response);

      if (ycPayResponse is YCPResponseSale) {
        _handleYCPayResponse(
          ycPayResponse,
          onFail: onFailedPayment,
          onSuccess: onSuccessfulPayment,
        );
      } else if (ycPayResponse is YCPResponse3ds) {
        _handle3dsPayment(
          context: context,
          onFailedPayment: onFailedPayment,
          onSuccessfulPayment: onSuccessfulPayment,
          response: ycPayResponse,
        );
      }
    } catch (e) {
      onFailedPayment(e.toString());
    }
  }

  /// This method handles a [YCPResponse3ds] , it shows a modal bottom sheet with a [YCPWebView] widget.
  Future<T?> _handle3dsPayment<T>({
    required YCPResponse3ds response,
    required BuildContext context,
    required void Function(String? transactionId) onSuccessfulPayment,
    required void Function(String? message) onFailedPayment,
  }) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      builder: (_) {
        return YCPWebView(
          onFailedPayment: onFailedPayment,
          onSuccessfulPayment: onSuccessfulPayment,
          response: response,
        );
      },
    );
  }
}

/// This method handles the [YCPayResponse] object.
/// It checks if the payment is successful or not.
/// If it is successful, it calls the [onSuccess] callback.
/// If it is not successful, it calls the [onFail] callback.
void _handleYCPayResponse(
  YCPResponseSale response, {
  required void Function(String? transactionId) onSuccess,
  required void Function(String? message) onFail,
}) {
  if (response.success) {
    onSuccess(response.transactionId);
  } else {
    onFail(response.message);
  }
}
