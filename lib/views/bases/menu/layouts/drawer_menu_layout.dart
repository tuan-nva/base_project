import 'package:base_project/views/menus/menu_profile/menu_profile_view.dart';
import 'package:flutter/material.dart';

class DrawerMenuLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MenuProfileView(),
    );
  }
}
