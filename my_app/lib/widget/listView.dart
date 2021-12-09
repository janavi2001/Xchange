import 'package:flutter/material.dart';
import 'package:my_app/vendorside/Screens/acceptPay.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({key, this.name, this.amt, this.docid}) : super(key: key);
  final String name;
  final String amt;
  final String docid;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 0.5,
          color: Colors.purple.shade100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  
                    child: Text("Name:   $name",textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))),
                            
              ),
              
              subtitle: Center(
                  child: Row(
                children: [
                  Text("Amount : $amt",
                      style: TextStyle(
                          color: Colors.indigo.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  SizedBox(width: 10,),
                          
                  ElevatedButton(
                    
                    onPressed: () => {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => acceptPay(
                    name: name,
                    docid:docid,
                    amt : amt,
                  ),
                ))
              },
                    child: Text("data"),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )),
            ),
          ),
        ));
  }
}
