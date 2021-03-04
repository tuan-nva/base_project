class TenantDataModal {
  final int id;
  final String name;
  final String tenancyName;
  final String status;
  final bool isActive;

  TenantDataModal(
    this.id,
    this.name,
    this.tenancyName,
    this.status,
    this.isActive,
  );

  factory TenantDataModal.fromJson(
    Map<String, dynamic> jsonInput,
  ) {
    if (jsonInput == null) {
      return null;
    }

    return TenantDataModal(
      jsonInput["id"],
      jsonInput["name"],
      jsonInput["tenancyName"],
      jsonInput["status"],
      jsonInput["isActive"],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();

    map["id"] = id;
    map["name"] = name;
    map["tenancyName"] = tenancyName;
    map["status"] = status;
    map["isActive"] = isActive;

    return map;
  }
}
