import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minicipalite_app/models/models.dart';
import 'package:minicipalite_app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MyDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                LogoGraphicHeader(
                  tag: "header",
                  file: new File("path"),
                  imageUrl: user.photoUrl,
                ),
                Positioned(
                    bottom: 12.0,
                    left: 16.0,
                    child: Text(user?.email,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500))),
              ]),
        ));
  }
}
