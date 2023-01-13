import 'package:flutter/material.dart';
import 'package:youcanpay_sdk/youcanpay_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouCan Pay Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'YouCan Pay Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String token = "token";
  String publicKey = "pubKey";
  late YCPay ycPay;
  late CardInformation cardInformation;

  @override
  void initState() {
    super.initState();
    initYCPay();
    initCardInformation();
  }

  // Initialize YCPay
  // publicKey: Your public key
  // context: Your context
  // sandbox: true if you want to use sandbox mode
  // locale: Your locale (default is en)
  initYCPay() {
    ycPay = YCPay(publicKey: publicKey, context: context, sandbox: true);
  }

  // Initialize card information
  // You can get this information from your user
  initCardInformation() {
    try {
      cardInformation = CardInformation(cardHolderName: 'Holder Name', cardNumber: '1234123412341234', expireDateYear: '35', expireDateMonth: '12', cvv: '123');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[payWithCardButton(), const SizedBox(height: 20), payWithCashPlusButton()],
        ),
      ),
    );
  }

  Widget payWithCardButton() {
    return ElevatedButton(
        onPressed: () => payWithCard(),
        child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: const Center(
                child: Text(
              "Pay with card",
              style: TextStyle(fontSize: 20),
            ))));
  }

  Widget payWithCashPlusButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        onPressed: () => payWithCashPlus(),
        child: SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: const Center(
                child: Text(
              "Pay with CashPlus",
              style: TextStyle(fontSize: 20),
            ))));
  }

  void payWithCashPlus() {
    ycPay.payWithCashPlus(
        token: token,
        onSuccessfulPayment: (transactionId, cashPlusToken) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('pay success cashPlus token: $transactionId'),
            backgroundColor: Colors.green,
          ));
        },
        onFailedPayment: (message) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('pay failed $message'),
            backgroundColor: Colors.red,
          ));
        });
  }

  void payWithCard() {
    ycPay.payWithCard(
        token: token,
        cardInformation: cardInformation,
        onSuccessfulPayment: (transactionId) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('pay success $transactionId'),
            backgroundColor: Colors.green,
          ));
        },
        onFailedPayment: (message) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('pay failed $message'),
            backgroundColor: Colors.red,
          ));
        });
  }
}
