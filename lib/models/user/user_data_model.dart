import 'dart:convert';

import 'package:base_project/components/_variables/values/key_value_model.dart';
import 'package:base_project/models/user/tenant_data_modal.dart';

class UserDataModal {
  final int id;
  String userName;
  String fullName;
  String emailAddress;
  String phoneNumber;
  String address;

  int tenantId;
  TenantDataModal tenant;
  List<TenantDataModal> listTenant;

  String name;
  String surname;
  bool isActive;
  bool isEmailConfirmed;
  List<KeyValueModal> listInformation;
  String eduRole;
  String titleFamily;

  UserDataModal(
    this.id,
    this.userName,
    this.fullName, {
    this.name,
    this.surname,
    this.emailAddress,
    this.phoneNumber,
    this.address,
    this.tenantId,
    this.tenant,
    this.listTenant,
    this.listInformation,
    this.eduRole,
    this.titleFamily,
    this.isActive,
    this.isEmailConfirmed,
  });

  factory UserDataModal.fromJson(
    Map<String, dynamic> jsonInput,
  ) {
    UserDataModal user = UserDataModal(
      jsonInput["id"],
      jsonInput["userName"],
      jsonInput["fullName"],
      name: jsonInput["name"],
      surname: jsonInput["surname"],
      emailAddress: jsonInput["emailAddress"] != null
          ? jsonInput["emailAddress"]
          : jsonInput["details"],
      phoneNumber: jsonInput["phoneNumber"],
      tenantId: jsonInput["tenantId"],
      tenant: TenantDataModal.fromJson(jsonInput["tenant"]),
      listTenant: jsonInput["listTenant"] != null
          ? (jsonInput["listTenant"] as Iterable)
              .map((item) => TenantDataModal.fromJson(item))
              .toList()
          : null,
      listInformation: jsonInput["listInformation"] != null
          ? (jsonInput["listInformation"] as Iterable)
              .map((item) => KeyValueModal.fromJson(item))
              .toList()
          : null,
      isActive: jsonInput["isActive"],
      isEmailConfirmed: jsonInput["isEmailConfirmed"],
    );

    if (user.tenant != null &&
        user.tenant.id != null &&
        user.listTenant.length > 0) {
      user.tenant = user.listTenant.firstWhere(
        (tenant) => tenant.id == user.tenant.id,
        orElse: null,
      );
    }

    if (jsonInput["profiles"] != null) {
      List<KeyValueModal> list = (jsonDecode(jsonInput["profiles"]) as Iterable)
          .map((item) => KeyValueModal.fromJson(item))
          .toList();
      var address = list.firstWhere((item) => item.key == "ADDRESS");
      user.address = address != null ? address.value : "";
    } else {
      user.address = "";
    }

    if (jsonInput["listInformation"] != null) {
      List<KeyValueModal> list = (jsonInput["listInformation"] as Iterable)
          .map((item) => KeyValueModal.fromJson(item))
          .toList();

      var type = list.firstWhere((element) => element.key == "Type");
      if (type != null && type.value != null) {
        if (type.value.toUpperCase().indexOf('STUDENT') != -1) {
          user.eduRole = 'STUDENT';
        } else if (type.value.toUpperCase().indexOf('PARENT') != -1) {
          user.eduRole = 'PARENT';
        } else if (type.value.toUpperCase().indexOf('FATHER') != -1) {
          user.eduRole = 'PARENT';
          user.titleFamily = 'Bố';
        } else if (type.value.toUpperCase().indexOf('MOTHER') != -1) {
          user.eduRole = 'PARENT';
          user.titleFamily = 'Mẹ';
        } else {
          user.eduRole = 'TEACHER';
        }
      }
    }

    return user;
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["userName"] = userName;
    map["fullName"] = fullName;

    map["name"] = name;
    map["surname"] = surname;
    map["emailAddress"] = emailAddress;
    map["phoneNumber"] = phoneNumber;
    map["tenantId"] = tenantId;
    map["tenant"] = tenant != null ? tenant.toMap() : null;
    map["listTenant"] = listTenant != null
        ? listTenant.map((tenant) => tenant.toMap()).toList()
        : null;

    map["eduRole"] = eduRole;
    map["titleFamily"] = titleFamily;
    map["isActive"] = isActive;
    map["isEmailConfirmed"] = isEmailConfirmed;
    map["listInformation"] = listInformation.map((e) => e.toMap()).toList();

    List<KeyValueModal> list = [
      KeyValueModal(key: "ADDRESS", value: address != null ? address : "")
    ];

    map["profiles"] = jsonEncode(list.map((item) => item.toMap()).toList());

    return map;
  }
}
