class KeyValueModal {
  String key;
  String value;

  KeyValueModal({
    this.key,
    this.value,
  });

  factory KeyValueModal.fromJson(
    Map<String, dynamic> jsonInput,
  ) {
    if (jsonInput == null) {
      return null;
    }

    return KeyValueModal(
      key: jsonInput["key"],
      value: jsonInput["value"],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["key"] = key;
    map["value"] = value;

    return map;
  }
}
