import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:base_project/models/main/main_model.dart';
import 'package:base_project/views/bases/loading_layout.dart';

class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainModel>(context, listen: true);

    return viewModel.child ?? LoadingLayout();
  }
}
