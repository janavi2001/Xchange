import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';



class Wallet extends StatefulWidget {
   Wallet({Key key, this.amt}) : super(key: key);
   final String amt;
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int totalcredits = 1500;
  int finalcredits;
  int totalAmount = 0;
  
  int credits ;


  Razorpay _razorpay;
  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlerPaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlerPaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlerExternalWallet);
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      "key": "rzp_test_KGJBE28Acv0SKE",
      "amount": credits*100,
      "name": "Sample App",
      "description": "Payment for the product",
      "prefill": {
        "contact": "",
        "email": "",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void _handlerPaymentSuccess(PaymentSuccessResponse response) {
    // print('the current amount is:' + currentamount.toString());

    Fluttertoast.showToast(msg: 'SUCCESS' + response.paymentId.toString());
    // Fluttertoast.showToast(
    //     timeInSecForIosWeb: 5,
    //     msg: totalAmount.toString() + '  credits have been added ');
    // final FirebaseFirestore firestore = FirebaseFirestore.instance;
    // String user = FirebaseAuth.instance.currentUser.uid;

    // firestore.collection('users').doc(user).update({
    //   'credits': totalAmount + credits,
    // });
  }

  void _handlerPaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        timeInSecForIosWeb: 5,
        msg: 'ERROR' +
            response.code.toString() +
            "." +
            response.message.toString());
  }

  void _handlerExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        timeInSecForIosWeb: 5,
        msg: 'EXTERNAL WALLET' + response.walletName.toString());
  }

  @override
  Widget build(BuildContext context) {
    int currentamount;
    currentamount = totalcredits - totalAmount;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () => {Navigator.pop(context)},
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Recharge', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LimitedBox(
              maxWidth: 150.0,
              child: Container(
                margin: EdgeInsets.all(40),
                child: Text("${widget.amt}")
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            ElevatedButton(
              onPressed: () {
                credits = int.parse(widget.amt);

                openCheckout();
              },
              child: Text(
                'Make Payment',
                style: TextStyle(
                     fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
                
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _getCurrentCredits() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((result) {
      setState(() {
        credits = result.data()['credits'];
      });
    });
  }
}
