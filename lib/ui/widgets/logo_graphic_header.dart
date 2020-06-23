import 'dart:io';

import 'package:flutter/material.dart';

class LogoGraphicHeader extends StatelessWidget {
  final String imageUrl;
  final File file;
  final String tag;

  const LogoGraphicHeader({Key key, this.tag, this.imageUrl, this.file})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _imageLogo = 'assets/images/default.png';

    return Hero(
      tag: tag,
      child: CircleAvatar(
        radius: 50,
        child: ClipOval(
          child: (imageUrl == null && file == null)
              ? Image.asset(
                  _imageLogo,
                  fit: BoxFit.cover,
                )
              : imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                      height: 100,
                      width: 100,
                    )
                  : Image.file(file),
        ),
      ),
    );
  }
}
