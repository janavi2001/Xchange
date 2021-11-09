import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final Padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name = "small";
    final email = "email";
    final urlImage =
        "https://i.picsum.photos/id/1019/200/200.jpg?hmac=KHfXQt_BONEwuWtr85KJ-jStSnVp_GL9FWpJXW_XtKw";
    return Drawer(
      child: Material(
        color: Colors.blue,
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
            buildMenuItem(
                text: 'People',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 0)),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(text: 'People', icon: Icons.people),
            const SizedBox(
              height: 24,
            ),
            const Divider(
              color: Colors.white70,
            ),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(text: 'People', icon: Icons.people),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
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
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
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
}
