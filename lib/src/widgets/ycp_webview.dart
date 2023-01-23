import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youcanpay_sdk/src/widgets/sub_widgets/cancelation_options.dart';
import '../exceptions/invalid_response_exception.dart';
import '../localization/ycpay_strings.dart';
import '../models/ycp_response_3ds.dart';

class YCPWebView extends StatefulWidget {
  final void Function(String?) onSuccessfulPayment;
  final void Function(String?) onFailedPayment;
  final YCPResponse3ds response;

  const YCPWebView({
    super.key,
    required this.response,
    required this.onSuccessfulPayment,
    required this.onFailedPayment,
  });

  @override
  State<YCPWebView> createState() => _YCPWebViewState();
}

class _YCPWebViewState extends State<YCPWebView> {
  void Function(String?) get onSuccessfulPayment => widget.onSuccessfulPayment;

  void Function(String?) get onFailedPayment => widget.onFailedPayment;

  YCPResponse3ds get response => widget.response;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: <Widget>[
          CancellationIconButton(
            onCloseIconPressed: () {
              onFailedPayment(YCPayStrings.get("payment_canceled"));
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: WebView(
              initialUrl: response.redirectUrl,
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
              onPageStarted: urlListener,
            ),
          ),
        ],
      ),
    );
  }

  void urlListener(String url) {
    try {
      if (url.contains(response.returnUrl) && url.contains("success=0")) {
        Map<String, String> urlData = getListenUrlResult(url);

        onFailedPayment(urlData["message"]);
        Navigator.pop(context);

        return;
      }

      if (url.contains(response.returnUrl) && url.contains("success=1")) {
        Map<String, String> urlData = getListenUrlResult(url);

        onSuccessfulPayment(urlData["transaction_id"]);
        Navigator.pop(context);
      }
    } catch (exception) {
      onFailedPayment(YCPayStrings.get("payment_failed"));
      Navigator.pop(context);
    }
  }

  Map<String, String> getListenUrlResult(String url) {
    List<String> urlSplit = url.split("?");

    if (urlSplit.length == 1) {
      throw InvalidResponseException(YCPayStrings.get("payment_failed"));
    }

    List<String> data = urlSplit[1].split("&");
    Map<String, String> hash = {};

    for (String item in data) {
      if (item.split("=").length > 1) {
        hash[item.split("=")[0]] = item.split("=")[1].replaceAll("+", " ");
      }

      if (item.split("=").length == 1) {
        hash[item.split("=")[0]] = "";
      }
    }

    return hash;
  }
}
