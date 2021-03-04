import 'package:base_project/components/_variables/values/app_style.dart';
import 'package:flutter/material.dart';

import 'logo/layouts/logo_layout.dart';

class MessageLayout extends StatelessWidget {
  final String message;
  MessageLayout({this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 90.0,
        ),
        LogoLayout(),
        SizedBox(height: 12.0),
        Text(
          this.message,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppStyle.colors[1][1], fontSize: 18),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
