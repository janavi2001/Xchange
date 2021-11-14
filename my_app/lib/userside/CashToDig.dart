import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/userside/paymentScreen.dart';

class cashtodig extends StatefulWidget {
  const cashtodig({key}) : super(key: key);

  @override
  _cashtodigState createState() => _cashtodigState();
}

class _cashtodigState extends State<cashtodig> {
  @override
  Widget build(BuildContext context) {

    String number = Random().nextInt(9999).toString().padLeft(4, '0');

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final myController = TextEditingController();

    Future<void> upDateOTP(number) async {
      // Call the user's CollectionReference to add a new user
      try {
      await users
          .doc(_auth.currentUser.uid)
          .update(
        {
          'otp': number,
        },
      );
      // return 1;
    } catch (e) {
      print(e);
      // return 0;
    }
    }
    

    
    

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
        
        TextField( controller: myController,),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Text("OTP:"),
            Text("$number")
            

          ],
          mainAxisAlignment: MainAxisAlignment.center,

        ),

        const SizedBox(
          height: 50,
        ),
        
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(onPressed: (){
          upDateOTP(number);
          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => paymentScreen(amt: myController.text)));

        }, child: Text("Request"))
        
        
      ]),
    );
  }
}
