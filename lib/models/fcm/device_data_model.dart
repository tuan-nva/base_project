class DeviceTokenDataModal {
  /// DeviceId
  String key;

  /// ClientTokens
  String value;

  String type;
  int userId;
  int tenantId;
  bool isAllowed = true;

  DeviceTokenDataModal({
    this.key,
    this.value,
    this.type,
    this.userId,
    this.tenantId,
    this.isAllowed,
  });

  DeviceTokenDataModal.fromJson(Map<String, dynamic> jsonInput)
      : assert(jsonInput['userId' != null], "'userId' cannot be null."),
        assert(jsonInput['key' != null], "'key' cannot be null."),
        assert(jsonInput['value' != null], "'value' cannot be null."),
        key = jsonInput['key'],
        value = jsonInput['value'],
        type = jsonInput['type'],
        userId = jsonInput['userId'],
        tenantId = jsonInput['tenantId'],
        isAllowed =
            jsonInput['isAllowed'] != null ? jsonInput['isAllowed'] : true;

  Map toMap() {
    var map = new Map<String, dynamic>();

    map['key'] = key;
    map['value'] = value;
    map['type'] = type;
    map['userId'] = userId;
    map['tenantId'] = tenantId;
    map['isAllowed'] = isAllowed;

    return map;
  }
}

class NotifyDeciverDataModal {
  String title;
  String body;
  String imageUrl;
  String nameConfig;

  NotifyDeciverDataModal({
    this.title,
    this.body,
    this.imageUrl,
    this.nameConfig,
  });
  factory NotifyDeciverDataModal.fromJson(Map<String, dynamic> jsonInput) {
    if (jsonInput == null) return null;
    return NotifyDeciverDataModal(
      body: jsonInput['body'],
      title: jsonInput['title'],
      imageUrl: jsonInput['imageUrl'],
      nameConfig: jsonInput['nameConfig'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();

    map['title'] = title;
    map['body'] = body;
    map['imageUrl'] = imageUrl;
    map['nameConfig'] = nameConfig;

    return map;
  }
}
