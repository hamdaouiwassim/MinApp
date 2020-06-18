import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:minicipalite_app/services/services.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String routeName;

  DrawerItem({this.icon, this.text, this.routeName});
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: routeName.isNotEmpty
          ? () => ExtendedNavigator.of(context).pushNamed(routeName)
          : () async {
              await _auth.signOut();
            },
    );
  }
}
