import 'package:base_project/components/_bases/base_model.dart';
import 'package:base_project/components/_layouts/app_dialog.dart';
import 'package:base_project/components/_variables/https/app_http_model.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';
import 'package:base_project/controllers/user/user_api_controller.dart';
import 'package:base_project/models/user/account_model.dart';
import 'package:base_project/models/main/main_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountController {
  AccountController();

  Future<void> changeAccount(BuildContext context, AccountModel model) async {
    final statusModel = Provider.of<StatusModel>(context, listen: false);

    statusModel.changeStatus(status: BaseModelStatus.Loading);

    var saveResult = await UserApiController.changeAccount(
      model.toMap(),
    );

    if (saveResult.status == AppHttpModelStatus.Success) {
      statusModel.changeStatus(status: BaseModelStatus.View);

      await AppDialog.showMessage(
          context,
          TextAppData.getValue("actionSuccess"),
          TextAppData.getValue("actionSuccessDetail"));
    } else {
      statusModel.changeStatus(status: BaseModelStatus.Error);

      await AppDialog.showMessage(
          context, saveResult.message, saveResult.details);
    }
  }
}
