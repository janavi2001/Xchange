
import 'package:flutter/material.dart';
import 'package:my_app/userside/DigtoCash.dart';

class transaction extends StatefulWidget {
  const transaction({key}) : super(key: key);

  @override
  _transactionState createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        
      ),
      body: ListView(padding: EdgeInsets.all(24),
       children: [

         Column(
           children: [
             Container(height: 200),
             ElevatedButton(onPressed: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (context) => digtocash()));

             }, child: Text("Digital To Cash")),
             const SizedBox(height: 20,),
             ElevatedButton(onPressed: (){}, child: Text("Servers Down")),
             const SizedBox(height: 20,),
             ElevatedButton(onPressed: (){}, child: Text("Change")),
             const SizedBox(height: 20,),
           ],
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         )
        
      ]),
    );
  }
}
