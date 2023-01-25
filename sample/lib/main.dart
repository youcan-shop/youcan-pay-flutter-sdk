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
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String publicKey = "pub_sandbox_10277a4b-96a0-4d1a-b632-d9886";
  final String token = "282de234-709e-46b3-b4e4-577e12ec5821";

  late final YCPay ycPay;
  late final CardInformation cardInformation;

  @override
  void initState() {
    super.initState();
    initYCPay();
    initCardInformation();
  }

  // Initialize YCPay
  // publicKey: Your public key
  // sandbox: true if you want to use sandbox mode
  // locale: Your locale (default is en)
  void initYCPay() {
    ycPay = YCPay(publicKey: publicKey, sandbox: true);
  }

  // Initialize card information
  // You can get this information from your user
  void initCardInformation() {
    try {
      cardInformation = CardInformation(
        cardHolderName: 'John Doe',
        cardNumber: '4242424242424242',
        expireDateYear: '24',
        expireDateMonth: '10',
        cvv: '112',
      );
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
          children: <Widget>[
            payWithCardButton(),
            const SizedBox(height: 20),
            payWithCashPlusButton()
          ],
        ),
      ),
    );
  }

  Widget payWithCardButton() {
    return ElevatedButton(
      onPressed: () async {
        await payWithCard(context);
      },
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: Text(
            "Pay with card",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget payWithCashPlusButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () async {
        await payWithCashPlus();
      },
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: Text(
            "Pay with CashPlus",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Future<void> payWithCashPlus() async {
    return await ycPay.payWithCashPlus(
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
      },
    );
  }

  Future<void> payWithCard(BuildContext context) async {
    return await ycPay.payWithCard(
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
      },
      context: context,
    );
  }
}
