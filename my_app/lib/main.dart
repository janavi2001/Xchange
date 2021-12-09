// import 'dart:async';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:my_app/auth/authentication.dart';
// import 'package:my_app/qrcode/intermediate.dart';
// import 'package:my_app/userside/mainScreen.dart';
// import 'package:my_app/vendorside/Screens/vendorPage.dart';



// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Xchange',
      
//       home: MapSample(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsFlutterBinding.ensureInitialized();
//     Timer(
//       Duration(seconds: 5),
//       () => Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => App(),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
          
//         ),
//         child: Center(
//           child: Container(
//             child: Text(
//               "Xchange",
//               style: TextStyle(
//                   //fontFamily: 'Poppins',
//                   fontSize: 40,
//                   fontWeight: FontWeight.w600,
//                   fontStyle: FontStyle.normal),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/auth/login.dart';
import 'package:my_app/userside/TypeOfTrans.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Text('Could not load app'),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Phone Verification',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.blueAccent[900],
                primarySwatch: Colors.indigo,
                inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.grey)),
                backgroundColor: Colors.white),
            // home: LoginScreen(),
            home:transaction(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  )
                ],
              )
            ]);
      },
    );
  }
}
