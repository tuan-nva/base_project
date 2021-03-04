import 'package:base_project/components/_layouts/app_lib.dart';
import 'package:base_project/components/_variables/values/app_style.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';
import 'package:base_project/views/bases/logo/layouts/logo_layout.dart';
import 'package:base_project/views/main/main_view.dart';
import 'package:flutter/material.dart';

class BackMainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.0,
        ),
        LogoLayout(),
        SizedBox(height: 32.0),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Text(
            TextAppData.getValue("userProfileExpired"),
            textAlign: TextAlign.center,
            style: TextStyle(color: AppStyle.colors[1][1], fontSize: 16),
          ),
        ),
        SizedBox(height: 32.0),
        Container(
          margin: EdgeInsets.only(left: 50, right: 50),
          child: RaisedButton(
            color: AppStyle.colors[2][1],
            child: AppLib.getRow(
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 24),
                child: Text(
                  TextAppData.getValue("returnLogin"),
                ),
              ),
              start: Icon(
                Icons.arrow_back_ios,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainView()),
              );
            },
          ),
        ),
      ],
    );
  }
}
