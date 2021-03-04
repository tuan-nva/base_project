import 'package:flutter/material.dart';

class LeadingLayout extends InheritedWidget {
  LeadingLayout({Widget child}) : super(child: child);
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LeadingLayout of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<LeadingLayout>();
}
