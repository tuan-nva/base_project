class EntityDataModal {
  String id;

  EntityDataModal({this.id});

  factory EntityDataModal.fromJson(Map<String, dynamic> jsonInput) {
    return EntityDataModal(id: jsonInput["id"]);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    return map;
  }
}

class GetDtoOfGuidDataModal {
  int tenantId;
  int userId;
  String id;
  String language;
  String option;
  String search;
  String status;
  DateTime from;
  DateTime to;
  List<String> sValue;
  List<int> lValue;
  List<String> gValue;
  List<double> dValue;
  List<String> tValue;
  List<CriteriaDataModal> criterias;
  String sorting;
  int skipCount;
  int maxResultCount;

  GetDtoOfGuidDataModal(
      {this.id,
      this.tenantId,
      this.userId,
      this.language,
      this.option,
      this.search,
      this.status,
      this.from,
      this.to,
      this.sValue,
      this.lValue,
      this.gValue,
      this.dValue,
      this.tValue,
      this.criterias,
      this.sorting,
      this.skipCount,
      this.maxResultCount});

  factory GetDtoOfGuidDataModal.fromJson(Map<String, dynamic> jsonInput) {
    return GetDtoOfGuidDataModal(
      id: jsonInput["id"],
      tenantId: jsonInput["tenantId"],
      userId: jsonInput["userId"],
      option: jsonInput["option"],
      language: jsonInput["language"],
      search: jsonInput["search"],
      status: jsonInput["status"],
      from: DateTime.parse(jsonInput["from"]),
      to: DateTime.parse(jsonInput["to"]),
      sValue: jsonInput["sValue"],
      lValue: jsonInput["lValue"],
      gValue: jsonInput["gValue"],
      dValue: jsonInput["dValue"],
      tValue: jsonInput["tValue"],
      criterias: (jsonInput["criterias"] as Iterable)
          .map((item) => CriteriaDataModal.fromJson(item))
          .toList(),
      sorting: jsonInput["sorting"],
      skipCount: jsonInput["skipCount"],
      maxResultCount: jsonInput["maxResultCount"],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) map["id"] = id;
    if (tenantId != null) map["tenantId"] = tenantId;
    if (userId != null) map["userId"] = userId;
    if (language != null) map["language"] = language;
    if (option != null) map["option"] = option;
    if (search != null) map["search"] = search;
    if (status != null) map["status"] = status;
    if (from != null) map["from"] = from.toString();
    if (to != null) map["to"] = to.toString();
    if (sValue != null) map["sValue"] = sValue;
    if (lValue != null) map["lValue"] = lValue;
    if (gValue != null) map["gValue"] = gValue;
    if (dValue != null) map["dValue"] = dValue;
    if (tValue != null) map["tValue"] = tValue;
    if (criterias != null)
      map["criterias"] = criterias.map((e) => e.toMap()).toList();
    if (sorting != null) map["sorting"] = sorting;
    if (skipCount != null) map["skipCount"] = skipCount;
    if (maxResultCount != null) map["maxResultCount"] = maxResultCount;
    return map;
  }
}

class CriteriaDataModal {
  String propertyName;
  dynamic operation;
  dynamic value;

  CriteriaDataModal({this.propertyName, this.operation, this.value});

  factory CriteriaDataModal.fromJson(Map<String, dynamic> jsonInput) {
    return CriteriaDataModal(
      propertyName: jsonInput["propertyName"],
      operation: jsonInput["operation"],
      value: jsonInput["value"],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["propertyName"] = propertyName;
    map["operation"] = operation;
    map["value"] = value;

    return map;
  }
}
