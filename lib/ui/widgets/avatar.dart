import 'package:flutter/material.dart';

import 'package:minicipalite_app/models/models.dart';
import 'package:minicipalite_app/ui/widgets/logo_graphic_header.dart';


class Avatar extends StatelessWidget {
  Avatar(
    this.user,
  );
  final User user;

  @override
  Widget build(BuildContext context) {
    if ((user?.photoUrl == '') || (user?.photoUrl == null)) {
      return LogoGraphicHeader();
    }
    return Hero(
      tag: 'User Avatar Image',
      child: CircleAvatar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.white,
          radius: 70.0,
          child: ClipOval(
            child: Image.network(
              user?.photoUrl,
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
            ),
          )),
    );
  }
}
