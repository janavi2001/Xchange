import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/razorpay/razorpaymain.dart';

class paymentScreen extends StatelessWidget {
  const paymentScreen({ key,this.amt }) : super(key: key);
  final String amt;





  @override
  
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(padding: EdgeInsets.all(24),
       children: [
        const SizedBox(
          height: 150,
        ),
        Text(
          'You are Paying',
          style: TextStyle(color: Colors.blue, fontSize: 32),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        
        Row(
          children: [
            
            Text('$amt')
            

          ],
          mainAxisAlignment: MainAxisAlignment.center,

        ),

        const SizedBox(
          height: 50,
        ),
        ElevatedButton(onPressed: (){
          






          Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Wallet(amt : amt)));



        }, child: Text("PAY "),)

        
        
      ]),
    );
  }
}
