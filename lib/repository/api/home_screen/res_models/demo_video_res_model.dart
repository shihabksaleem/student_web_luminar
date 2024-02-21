// To parse this JSON data, do
//
//     final demoCourseResModel = demoCourseResModelFromJson(jsonString);

import 'dart:convert';

DemoCourseResModel demoCourseResModelFromJson(String str) => DemoCourseResModel.fromJson(json.decode(str));

String demoCourseResModelToJson(DemoCourseResModel data) => json.encode(data.toJson());

class DemoCourseResModel {
  int? status;
  List<DemoCourse>? demoCourses;

  DemoCourseResModel({
    this.status,
    this.demoCourses,
  });

  factory DemoCourseResModel.fromJson(Map<String, dynamic> json) => DemoCourseResModel(
        status: json["status"],
        demoCourses:
            json["courses"] == null ? [] : List<DemoCourse>.from(json["courses"]!.map((x) => DemoCourse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "courses": demoCourses == null ? [] : List<dynamic>.from(demoCourses!.map((x) => x.toJson())),
      };
}

class DemoCourse {
  int? id;
  String? title;
  String? description;
  String? duration;
  String? offlineFees;
  String? onlineFees;
  String? thumbnail;
  String? fullName;
  String? cochinDate;
  String? calicutDate;
  bool? isActive;
  String? onlineActive;
  String? offlineActive;
  List<dynamic>? modules;
  List<DemoClass>? demoClasses;

  DemoCourse({
    this.id,
    this.title,
    this.description,
    this.duration,
    this.offlineFees,
    this.onlineFees,
    this.thumbnail,
    this.fullName,
    this.cochinDate,
    this.calicutDate,
    this.isActive,
    this.onlineActive,
    this.offlineActive,
    this.modules,
    this.demoClasses,
  });

  factory DemoCourse.fromJson(Map<String, dynamic> json) => DemoCourse(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"].toString(),
        offlineFees: json["offline_fees"],
        onlineFees: json["online_fees"],
        thumbnail: json["thumbnail"],
        fullName: json["full_name"],
        cochinDate: json["cochin_date"],
        calicutDate: json["calicut_date"],
        isActive: json["is_active"],
        onlineActive: json["online_active"],
        offlineActive: json["offline_active"],
        modules: json["modules"] == null ? [] : List<dynamic>.from(json["modules"]!.map((x) => x)),
        demoClasses: json["demo_classes"] == null
            ? []
            : List<DemoClass>.from(json["demo_classes"]!.map((x) => DemoClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "duration": duration,
        "offline_fees": offlineFees,
        "online_fees": onlineFees,
        "thumbnail": thumbnail,
        "full_name": fullName,
        "cochin_date": cochinDate,
        "calicut_date": calicutDate,
        "is_active": isActive,
        "online_active": onlineActive,
        "offline_active": offlineActive,
        "modules": modules == null ? [] : List<dynamic>.from(modules!.map((x) => x)),
        "demo_classes": demoClasses == null ? [] : List<dynamic>.from(demoClasses!.map((x) => x.toJson())),
      };
}

class DemoClass {
  String? tittle;
  String? url;

  DemoClass({
    this.tittle,
    this.url,
  });

  factory DemoClass.fromJson(Map<String, dynamic> json) => DemoClass(
        tittle: json["tittle"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "tittle": tittle,
        "url": url,
      };
}
