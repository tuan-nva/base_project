import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:base_project/components/_bases/base_controller.dart';
import 'package:base_project/components/_bases/base_model.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';
import 'package:base_project/components/_variables/storages/user_storage_data.dart';
import 'package:base_project/models/main/main_model.dart';
import 'package:base_project/views/main/layouts/login_layout.dart';
import 'package:base_project/views/home/home_view.dart';

class MainController extends BaseController<MainModel> {
  MainController();

  MainController.instance(BuildContext context) {
    Firebase.initializeApp();
    initState(context);
  }

  Future<MainController> initState(BuildContext context) async {
    final titleModel = Provider.of<TitleModel>(context, listen: false);
    final mainModel = Provider.of<MainModel>(context, listen: false);
    final statusModel = Provider.of<StatusModel>(context, listen: false);

    var token = await UserStorargeData.getAppToken();
    if (token == null) {
      titleModel.changeValues(
        title: TextAppData.getValue("login"),
      );
      mainModel.changeValues(child: LoginLayout());
      statusModel.changeStatus(status: BaseModelStatus.View);
    } else {
      mainModel.changeValues(child: HomeView());
      statusModel.changeStatus(status: BaseModelStatus.View);
    }
    return this;
  }
}
