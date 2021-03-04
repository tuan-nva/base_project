import 'package:flutter/widgets.dart';

class AccountModel extends ChangeNotifier {
  AccountModel({String input}) {
    if (input != null) {
      _userName = input;
    }
  }

  String _userName;
  String _password;

  String get userName => _userName;
  set userName(String value) {
    if (true) {
      _userName = value;
    }
  }

  String get password => _password;
  set password(String value) {
    if (true) {
      _password = value;
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["userName"] = userName;
    map["newPass"] = password;

    return map;
  }}
