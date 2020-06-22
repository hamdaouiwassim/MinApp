import 'dart:io';

import 'package:flutter/material.dart';

class LogoGraphicHeader extends StatelessWidget {
  final String imageUrl;
  final File file;

  const LogoGraphicHeader({Key key, this.imageUrl, this.file})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _imageLogo = 'assets/images/default.png';

    return Hero(
      tag: 'App Logo',
      child: CircleAvatar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.transparent,
          radius: 50.0,
          child: ClipOval(
            child: (imageUrl.isEmpty && file == null)
                ? Image.asset(
                    _imageLogo,
                    fit: BoxFit.cover,
                    width: 120.0,
                    height: 120.0,
                  )
                : imageUrl.isNotEmpty
                    ? Image.network(imageUrl)
                    : Image.file(file),
          )),
    );
  }
}
