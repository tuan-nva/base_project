import 'package:base_project/components/_variables/values/app_style.dart';
import 'package:base_project/models/main/main_model.dart';
import 'package:base_project/views/bases/logo/layouts/logo_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainModel>(context, listen: true);

    return Column(
      children: [
        SizedBox(
          height: 90.0,
        ),
        LogoLayout(),
        SizedBox(height: 12.0),
        Text(
          viewModel.message,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppStyle.colors[1][1], fontSize: 18),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
