class DemoVideoListRestModel {
  int? status;
  List<DemoVideoData>? demoVideoList;

  DemoVideoListRestModel({
    this.status,
    this.demoVideoList,
  });

  factory DemoVideoListRestModel.fromJson(Map<String, dynamic> json) => DemoVideoListRestModel(
        status: json["status"],
        demoVideoList:
            json["data"] == null ? [] : List<DemoVideoData>.from(json["data"]!.map((x) => DemoVideoData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": demoVideoList == null ? [] : List<dynamic>.from(demoVideoList!.map((x) => x.toJson())),
      };
}

class DemoVideoData {
  String? tittle;
  String? url;
  String? description;

  DemoVideoData({
    this.tittle,
    this.url,
    this.description,
  });

  factory DemoVideoData.fromJson(Map<String, dynamic> json) => DemoVideoData(
        tittle: json["tittle"],
        url: json["url"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "tittle": tittle,
        "url": url,
        "description": description,
      };
}
