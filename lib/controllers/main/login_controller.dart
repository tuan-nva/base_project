import 'package:base_project/components/_bases/base_model.dart';
import 'package:base_project/components/_layouts/app_dialog.dart';
import 'package:base_project/components/_variables/https/app_http_model.dart';
import 'package:base_project/components/_variables/storages/fcm_storage_data.dart';
import 'package:base_project/components/_variables/storages/user_storage_data.dart';
import 'package:base_project/controllers/user/user_api_controller.dart';
import 'package:base_project/models/main/main_model.dart';
import 'package:base_project/models/main/login_model.dart';
import 'package:base_project/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class LoginController {
  LoginController();

  Future<void> login(BuildContext context, LoginModel model) async {
    final mainModel = Provider.of<MainModel>(context, listen: false);
    final statusModel = Provider.of<StatusModel>(context, listen: false);
    final titleModel = Provider.of<TitleModel>(context, listen: false);

    statusModel.changeStatus(status: BaseModelStatus.Loading);
    titleModel.changeValues();

    var tokenResult = await UserApiController.userLogin(model);
    if (tokenResult.status == AppHttpModelStatus.Success) {
      await UserStorargeData.setAppToken(tokenResult.value.accessToken);

      await UserStorargeData.setEncrptedAuthToken(
        tokenResult.value.encryptedAccessToken,
      );

      /// set deviceId
      await FCMStorageData.setDeviceId(new Uuid().v4());

      statusModel.changeStatus(status: BaseModelStatus.View);
      mainModel.changeValues(child: HomeView());
    } else {
      statusModel.changeValues(status: BaseModelStatus.Error);

      await AppDialog.showMessage(
        context,
        tokenResult.message,
        tokenResult.details,
      );
    }
  }
}
