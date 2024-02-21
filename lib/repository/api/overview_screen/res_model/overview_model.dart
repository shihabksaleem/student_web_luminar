// To parse this JSON data, do
//
//     final overviewResModel = overviewResModelFromJson(jsonString);

import 'dart:convert';

OverviewResModel overviewResModelFromJson(String str) => OverviewResModel.fromJson(json.decode(str));

String overviewResModelToJson(OverviewResModel data) => json.encode(data.toJson());

class OverviewResModel {
  String? batchName;
  int? course;
  String? startdate;
  String? time;
  bool? isActive;
  List<int>? students;
  List<String>? modules;

  OverviewResModel({
    this.batchName,
    this.course,
    this.startdate,
    this.time,
    this.isActive,
    this.students,
    this.modules,
  });

  factory OverviewResModel.fromJson(Map<String, dynamic> json) => OverviewResModel(
        batchName: json["batch_name"],
        course: json["course"],
        startdate: json["startdate"],
        time: json["time"],
        isActive: json["is_active"],
        students: json["students"] == null ? [] : List<int>.from(json["students"]!.map((x) => x)),
        modules: json["modules"] == null ? [] : List<String>.from(json["modules"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "batch_name": batchName,
        "course": course,
        "startdate": startdate,
        "time": time,
        "is_active": isActive,
        "students": students == null ? [] : List<dynamic>.from(students!.map((x) => x)),
        "modules": modules == null ? [] : List<dynamic>.from(modules!.map((x) => x)),
      };
}
