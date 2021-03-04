import 'package:http/http.dart';
import 'package:base_project/components/_variables/https/app_http.dart';
import 'package:base_project/components/_variables/values/app_const.dart';

class SSOAppHttp extends AppHttp {
  static Future<Response> getData(
    String url,
    dynamic data,
    String token, {
    String sort,
  }) {
    return AppHttp.getData(apiSSO + url, data, token, sort: sort);
  }
}
