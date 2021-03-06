import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/auth/login.dart';

class NavigationDrawerWidgetUser extends StatefulWidget {
  @override
  _NavigationDrawerWidgetUserState createState() =>
      _NavigationDrawerWidgetUserState();
}

class _NavigationDrawerWidgetUserState
    extends State<NavigationDrawerWidgetUser> {
  final Padding = EdgeInsets.symmetric(horizontal: 20);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final name = "Rajamma";
    final email = "rajamma@gmail.com";
    final urlImage =
        "https://i.picsum.photos/id/1019/200/200.jpg?hmac=KHfXQt_BONEwuWtr85KJ-jStSnVp_GL9FWpJXW_XtKw";
    return Drawer(
      child: Material(
        color: Colors.indigo,
        child: ListView(
          padding: Padding,
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
            ),
            const SizedBox(
              height: 48,
            ),
            buildMenuItem(text: 'Account Info', icon: Icons.people),
            const Divider(
              color: Colors.white70,
            ),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(
              text: 'Change Profile',
              icon: Icons.person,
              
              //redirect
            ),
            const Divider(
              color: Colors.white70,
            ),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(
              text: 'Vendor ratings ',
              icon: Icons.person,
              
              //redirect
            ),
            const Divider(
              color: Colors.white70,
            ),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(
              text: 'Concerns',
              icon: Icons.person,
              
              //redirect
            ),
            const Divider(
              color: Colors.white70,
            ),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(
              text: 'SignOut',
              icon: Icons.person,
              onClicked: () {
                _auth.signOut().then((value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen())));
              },
              //redirect
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    String urlImage,
    String name,
    String email,
  }) =>
      InkWell(
        child: Container(
          padding: Padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.pink,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white60),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white60),
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
      // Navigator.of(context).push(MaterialPageRoute(
      //   builder: (context) => ,
      // ));
    }
  }

  signOut() {
    //redirect
    _auth.signOut().then(
          (value) => WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen(),
                ),
              );
            },
          ),
        );
  }
}
