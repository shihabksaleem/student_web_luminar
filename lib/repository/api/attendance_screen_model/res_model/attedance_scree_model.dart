// To parse this JSON data, do
//
//     final attandanceOverviewModel = attandanceOverviewModelFromJson(jsonString);

import 'dart:convert';

AttandanceOverviewModel attandanceOverviewModelFromJson(String str) =>
    AttandanceOverviewModel.fromJson(json.decode(str));

String attandanceOverviewModelToJson(AttandanceOverviewModel data) =>
    json.encode(data.toJson());

class AttandanceOverviewModel {
  int? status;
  Data? data;

  AttandanceOverviewModel({
    this.status,
    this.data,
  });

  factory AttandanceOverviewModel.fromJson(Map<String, dynamic> json) =>
      AttandanceOverviewModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  int? presentCount;
  int? absentCount;
  int? onlineCount;
  int? totalAttendance;

  Data({
    this.presentCount,
    this.absentCount,
    this.onlineCount,
    this.totalAttendance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        presentCount: json["present_count"],
        absentCount: json["absent_count"],
        onlineCount: json["online_count"],
        totalAttendance: json["total_attendance"],
      );

  Map<String, dynamic> toJson() => {
        "present_count": presentCount,
        "absent_count": absentCount,
        "online_count": onlineCount,
        "total_attendance": totalAttendance,
      };
}
