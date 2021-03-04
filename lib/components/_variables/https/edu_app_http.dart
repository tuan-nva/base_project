import 'package:http/http.dart';
import 'package:base_project/components/_variables/values/app_const.dart';
import 'package:base_project/components/_variables/https/app_http.dart';

class EduMobileAppHttp extends AppHttp {
  static String eduUrl(String url) {
    return "http://ql.edu.ilearn.net.vn/" + url;
  }

  static Future<Response> getData(
    String url,
    dynamic data,
    String token, {
    String sort,
  }) {
    return AppHttp.getData(apiEDU + url, data, token, sort: sort);
  }
}
