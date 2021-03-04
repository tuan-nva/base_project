import 'package:base_project/components/_bases/base_model.dart';
import 'package:flutter/cupertino.dart';

class HomeModel extends BaseModel {
  HomeModel.instance({Widget child}) {
    super.child = child;
  }

  Widget _drawer;
  Widget get drawer => _drawer;

  List<Widget> _actions = [];
  List<Widget> get actions => _actions;

  @override
  BaseModel changeValues({
    BaseModelStatus status,
    Widget child,
    String title,
    String message,
    Widget drawer,
  }) {
    _drawer = drawer;

    super.changeValues(
      status: status,
      child: child,
      title: title,
      message: message,
    );

    return this;
  }
}
