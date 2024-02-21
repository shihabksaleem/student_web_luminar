// To parse this JSON data, do
//
//     final courseDetailsScreenResData = courseDetailsScreenResDataFromJson(jsonString);

import 'dart:convert';

CourseDetailsScreenResData courseDetailsScreenResDataFromJson(String str) =>
    CourseDetailsScreenResData.fromJson(json.decode(str));

String courseDetailsScreenResDataToJson(CourseDetailsScreenResData data) => json.encode(data.toJson());

class CourseDetailsScreenResData {
  int? id;
  String? title;
  String? description;
  String? duration;
  String? oneTimeFees;
  String? emiFees;
  String? thumbnail;
  String? fullName;
  dynamic cochinDate;
  dynamic calicutDate;
  bool? isActive;
  String? onlineActive;
  String? offlineActive;
  List<Module>? modules;

  CourseDetailsScreenResData({
    this.id,
    this.title,
    this.description,
    this.duration,
    this.oneTimeFees,
    this.emiFees,
    this.thumbnail,
    this.fullName,
    this.cochinDate,
    this.calicutDate,
    this.isActive,
    this.onlineActive,
    this.offlineActive,
    this.modules,
  });

  factory CourseDetailsScreenResData.fromJson(Map<String, dynamic> json) => CourseDetailsScreenResData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"].toString(),
        oneTimeFees: json["one_time_fees"],
        emiFees: json["emi_fees"],
        thumbnail: json["thumbnail"],
        fullName: json["full_name"],
        cochinDate: json["cochin_date"],
        calicutDate: json["calicut_date"],
        isActive: json["is_active"],
        onlineActive: json["online_active"],
        offlineActive: json["offline_active"],
        modules: json["modules"] == null ? [] : List<Module>.from(json["modules"]!.map((x) => Module.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "duration": duration,
        "one_time_fees": oneTimeFees,
        "emi_fees": emiFees,
        "thumbnail": thumbnail,
        "full_name": fullName,
        "cochin_date": cochinDate,
        "calicut_date": calicutDate,
        "is_active": isActive,
        "online_active": onlineActive,
        "offline_active": offlineActive,
        "modules": modules == null ? [] : List<dynamic>.from(modules!.map((x) => x.toJson())),
      };
}

class Module {
  int? id;
  String? modNo;
  String? modHeading;
  String? modDescription;
  int? course;

  Module({
    this.id,
    this.modNo,
    this.modHeading,
    this.modDescription,
    this.course,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json["id"],
        modNo: json["mod_no"],
        modHeading: json["mod_heading"],
        modDescription: json["mod_description"],
        course: json["course"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mod_no": modNo,
        "mod_heading": modHeading,
        "mod_description": modDescription,
        "course": course,
      };
}
