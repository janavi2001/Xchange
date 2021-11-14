import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class paymentScreen extends StatefulWidget {
  const paymentScreen({key ,  this.amt}) : super(key: key);

  final TextEditingController amt;
  
  

  @override
  _paymentScreenState createState() => _paymentScreenState();
}

class _paymentScreenState extends State<paymentScreen> {
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
        
        TextField(),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Text("OTP:"),
            Text()
            

          ],
          mainAxisAlignment: MainAxisAlignment.center,

        ),

        
        
      ]),
    );
  }
}
