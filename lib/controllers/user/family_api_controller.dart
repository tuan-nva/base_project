// import 'package:ql_edunet/components/_variables/https/sso_app_http.dart';
// import 'package:ql_edunet/components/_variables/https/app_http_model.dart';
// import 'package:ql_edunet/models/user/family_data_model.dart';
// import 'package:ql_edunet/components/user/components/user_data_component.dart';
// import 'dart:convert';

// class FamilyApiController {
//   FamilyApiController();

//   Future<AppHttpModel<List<FamilyDataModal>>> getByUserId(int userId) async {
//     final response = await SSOAppHttp.getData(
//         '/api/services/EDU/read/Family/GetByUserId',
//         userId,
//         await UserDataComponent().getAppToken());

//     var content = json.decode(response.body);

//     if (response.statusCode == 200) {
//       List<FamilyDataModal> items = (content['result'] as Iterable)
//           .map((e) => FamilyDataModal.fromJson(e))
//           .toList();

//       return AppHttpModel<List<FamilyDataModal>>(items);
//     } else {
//       return AppHttpModel.getError<List<FamilyDataModal>>(response.body);
//     }
//   }
// }
