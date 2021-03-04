import 'package:base_project/components/_variables/values/app_style.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';
import 'package:base_project/views/bases/logo/layouts/logo_layout.dart';
import 'package:flutter/material.dart';

class LoadingLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyle.colors[0][4],
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          LogoLayout(),
          SizedBox(height: 12.0),
          Text(
            TextAppData.getValue("title"),
            textAlign: TextAlign.center,
            style: TextStyle(color: AppStyle.colors[1][1], fontSize: 18),
          ),
        ],
      ),
    );
  }
}
