import 'package:base_project/components/_variables/storages/sso_storage_data.dart';
import 'package:base_project/models/user/user_data_model.dart';

class UserStorargeData {
  UserStorargeData();

  static Future<UserDataModal> getAppUser() async {
    Map jsonUser = await SSOStorageData.getUser();
    if (jsonUser != null) {
      return UserDataModal.fromJson(
        jsonUser,
      );
    }
    return null;
  }

  static Future<void> setAppUser(UserDataModal user) {
    return SSOStorageData.setUser(user.toMap());
  }

  static Future<void> removeAppUser() {
    return SSOStorageData.removeUser();
  }

  static Future<String> getAppToken() {
    return SSOStorageData.getToken();
  }

  static Future<String> getAppAccessToken() {
    return SSOStorageData.getAccessToken();
  }

  static Future<void> setAppToken(String token) {
    return SSOStorageData.setToken(token);
  }

  static Future<void> removeAppToken() {
    return SSOStorageData.removeToken();
  }

  static Future<String> getEncrptedAuthToken() {
    return SSOStorageData.getEncrptedAuthToken();
  }

  static Future<void> setEncrptedAuthToken(String encrptedAuthtoken) {
    return SSOStorageData.setEncrptedAuthToken(encrptedAuthtoken);
  }

  static Future<void> removeEncrptedAuthToken() {
    return SSOStorageData.removeEncrptedAuthToken();
  }
}
