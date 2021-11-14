import 'package:flutter/material.dart';
import 'package:my_app/widget/listView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/widget/navigationWidgetVendor.dart';

class VendorPage extends StatefulWidget {
  const VendorPage({key}) : super(key: key);

  @override
  _VendorPageState createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            "StoreID",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: StreamBuilder<QuerySnapshot>(
  stream: firestore.collection('VENDOR').doc("0000").collection("REQUESTS").snapshots(),
  builder: (_, snapshot) {
    if (snapshot.hasError) return Text('Error = ${snapshot.error}');

    if (snapshot.hasData) {
      final docs = snapshot.data.docs;
      return ListView.builder(
        
        itemCount: docs.length,
        itemBuilder: (_, i) {
          final data = docs[i].data();
          return ItemWidget(name: data['name'], amt: data['requestamt'],docid : data['docid']);
        },
      );
    }

    return Center(child: CircularProgressIndicator());
  },
)
          
        
        );
  }
}
