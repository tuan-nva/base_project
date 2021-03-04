import 'package:base_project/components/_bases/base_model.dart';
import 'package:base_project/components/_layouts/app_dialog.dart';
import 'package:base_project/components/_variables/https/app_http_model.dart';
import 'package:base_project/components/_variables/values/text_app_data.dart';
import 'package:base_project/controllers/user/user_api_controller.dart';
import 'package:base_project/models/main/main_model.dart';
import 'package:base_project/models/user/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileController {
  ProfileController();

  ProfileController changeStatus(
    BuildContext context,
    ProfileModelStatus status,
  ) {
    final viewModel = Provider.of<ProfileModel>(context, listen: false);

    viewModel.changeStatus(status);

    return this;
  }

  Future<void> saveProfile(BuildContext context) async {
    final viewModel = Provider.of<ProfileModel>(context, listen: false);
    final statusModel = Provider.of<StatusModel>(context, listen: false);
    statusModel.changeStatus(status: BaseModelStatus.Loading);

    var saveResult = await UserApiController.saveCurrenProfile(
      viewModel.user.toMap(),
    );

    if (saveResult.status == AppHttpModelStatus.Success) {
      this.changeStatus(context, ProfileModelStatus.View);
      statusModel.changeStatus(status: BaseModelStatus.View);

      await AppDialog.showMessage(
        context,
        TextAppData.getValue("actionSuccess"),
        TextAppData.getValue("actionSuccessDetail"),
      );
    } else {
      statusModel.changeStatus(status: BaseModelStatus.View);
      await AppDialog.showMessage(
        context,
        saveResult.message,
        saveResult.details,
      );
    }
  }
}
