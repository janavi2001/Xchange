import 'package:flutter/material.dart';

class acceptPay extends StatelessWidget {
  const acceptPay({  key , this.name ,this.docid , this.amt}) : super(key: key);
  final String name;
  final String docid;
  final String amt;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(padding: EdgeInsets.all(24), children: [
        const SizedBox(
          height: 100,
        ),
        Text(
          'Amount',
          style: TextStyle(color: Colors.blue, fontSize: 32),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          "$amt",
          style: TextStyle(color: Colors.blue, fontSize: 32),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          "Name : $name",
          style: TextStyle(color: Colors.blue, fontSize: 20),
          textAlign: TextAlign.left,
        ),
        
        const SizedBox(
          height: 50,
        ),
        TextField(
          style: TextStyle(height: 2),
          decoration: new InputDecoration.collapsed(hintText: "Enter OTP",border: OutlineInputBorder(  borderSide: BorderSide(color: Colors.blue))),textAlign: TextAlign.center,
          
        ),
        Row(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Accept"),style: ElevatedButton.styleFrom(primary: Colors.green),),
            ElevatedButton(onPressed: () {}, child: Text("Deny"),style: ElevatedButton.styleFrom(primary: Colors.red))
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        )
      ]),
    );
  }
}