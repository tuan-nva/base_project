import 'dart:convert';
import 'package:base_project/components/_variables/https/app_http_model.dart';
import 'package:base_project/components/_variables/https/sso_app_http.dart';
import 'package:base_project/components/_variables/storages/user_storage_data.dart';
import 'package:base_project/models/user/user_data_model.dart';
import 'package:base_project/models/main/login_model.dart';
import 'package:base_project/models/main/token_model.dart';

class UserApiController {
  UserApiController();

  static Future<AppHttpModel<TokenModel>> userLogin(
    LoginModel data,
  ) async {
    final response = await SSOAppHttp.getData(
      'api/TokenAuth/Authenticate',
      data.toMap(),
      null,
    );

    if (response.statusCode == 200) {
      return AppHttpModel<TokenModel>(
        TokenModel.fromJson(
          json.decode(response.body)["result"],
        ),
      );
    } else {
      return AppHttpModel.getError<TokenModel>(response.body);
    }
  }

  static Future<AppHttpModel<UserDataModal>> getCurrentUser() async {
    final response = await SSOAppHttp.getData(
      'api/services/sso/read/User/GetCurrentUser',
      null,
      await UserStorargeData.getAppToken(),
    );

    if (response.statusCode == 200) {
      return AppHttpModel<UserDataModal>(
        UserDataModal.fromJson(
          json.decode(response.body)["result"],
        ),
      );
    } else {
      return AppHttpModel.getError<UserDataModal>(response.body);
    }
  }

  static Future<AppHttpModel<bool>> saveCurrenProfile(Map input) async {
    final response = await SSOAppHttp.getData(
      'api/services/sso/write/User/UpdateInfo',
      input,
      await UserStorargeData.getAppToken(),
    );

    if (response.statusCode == 200) {
      return AppHttpModel<bool>(
        true,
      );
    } else {
      return AppHttpModel.getError<bool>(response.body);
    }
  }

  static Future<AppHttpModel<bool>> changeAccount(Map input) async {
    final response = await SSOAppHttp.getData(
      'api/services/sso/write/User/ChangeAccount',
      input,
      await UserStorargeData.getAppToken(),
    );

    if (response.statusCode == 200) {
      return AppHttpModel<bool>(
        true,
      );
    } else {
      return AppHttpModel.getError<bool>(response.body);
    }
  }

  static Future<AppHttpModel<List<UserDataModal>>> getByListUserId(
    List<int> listUserId,
  ) async {
    final response = await SSOAppHttp.getData(
        'api/services/sso/read/User/GetByListUserId',
        listUserId,
        await UserStorargeData.getAppToken());

    var content = json.decode(response.body);

    if (response.statusCode == 200) {
      List<UserDataModal> items = (content['result'] as Iterable)
          .map((e) => UserDataModal.fromJson(e))
          .toList();

      return AppHttpModel<List<UserDataModal>>(items);
    } else {
      return AppHttpModel.getError<List<UserDataModal>>(response.body);
    }
  }
}
