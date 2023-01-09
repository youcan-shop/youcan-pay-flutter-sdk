<p align="center"><a href="https://pay.youcan.shop" target="_blank"><img src="https://pay.youcan.shop/images/ycpay-logo.svg" width="400"></a></p>
  
  
YouCanPay Flutter SDK makes it quick and easy to build an excellent payment experience in your Android & iOS apps with [YouCan Pay API](https://pay.youcan.shop/docs).
We provide powerful and customizable UI screens to make your payment more easier
## Basic Usage

###  Server-side

This integration requires endpoints on your server in order to communicate with YouCanPay API. Use our official libraries for access to the YouCanPay API from your server:  the following steps in our [Documentation](https://pay.youcan.shop/docs) will guide you through.

### Install the YouCan Pay SDK :

Add youcanpay to your pubspec.yaml file:
```yaml
dependencies:
  youcanpay: <version>
```

Or run following command line
```sh
flutter pub add youcanpay
```
#### Import it
Now in your Dart code, you can use:

```dart
import 'package:youcanpay_sdk/youcanpay_sdk.dart';
```

 ### Set up Payment :
  #### Initials YCPay
The first step is to initialize YouCanPay SDK by creating an instance using the following parameters : ```pub_key``` and ```context```

``` dart
late YCPay ycPay;
```
and instantiate  it in your ```initState``` method

``` dart 
@override
  void initState() {
    super.initState();
     ycPay = YCPay(
        publicKey: publicKey,
        context: context
    );
  }
```

##### pub_key
The seller's YouCanPay account public key. This lets us know who is receiving the payment.
#### Load supported payment methods
After we initials ycPay we can load the supprted payment methods using:
``` dart
ycPay.getAccountConfig().then((accountConfig){
           if (!accountConfig.success) {
            	// load config failed.
               return;
           }

           if (accountConfig.acceptsCashPlus) {
               // CashPlus is available
           }
   
           if (accountConfig.acceptsCreditCards) {
               // Credit cards are available
           }
       });
```

#### Start Payment Using Credit Card:
When you get ```accountConfig.acceptsCreditCard == true``` it means that the Credit Card payment method is allowed.
##### Initials Card Information
``` dart 
try{
   cardInformation = CardInformation(
       cardHolderName: 'Holder Name',
       cardNumber: '1234123412341234',
       expireDateYear: '35', // YY
       expireDateMonth: '12', // MM
       cvv: '123');
} catch(e) {
   print(e); // Invalid CardInformation Exception error
}
```
##### Proceed payment using Credit Card:

You can use ```ycPay.payWithCard``` to proceed your payment use as parameters the ```token_id``` it can be generated from your server side and received through an endpoint to the mobile application, to generate a token please refer to the [Tokenization section](https://youcanpay.com/docs#tokenization).
``` dart 
ycPay.payWithCard(
        token: "token_id"
        cardInformation: cardInformation,       
        onSuccessfulPayment: (transactionId) {
            // ... pay success
         },
        onFailedPayment: (errorMessage) {
            // ... pay Failure with reason
        },
);

```
Once the ```onSuccessfulPayment``` callback invoked it means that the transaction is processeded successfully, a ```transactionId``` will be received as a parameter that you can submit with your order details. Similarly, ```onFailedPayment``` is called when an error is occurred during the payment, and you get the ```errorMessage``` as a parameter to show to customer.

#### Start Payment Using CashPlus:

If you you get ```accountConfig.acceptsCashPlus == true``` that's mean that you have CashPlus as a payment method

##### Proceed payment using CashPlus:

You can use ycPay.payWithCashPlus to proceed your payment use as parameter the token_id it can be generated from your server side and received through an endpoint to the mobile application, to generate a token please refer to the Tokenization section.
``` dart 
ycPay.payWithCashPlus(
         token: "token_id", 
         onSuccessfulPayment: (transactionId, cashPlusToken) {
             // ... pay success
          }, 
         onFailedPayment: (errorMessage) {
             // ... pay Failure with reason
          }
 );
```
Once the ```onSuccessfulPayment``` callback invoked it means that the transaction is processeded successfully, a ```transactionId``` and ```cashPlusToken``` will be received as a parameter that you can submit with your order details. Similarly, ```onFailedPayment``` is called when an error is occurred during the payment, and you get the ```errorMessageas``` a parameter to show to customer.

#### Sandbox

YouCan Pay Sandbox offers an easy way for developers to test YouCan Pay in their test environment.
``` dart
// setting the sandbox mode
 ycPay = YCPay(
        publicKey: publicKey,
        context: context,
        sandbox: true // <--
    );
```
