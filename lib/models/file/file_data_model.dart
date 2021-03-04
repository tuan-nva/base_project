class FileEduDataModal {
  String group;
  int tenantId;
  String name;
  String type;
  String data;
  String fileUrl;
  String id;

  FileEduDataModal({
    this.name,
    this.tenantId,
    this.type,
    this.data,
    this.fileUrl,
    this.group,
    this.id,
  });

  factory FileEduDataModal.fromJson(Map<String, dynamic> jsonInput) {
    if (jsonInput == null) return null;
    return FileEduDataModal(
      name: jsonInput["name"],
      type: jsonInput["type"],
      tenantId: jsonInput["tenantId"],
      data: jsonInput["data"],
      fileUrl: jsonInput["fileUrl"],
      group: jsonInput["group"],
      id: jsonInput["id"],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();

    map["name"] = name;
    map["type"] = type;
    map["tenantId"] = tenantId;
    map["data"] = data;
    map["fileUrl"] = fileUrl;
    map["group"] = group;
    map["id"] = id;

    return map;
  }
}

class FileDataModal {
  int tenantId;
  String name;
  String type;
  String data;
  String fileUrl;
  String id;

  FileDataModal({
    this.name,
    this.tenantId,
    this.type,
    this.data,
    this.fileUrl,
    this.id,
  });

  factory FileDataModal.fromJson(Map<String, dynamic> jsonInput) {
    if (jsonInput == null) return null;
    return FileDataModal(
      name: jsonInput["name"],
      type: jsonInput["type"],
      tenantId: jsonInput["tenantId"],
      data: jsonInput["data"],
      fileUrl: jsonInput["fileUrl"],
      id: jsonInput["id"],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();

    map["name"] = name;
    map["type"] = type;
    map["tenantId"] = tenantId;
    map["data"] = data;
    map["fileUrl"] = fileUrl;
    map["id"] = id;

    return map;
  }
}
