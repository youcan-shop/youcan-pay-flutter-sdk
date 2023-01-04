import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../exceptions/invalid_response_exception.dart';
import '../models/ycp_response_3ds.dart';

class YCPWebView extends StatefulWidget {
  final Function(String? transactionId) onSuccessfulPayment;
  final Function(String? message) onFailedPayment;
  final YCPResponse3ds response;

  const YCPWebView(
      {Key? key,
      required this.response,
      required this.onSuccessfulPayment,
      required this.onFailedPayment})
      : super(key: key);

  @override
  State<YCPWebView> createState() => _YCPWebViewState();
}

class _YCPWebViewState extends State<YCPWebView> {
  Function(String?) get onSuccessfulPayment => widget.onSuccessfulPayment;

  Function(String?) get onFailedPayment => widget.onFailedPayment;

  YCPResponse3ds get response => widget.response;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Size.infinite.width,
          color: Colors.white,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    onFailedPayment("payment_canceled");
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 28,
                  )),
            ],
          ),
        ),
        Expanded(
          child: WebView(
            initialUrl: response.redirectUrl,
            javascriptMode: JavascriptMode.unrestricted,
            gestureNavigationEnabled: true,
            onPageStarted: (url) {
              urlListener(url);
            },
          ),
        ),
      ],
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
      onFailedPayment("payment_failed");
      Navigator.pop(context);
    }
  }

  Map<String, String> getListenUrlResult(String url) {
    List<String> urlSplit = url.split("?");

    if (urlSplit.length == 1) {
      throw InvalidResponseException("Invalid response");
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
