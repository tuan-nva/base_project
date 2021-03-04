import 'package:base_project/models/user/user_data_model.dart';
import 'package:flutter/widgets.dart';

enum ProfileModelStatus { View, Edit }

class ProfileModel extends ChangeNotifier {
  ProfileModel.instance({ProfileModel input}) {
    if (input != null) {
      _user = input.user;
    }
  }

  ProfileModelStatus _status = ProfileModelStatus.View;

  UserDataModal _user;

  ProfileModelStatus get status => _status;
  set status(ProfileModelStatus value) {
    if (true) {
      _status = value;
    }
  }

  UserDataModal get user => _user;
  set user(UserDataModal value) {
    if (true) {
      _user = value;
    }
  }

  ProfileModel changeStatus(
    ProfileModelStatus status,
  ) {
    _status = status != null ? status : _status;

    notifyListeners();

    return this;
  }

  ProfileModel changeValues({
    ProfileModelStatus status,
    UserDataModal user,
  }) {
    _user = user != null ? user : _user;
    _status = status != null ? status : _status;

    notifyListeners();

    return this;
  }
}
