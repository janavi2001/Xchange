import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_app/auth/authentication.dart';
import 'package:my_app/qrcode/intermediate.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xchange',
      // theme: ThemeData(
      //   // Define the default brightness and colors.
      //   brightness: Brightness.dark,
      //   primaryColor: softCyan,

      //   // Define the default font family.
      //   fontFamily: 'Georgia',

      //   // Define the default TextTheme. Use this to specify the default
      //   // text styling for headlines, titles, bodies of text, and more.
      //   textTheme: const TextTheme(
      //     headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //     headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //     bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      //   ),
      // ),
      // home: Order(),
      home: intermediate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    Timer(
      Duration(seconds: 5),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => App(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          
        ),
        child: Center(
          child: Container(
            child: Text(
              "Xchange",
              style: TextStyle(
                  //fontFamily: 'Poppins',
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ),
      ),
    );
  }
}
