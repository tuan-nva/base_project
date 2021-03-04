import 'package:base_project/components/_variables/storages/fcm_storage_data.dart';
import 'package:base_project/components/_variables/storages/user_storage_data.dart';
import 'package:base_project/models/fcm/device_data_model.dart';
import 'package:base_project/models/user/profile_model.dart';
import 'package:base_project/controllers/main/main_controller.dart';
import 'package:base_project/views/home/home_view.dart';
import 'package:base_project/views/user/layouts/account_layout.dart';
import 'package:base_project/views/user/profile_view.dart';
import 'package:base_project/views/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

class MenuProfileController {
  MenuProfileController();

  MenuProfileController.instance();

  Future<MenuProfileController> initState(BuildContext context) async {
    var user = await UserStorargeData.getAppUser();

    if (user != null) {
      final viewModel = Provider.of<ProfileModel>(context, listen: false);

      viewModel.changeValues(
        user: user,
        status: ProfileModelStatus.View,
      );
    }

    return this;
  }

  Future<void> userLogout(BuildContext context) async {
    var user = await UserStorargeData.getAppUser();
    var deviceToken = new DeviceTokenDataModal(
      key: await FCMStorageData.getDeviceId(),
      value: await FCMStorageData.getToken(),
      userId: user.id,
      tenantId: 3,
      type: Platform.isIOS ? 'IOS' : 'ANDROID',
      isAllowed: true,
    );

    /// call server to remove deviceId
    // DeviceTokenApiController.delete(deviceToken);

    /// remove store data on your phone
    await FCMStorageData.removeToken();
    await FCMStorageData.removeDeviceId();
    await UserStorargeData.removeAppToken();
    await UserStorargeData.removeAppUser();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainView()),
    );
  }

  void viewProfile(BuildContext context) {
    final viewModel = Provider.of<ProfileModel>(context, listen: false);
    final mainController = Provider.of<MainController>(context, listen: false);
    Navigator.pop(context);
    mainController.changeValues(context, child: ProfileView(viewModel));
  }

  void changeAccount(BuildContext context) {
    final viewModel = Provider.of<ProfileModel>(context, listen: false);
    final mainController = Provider.of<MainController>(context, listen: false);
    Navigator.pop(context);
    mainController.changeValues(context,
        child: AccountLayout(viewModel.user.userName));
  }

  void backToHome(BuildContext context) {
    final mainController = Provider.of<MainController>(context, listen: false);
    Navigator.pop(context);
    mainController.changeValues(context, child: HomeView());
  }

  // void viewUserManual(BuildContext context) async {
  //   final mainModel = Provider.of<MainModel>(context, listen: false);
  //   Navigator.pop(context);
  //   mainModel.changeValues(child: CMSPostView(CMSPostType.UserManual));
  // }
}
