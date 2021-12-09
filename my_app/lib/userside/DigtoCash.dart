import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/userside/paymentScreen.dart';

class digtocash extends StatefulWidget {
  const digtocash
({key}) : super(key: key);

  @override
  _cashtodigState createState() => _cashtodigState();
}

class _cashtodigState extends State<digtocash> {
  @override
  Widget build(BuildContext context) {
    int nu =0;

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
    String username ='name';
    CollectionReference t = FirebaseFirestore.instance.collection('VENDOR').doc('0000').collection('REQUESTS');
    Future<void> addreq() {
      // Call the user's CollectionReference to add a new user
      return t
          .add({
            'name': username, // John Doe
            'docid': _auth.currentUser.uid, // Stokes and Sons
            'requestamt': myController.text // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    Future<String> retreivename() async {
      FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((result) {
      username = result.data()['name'];
    });
    return username;
    
      
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
        
        TextField( controller: myController,
        ),
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
          retreivename();
          addreq();

          upDateOTP(number);

          Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => paymentScreen(amt: myController.text)));

        }, child: Text("Request"))
        
        
      ]),
    );
  }
}
