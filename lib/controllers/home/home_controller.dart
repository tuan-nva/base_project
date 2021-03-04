import 'package:base_project/components/_bases/base_controller.dart';
import 'package:base_project/components/_bases/base_model.dart';
import 'package:base_project/components/_layouts/app_dialog.dart';
import 'package:base_project/components/_variables/https/app_http_model.dart';
import 'package:base_project/components/_variables/storages/fcm_storage_data.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';
import 'package:base_project/components/services/signalr_service.dart';
import 'package:base_project/controllers/user/user_api_controller.dart';
import 'package:base_project/components/_variables/storages/user_storage_data.dart';
import 'package:base_project/models/fcm/device_data_model.dart';
import 'package:base_project/models/home/home_model.dart';
import 'package:base_project/models/main/main_model.dart';
import 'package:base_project/views/bases/back_main_layout.dart';
import 'package:base_project/views/home/layouts/blank_layout.dart';
import 'package:base_project/views/bases/menu/layouts/drawer_menu_layout.dart';
import 'package:base_project/views/home/layouts/init_browser_layout.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

class HomeController extends BaseController<HomeModel> {
  HomeController();

  HomeController.instance();

  Future<HomeController> initState(BuildContext context) async {
    var userResult = await UserApiController.getCurrentUser();
    var deviceToken = new DeviceTokenDataModal();

    final mainModel = Provider.of<MainModel>(context, listen: false);
    final statusModel = Provider.of<StatusModel>(context, listen: false);
    final drawerModel = Provider.of<DrawerModel>(context, listen: false);
    final titleModel = Provider.of<TitleModel>(context, listen: false);
    final viewModel = Provider.of<HomeModel>(context, listen: false);

    titleModel.title = TextAppData.getValue("title");
    statusModel.changeStatus(status: BaseModelStatus.Loading);

    if (userResult.status != AppHttpModelStatus.Success) {
      await UserStorargeData.removeAppToken();

      statusModel.changeStatus(status: BaseModelStatus.View);
      await AppDialog.showMessage(
        context,
        userResult.message,
        userResult.details,
      );

      this.showError(context, child: BackMainLayout());
    } else {
      /// get fcm token
      await FirebaseMessaging().getToken().then((String token) async => {
            await FCMStorageData.setToken(token),
            deviceToken
              ..value = token
              ..userId = userResult.value.id
              ..key = await FCMStorageData.getDeviceId()
              ..tenantId = 3
              ..type = Platform.isIOS ? 'IOS' : 'ANDROID'
              ..isAllowed = true,
          });

      /// send token to server
      // DeviceTokenApiController.createOrUpdate(deviceToken);

      await UserStorargeData.setAppUser(userResult.value);
      await UserStorargeData.getEncrptedAuthToken().then(
        (value) => SignalrService().openChatConnection(value),
      );

      if (userResult.value.eduRole == 'TEACHER') {
        var accessToken = await UserStorargeData.getAppAccessToken();
        viewModel.changeValues(child: InitBrowserLayout(accessToken));
      } else {
        mainModel.changeValues(
          child: BlankLayout(),
          drawer: DrawerMenuLayout(),
        );
        statusModel.changeStatus(status: BaseModelStatus.View);
      }
    }
    drawerModel.changeValues(drawer: DrawerMenuLayout());

    return this;
  }

  bool _finishInitBrowser = false;
  HomeController finishedInit(BuildContext context) {
    if (_finishInitBrowser == false) {
      final mainModel = Provider.of<MainModel>(context, listen: false);
      final statusModel = Provider.of<StatusModel>(context, listen: false);

      mainModel.changeValues(
        // child: CMSPostView(CMSPostType.Notify),
        title: "CMSPostView_Notify",
      );

      statusModel.changeStatus(status: BaseModelStatus.View);

      _finishInitBrowser = true;
    }
    return this;
  }

  @override
  HomeController changeValues(
    BuildContext context, {
    BaseModelStatus status,
    Widget child,
    String title,
    String message,
    Widget drawer,
  }) {
    final viewModel = Provider.of<HomeModel>(context, listen: false);

    viewModel.changeValues(
        status: status,
        child: child,
        title: title,
        message: message,
        drawer: drawer);

    return this;
  }
}
