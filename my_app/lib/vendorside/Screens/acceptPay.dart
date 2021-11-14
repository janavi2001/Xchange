import 'package:flutter/material.dart';

class acceptPay extends StatefulWidget {
  const acceptPay({key}) : super(key: key);

  @override
  _acceptPayState createState() => _acceptPayState();
}


class _acceptPayState extends State<acceptPay> {
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
          height: 150,
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
          "100",
          style: TextStyle(color: Colors.blue, fontSize: 32),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          "Name",
          style: TextStyle(color: Colors.blue, fontSize: 20),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Ph no",
          style: TextStyle(color: Colors.blue, fontSize: 20),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 50,
        ),
        TextField(),
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
