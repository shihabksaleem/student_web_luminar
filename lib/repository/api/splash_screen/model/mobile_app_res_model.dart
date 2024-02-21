class MobileVersionResModel {
  int? status;
  MobileVersionData? mobileVersionData;

  MobileVersionResModel({
    this.status,
    this.mobileVersionData,
  });

  factory MobileVersionResModel.fromJson(Map<String, dynamic> json) => MobileVersionResModel(
        status: json["status"],
        mobileVersionData: json["data"] == null ? null : MobileVersionData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": mobileVersionData?.toJson(),
      };
}

class MobileVersionData {
  String? version;
  String? buildNum;
  String? newVersion;

  MobileVersionData({
    this.version,
    this.buildNum,
    this.newVersion,
  });

  factory MobileVersionData.fromJson(Map<String, dynamic> json) => MobileVersionData(
        version: json["version"],
        buildNum: json["build_num"],
        newVersion: json["new_version"],
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "build_num": buildNum,
        "new_version": newVersion,
      };
}
