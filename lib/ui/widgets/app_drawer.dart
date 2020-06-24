import 'package:flutter/material.dart';
import 'package:minicipalite_app/routes/router.gr.dart';
import 'package:minicipalite_app/services/drawer_state_info.dart';
import 'package:provider/provider.dart';

import 'widgets.dart';

class MyAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          MyDrawerHeader(),
          DrawerItem(
              id: 0, icon: Icons.home, text: 'Home', routeName: Routes.wrapper),
          DrawerItem(
              id: 1,
              icon: Icons.person_outline,
              text: 'Profile',
              routeName: Routes.updateProfileUI),
          DrawerItem(
              id: 2,
              icon: Icons.border_color,
              text: 'My posts',
              routeName: Routes.myPosts),
          Divider(
            color: Colors.grey,
          ),
          DrawerItem(
              id: 3,
              icon: Icons.add,
              text: 'Submit ',
              routeName: Routes.addPost),
          DrawerItem(
              id: 4,
              icon: Icons.power_settings_new,
              text: 'Log out',
              routeName: '')
        ],
      ),
    );
  }
}
