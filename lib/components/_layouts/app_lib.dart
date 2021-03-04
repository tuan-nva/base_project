import 'package:flutter/material.dart';
import 'package:base_project/components/_variables/values/app_style.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';

class AppLib {
  static Widget getCircle(
    Color color,
    double width,
    double height,
    Widget child,
  ) {
    return Align(
      child: ClipOval(
        child: Container(
          color: color,
          height: height,
          width: width,
          child: child,
        ),
      ),
    );
  }

  static Widget getRect(
    Color color,
    double width,
    double height,
    Widget child,
  ) {
    return Align(
      child: Container(
        color: color,
        height: height,
        width: width,
        child: child,
      ),
    );
  }

  static Widget getTextFormField(
    Function onSaveText, {
    Function onChangeText,
    Widget start,
    String value,
    String text,
    TextInputType type,
    bool isSecurity,
    String label,
    InputBorder border,
    bool isRequired,
    FocusNode focus,
    TextInputAction action,
    Function onSubmitted,
    bool autoFocus,
  }) {
    return getRow(
      TextFormField(
        keyboardType: type,
        obscureText: isSecurity != null ? isSecurity : false,
        decoration: InputDecoration(
          hintText: text,
          labelText: label != null ? label : null,
          focusedBorder: border,
          enabledBorder: border,
        ),
        initialValue: value != null ? value.toString() : "",
        onSaved: onSaveText,
        onChanged: onChangeText,
        validator: (value) {
          if (isRequired == true && value.isEmpty) {
            return text != null && text != ""
                ? text
                : TextAppData.getValue("typeInput");
          }
          return null;
        },
        focusNode: focus,
        textInputAction: action,
        onFieldSubmitted: onSubmitted,
        autofocus: autoFocus != null ? autoFocus : false,
      ),
      start: start,
    );
  }

  static Widget getRow(
    Widget child, {
    Widget start,
    Widget end,
    Color color,
    double space,
    double height,
    EdgeInsetsGeometry padding,
    EdgeInsetsGeometry margin,
  }) {
    List<Widget> list = [];
    if (start != null) {
      list.addAll(
        [
          start,
          SizedBox(
            width: space == null ? 10 : space,
          ),
        ],
      );
    }

    list.add(
      Flexible(
        fit: FlexFit.tight,
        child: child,
      ),
    );

    if (end != null) {
      list.addAll(
        [
          SizedBox(
            width: space == null ? 10 : space,
          ),
          end,
        ],
      );
    }

    return Container(
      padding: padding,
      margin: margin,
      height: height,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list,
      ),
    );
  }

  static Widget getRow2(
    Widget child, {
    Widget start,
    Widget end,
    Color color,
    double space,
    double height,
    EdgeInsetsGeometry padding,
    EdgeInsetsGeometry margin,
  }) {
    List<Widget> list = [];
    if (start != null) {
      list.addAll(
        [
          start,
          SizedBox(
            width: space == null ? 10 : space,
          ),
          child
        ],
      );
    }

    list.add(
      child,
    );

    if (end != null) {
      list.addAll(
        [
          SizedBox(
            width: space == null ? 10 : space,
          ),
          end
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }

  static Widget scaffold({
    Widget body,
    Widget bottomNavigationBar,
    Widget bottomSheet,
    Widget drawer,
    PreferredSizeWidget appBar,
    Widget floatingActionButton,
    FloatingActionButtonLocation floatingActionButtonLocation,
    FloatingActionButtonAnimator floatingActionButtonAnimator,
    List<Widget> persistentFooterButtons,
    Widget endDrawer,
    Color backgroundColor,
    Color drawerScrimColor,
  }) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: appBar ??
          AppBar(
            title: Text(TextAppData.getValue("title")),
            backgroundColor: AppStyle.colors[1][0],
          ),
      body: body ??
          Container(
            color: Colors.white,
          ),
      drawer: drawer ?? null,
      bottomNavigationBar: bottomNavigationBar ?? null,
      bottomSheet: bottomSheet ?? null,
      drawerScrimColor: drawerScrimColor ?? null,
      endDrawer: endDrawer ?? null,
      floatingActionButton: floatingActionButton ?? null,
      floatingActionButtonAnimator: floatingActionButtonAnimator ?? null,
      floatingActionButtonLocation: floatingActionButtonLocation ?? null,
      persistentFooterButtons: persistentFooterButtons ?? [],
    );
  }
}
