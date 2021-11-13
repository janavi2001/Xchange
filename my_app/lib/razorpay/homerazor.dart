import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Home extends StatefulWidget {
  

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_KGJBE28Acv0SKE",
      "amount": textEditingController.text,
      "name": "Sample App",
      "description": "Payment for the product",
      "prefill": {
        "contact": "9513388379",
        "email": "janavisrinivasan26@gmail.com",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }
  

  void handlerPaymentSuccess() {
    print("Payment success");
  }

  void handlerError() {
    print('Payment error');
  }

  void handlerExternalWallet() {
    print('External Wallet');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recharge'),
      ),
      body: Column(
        children: [
          
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: "Amount to pay"),
          ),
          SizedBox(
            height: 12,
          ),
          RaisedButton(
              child: Text('Pay Now'),
              onPressed: () {
                openCheckout();
              })
        ],
      ),
    );
  }
}
