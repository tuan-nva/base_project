import 'package:flutter/cupertino.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';

enum BaseModelStatus { View, Loading, Error, Closed }

class BaseModel extends ChangeNotifier {
  BaseModelStatus _status = BaseModelStatus.Loading;

  String _title = TextAppData.getValue("app");
  String get title => _title;
  set title(String value) {
    if (true) {
      _title = value;
    }
  }

  BaseModelStatus get status => _status;
  set status(BaseModelStatus value) {
    if (true) {
      _status = value;
    }
  }

  String _message = "";
  String get message => _message;

  Widget _child;
  Widget get child => _child;
  set child(Widget value) {
    if (true) {
      _child = value;
    }
  }

  BaseModel changeValues({
    BaseModelStatus status,
    Widget child,
    String title,
    String message,
  }) {
    _status = status ?? _status;
    _child = child ?? _child;

    _title = title ?? _title;
    _message = message ?? _message;

    notifyListeners();

    return this;
  }

  BaseModel changeStatus({
    BaseModelStatus status,
  }) {
    _status = status ?? _status;

    notifyListeners();

    return this;
  }
}
