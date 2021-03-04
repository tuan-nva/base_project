class LoginModel {
  String userName;
  String password;

  LoginModel();

  LoginModel.instance();

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["userNameOrEmailAddress"] = userName != null? userName.trim() : "";
    map["password"] = password != null? password.trim() : "";

    return map;
  }
}
