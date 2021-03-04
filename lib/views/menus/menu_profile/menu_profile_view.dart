import 'package:base_project/controllers/menus/menu_profile_controller.dart';
import 'package:base_project/models/user/profile_model.dart';
import 'package:base_project/views/menus/menu_profile/layouts/menu_profile_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileModel>(
          create: (_) => ProfileModel.instance(),
        ),
        FutureProvider<MenuProfileController>(
          create: (context) async =>
              MenuProfileController.instance().initState(context),
        ),
      ],
      child: Consumer<MenuProfileController>(
        builder: (context, viewModel, child) {
          return MenuProfileLayout();
        },
      ),
    );
  }
}
