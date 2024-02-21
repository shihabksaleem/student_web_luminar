// To parse this JSON data, do
//
//     final liveClassResModel = liveClassResModelFromJson(jsonString);

import 'dart:convert';

LiveClassResModel liveClassResModelFromJson(String str) =>
    LiveClassResModel.fromJson(json.decode(str));

String liveClassResModelToJson(LiveClassResModel data) =>
    json.encode(data.toJson());

class LiveClassResModel {
  int? status;
  List<LiveClassData>? liveClassDataList;

  LiveClassResModel({
    this.status,
    this.liveClassDataList,
  });

  factory LiveClassResModel.fromJson(Map<String, dynamic> json) =>
      LiveClassResModel(
        status: json["status"],
        liveClassDataList: json["data"] == null
            ? []
            : List<LiveClassData>.from(
                json["data"]!.map((x) => LiveClassData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": liveClassDataList == null
            ? []
            : List<dynamic>.from(liveClassDataList!.map((x) => x.toJson())),
      };
}

class LiveClassData {
  int? id;
  String? className;
  String? trainerName;
  String? time;
  bool? status;
  String? urlLink;
  int? batch;

  LiveClassData({
    this.id,
    this.className,
    this.trainerName,
    this.time,
    this.status,
    this.urlLink,
    this.batch,
  });

  factory LiveClassData.fromJson(Map<String, dynamic> json) => LiveClassData(
        id: json["id"],
        className: json["class_name"],
        trainerName: json["trainer_name"],
        time: json["time"],
        status: json["status"],
        urlLink: json["url_link"],
        batch: json["batch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "class_name": className,
        "trainer_name": trainerName,
        "time": time,
        "status": status,
        "url_link": urlLink,
        "batch": batch,
      };
}
