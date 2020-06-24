import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:minicipalite_app/constants/app_theme.dart';
import 'package:minicipalite_app/services/drawer_state_info.dart';
import 'package:minicipalite_app/services/services.dart';
import 'package:provider/provider.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String routeName;
  final int id;

  DrawerItem({this.icon, this.text, this.routeName, @required this.id});
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final drawer_provider = Provider.of<DrawerStateInfo>(context);
    return Container(
      decoration: new BoxDecoration(
          color: drawer_provider.getCurrentDrawer == id
              ? Colors.blue.withOpacity(0.1)
              : Colors.white),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(
              icon,
              color: drawer_provider.getCurrentDrawer == id
                  ? AppThemes.dodgerBlue
                  : AppThemes.nevada,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: TextStyle(
                    color: drawer_provider.getCurrentDrawer == id
                        ? AppThemes.dodgerBlue
                        : AppThemes.nevada),
              ),
            )
          ],
        ),
        onTap: routeName.isNotEmpty
            ? () {
                ExtendedNavigator.of(context).pushNamed(routeName);
                drawer_provider.setCurrentDrawer(id);
              }
            : () async {
                await _auth.signOut();
              },
      ),
    );
  }
}
