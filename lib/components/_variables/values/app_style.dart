import 'package:flutter/material.dart';

class AppStyle {
  static var colors = [
    [
      Color(0xFFD1F4F4),
      Color(0xFF95D4D4),
      Color(0xFF85E1E1),
      Color(0xFF78DCB0),
      Color(0xFF30C8C7),
      Color(0xFF22C9C8),
      Color(0xFF1EC8C8),
    ],
    [
      Color(0xFFFAFEFE),
      Color(0xFFF8F9FC),
      Color(0xFFF5F6FA),
      Color(0xFFD4E2E2),
      Color(0xFFD4DDE3),
      Color(0xFF9FA4AE),
      Color(0xFF8D9EA4),
      Color(0xFF4B4D5A),
    ],
    [
      Color(0xFF46A7FA),
      Color(0xFFEDF79D),
      Color(0xFFD9D09C),
    ],
  ];

  static var borders = [
    BorderSide(
      width: 0.2,
    )
  ];

  static ThemeData defaultTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 0.5,
        color: colors[0][5],
      ),
      // accentColor: Colors.black,
      inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: colors[0][0],
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: borders[0],
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: borders[0],
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: borders[0],
          ),
          border: UnderlineInputBorder(
            borderSide: borders[0],
          )),
      // textTheme: TextTheme(
      //   button: TextStyle(
      //     fontSize: 18.0,
      //   ),
      //   body1: TextStyle(
      //     fontSize: 18.0,
      //   ),
      // ),
      // buttonTheme: ButtonThemeData(
      //   buttonColor: color3,
      //   padding: EdgeInsets.all(5),
      // ),
    );
  }
}
