class GetFirebaseConfigDataModal {
  int tenantId;
  String key;

  GetFirebaseConfigDataModal({
    this.tenantId,
    this.key,
  });

  GetFirebaseConfigDataModal.fromJson(Map<String, dynamic> jsonInput)
      : tenantId = jsonInput['tenantId'],
        key = jsonInput['key'];

  Map toMap() {
    var map = new Map<String, dynamic>();

    map['key'] = key;
    map['tenantId'] = tenantId;

    return map;
  }
}

class FirebaseConfigDataModal {
  int tenantId;
  String key;
  String value;
  String type;
  String config;
  String configWeb;
  String configAndroid;
  String configIos;
  DateTime creationTime;
  int creatorUserId;
  String id;

  FirebaseConfigDataModal({
    this.tenantId,
    this.key,
    this.value,
    this.type,
    this.config,
    this.configAndroid,
    this.configIos,
    this.configWeb,
    this.creationTime,
    this.creatorUserId,
    this.id,
  });

  factory FirebaseConfigDataModal.fromJson(Map<String, dynamic> jsonInput) {
    if (jsonInput == null) return null;
    return FirebaseConfigDataModal(
      tenantId: jsonInput['tenantId'],
      key: jsonInput['key'],
      value: jsonInput['value'],
      type: jsonInput['type'],
      config: jsonInput['config'],
      configAndroid: jsonInput['configAndroid'],
      configIos: jsonInput['configIos'],
      configWeb: jsonInput['configWeb'],
      creationTime: DateTime.parse(jsonInput["creationTime"]),
      creatorUserId: jsonInput['creatorUserId'],
      id: jsonInput['id'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();

    map['tenantId'] = tenantId;
    map['key'] = key;
    map['value'] = value;
    map['type'] = type;
    map['config'] = config;
    map['configAndroid'] = configAndroid;
    map['configIos'] = configIos;
    map['configWeb'] = configWeb;
    map['creationTime'] = creationTime.toString();
    map['creatorUserId'] = creatorUserId;
    map['id'] = id;

    return map;
  }
}
