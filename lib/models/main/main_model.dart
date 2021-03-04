import 'package:flutter/material.dart';
import 'package:base_project/components/_bases/base_model.dart';

class MainModel extends BaseModel {
  MainModel.instance({Widget child}) {
    super.child = child;
  }

  Widget _body;
  Widget get body => _body;

  dynamic _numberNotify = 0;
  dynamic get numberNotfify => _numberNotify;
  set numberNotify(dynamic value) {
    if (true) {
      _numberNotify = value;
    }
  }

  @override
  BaseModel changeValues({
    BaseModelStatus status,
    Widget child,
    String title,
    String message,
    Widget drawer,
    List<Widget> actions,
    Widget body,
  }) {
    _body = body ?? _body;

    super.changeValues(
      status: status,
      child: child,
      title: title,
      message: message,
    );

    return this;
  }
}

class TitleModel extends BaseModel {
  TitleModel.instance({Widget child}) {
    super.child = child;
  }
}

class StatusModel extends BaseModel {
  StatusModel.instance({Widget child}) {
    super.child = child;
  }
}

class BottomSheetModel extends BaseModel {
  BottomSheetModel.instance({Widget child}) {
    super.child = child;
  }
}

class DrawerModel extends ChangeNotifier {
  DrawerModel.instance();

  bool _isDisplayed = false;
  bool get isDisplayed => _isDisplayed;

  Widget _drawer;
  Widget get drawer => _drawer;

  DrawerModel changeValues({Widget drawer}) {
    _isDisplayed = drawer != null ? true : false;
    _drawer = drawer;
    notifyListeners();
    return this;
  }
}

class BottomModel extends BaseModel {
  BottomModel.instance({Widget child}) {
    super.child = child;
  }
}

class LeadingModel extends ChangeNotifier {
  LeadingModel.instance();

  bool _show = false;
  bool get show => _show;

  Function _onPressed;
  Function get onPressed => _onPressed;

  Widget _child;
  Widget get child => _child;

  LeadingModel changeValues({
    @required bool show,
    Widget child,
    Function onPressed,
  }) {
    _show = show ?? _show;
    _child = child ??
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: onPressed,
        );

    notifyListeners();
    return this;
  }
}

class ActionModel extends ChangeNotifier {
  ActionModel.instance();

  bool _show = false;
  bool get show => _show;

  List<Widget> _actions = [];
  List<Widget> get actions => _actions;

  ActionModel changeValues({
    @required bool show,
    List<Widget> actions,
  }) {
    _show = show ?? _show;
    _actions = actions ?? _actions;
    notifyListeners();
    return this;
  }
}

class FloatingActionModel extends ChangeNotifier {
  FloatingActionModel.instance();
  bool _show = false;
  bool get show => _show;

  Widget _button;
  Widget get button => _button;

  FloatingActionButtonLocation _buttonLocation;
  FloatingActionButtonLocation get buttonLocation => _buttonLocation;

  FloatingActionButtonAnimator _buttonAnimator;
  FloatingActionButtonAnimator get buttonAnimator => _buttonAnimator;

  FloatingActionModel changeValues({
    @required bool show,
    Widget button,
    FloatingActionButtonLocation location,
    FloatingActionButtonAnimator animator,
  }) {
    _show = show ?? _show;
    _button = button ?? _button;
    _buttonAnimator = animator ?? _buttonAnimator;
    _buttonLocation = location ?? _buttonLocation;

    notifyListeners();
    return this;
  }
}
