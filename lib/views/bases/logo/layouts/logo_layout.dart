import 'package:base_project/components/_layouts/app_lib.dart';
import 'package:base_project/components/_variables/values/app_style.dart';
import 'package:flutter/material.dart';

class LogoLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppLib.getCircle(
      AppStyle.colors[2][1],
      101,
      101,
      AppLib.getCircle(
        AppStyle.colors[0][2],
        100,
        100,
        AppLib.getCircle(
          Colors.white,
          90,
          90,
          AppLib.getRect(
            Colors.white,
            64,
            64,
            Image.asset("assets/logo.png"),
          ),
        ),
      ),
    );
  }
}
