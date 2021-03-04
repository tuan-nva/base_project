import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AppHttp {
  static Future<Response> getData(
    String url,
    dynamic data,
    String token, {
    String sort,
  }) {
    return http.post(
      url,
      body: json.encode(
        data == null
            ? sort == null
                ? {"skipCount": 0, "maxResultCount": 9999}
                : {"skipCount": 0, "maxResultCount": 9999, "sorting": sort}
            : data,
      ),
      headers: _getHeader(token),
    );
  }

  static dynamic _getHeader(String token) {
    if (token != null) {
      return {"Content-Type": "application/json", "Authorization": token};
    }
    return {"Content-Type": "application/json"};
  }
}