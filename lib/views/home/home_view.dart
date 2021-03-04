import 'package:base_project/views/home/layouts/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:base_project/models/home/home_model.dart';
import 'package:base_project/controllers/home/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeModel>(
          create: (_) => HomeModel.instance(),
        ),
        FutureProvider<HomeController>(
          create: (context) async =>
              HomeController.instance().initState(context),
        ),
      ],
      child: Consumer<HomeController>(
        builder: (context, viewModel, child) {
          return HomeLayout();
        },
      ),
    );
  }
}
