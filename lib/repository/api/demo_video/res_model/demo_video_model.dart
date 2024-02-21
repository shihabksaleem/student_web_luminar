// To parse this JSON data, do
//
//     final demovideoModel = demovideoModelFromJson(jsonString);

import 'dart:convert';

DemovideoModel demovideoModelFromJson(String str) => DemovideoModel.fromJson(json.decode(str));

String demovideoModelToJson(DemovideoModel data) => json.encode(data.toJson());

class DemovideoModel {
    String status;
    List<DemoVideos> courses;
    int totalResults;

    DemovideoModel({
        required this.status,
        required this.courses,
        required this.totalResults,
    });

    factory DemovideoModel.fromJson(Map<String, dynamic> json) => DemovideoModel(
        status: json["status"],
        courses: List<DemoVideos>.from(json["courses"].map((x) => DemoVideos.fromJson(x))),
        totalResults: json["totalResults"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
        "totalResults": totalResults,
    };
}

class DemoVideos {
    String id;
    String courseName;
    String description;
    DateTime date;
    String link;
    String? thumbnail;

    DemoVideos({
        required this.id,
        required this.courseName,
        required this.description,
        required this.date,
        required this.link,
        this.thumbnail,
    });

    factory DemoVideos.fromJson(Map<String, dynamic> json) => DemoVideos(
        id: json["id"],
        courseName: json["course_name"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        link: json["link"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "course_name": courseName,
        "description": description,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "link": link,
        "thumbnail": thumbnail,
    };
}
