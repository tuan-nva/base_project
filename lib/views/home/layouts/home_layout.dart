import 'package:base_project/models/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeModel>(context, listen: true);

    List<Widget> list = [];

    if (viewModel.child != null) {
      list.add(viewModel.child);
    }

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: list,
      ),
    );

    // Scaffold(
    //   backgroundColor: AppStyle.colors[1][0],
    //   appBar: AppBar(
    //     title: Text(viewModel.title),
    //     bottom: PreferredSize(
    //       child: viewModel.baseStatus == BaseModelStatus.Loading ||
    //               viewModel.childStatus == ChildModelStatus.Loading
    //           ? LinearProgressIndicator()
    //           : Container(),
    //       preferredSize: Size.zero,
    //     ),
    //   ),
    //   drawer: viewModel.drawer,
    //   body: ListView(
    //     children: <Widget>[
    //       Container(
    //         child: Column(
    //           mainAxisSize: MainAxisSize.max,
    //           children: list,
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
