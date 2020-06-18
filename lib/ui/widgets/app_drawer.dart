import 'package:flutter/material.dart';
import 'package:minicipalite_app/routes/router.gr.dart';

import 'widgets.dart';

class MyAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          MyDrawerHeader(),
          DrawerItem(icon: Icons.home, text: 'Home', routeName: Routes.wrapper),
          DrawerItem(
              icon: Icons.person_outline,
              text: 'Profile',
              routeName: Routes.updateProfileUI),
          Divider(
            color: Colors.grey,
          ),
          DrawerItem(
              icon: Icons.add, text: 'Submit ', routeName: Routes.addPost),
          DrawerItem(
              icon: Icons.power_settings_new, text: 'Log out', routeName: '')
        ],
      ),
    );
  }
}
