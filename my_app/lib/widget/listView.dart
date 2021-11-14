import 'package:flutter/material.dart';
import 'package:my_app/vendorside/Screens/acceptPay.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({key, this.name,this.amt}): super(key: key);
  final String name;
  final String amt;

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
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => acceptPay(),
              ))
            },
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18))),
            ),
            subtitle: Center(
                child: Text(amt,
                    style: TextStyle(
                        color: Colors.indigo.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: 15))),
          ),
        ),
      ),
    );
  }
}
