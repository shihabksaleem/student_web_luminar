// To parse this JSON data, do
//
//     final announcementScreenModel = announcementScreenModelFromJson(jsonString);

import 'dart:convert';

AnnouncementScreenModel announcementScreenModelFromJson(String str) =>
    AnnouncementScreenModel.fromJson(json.decode(str));

String announcementScreenModelToJson(AnnouncementScreenModel data) =>
    json.encode(data.toJson());

class AnnouncementScreenModel {
  String status;
  List<AnnouncementData> data;
  int totalResults;

  AnnouncementScreenModel({
    required this.status,
    required this.data,
    required this.totalResults,
  });

  factory AnnouncementScreenModel.fromJson(Map<String, dynamic> json) =>
      AnnouncementScreenModel(
        status: json["status"],
        data: List<AnnouncementData>.from(
            json["data"].map((x) => AnnouncementData.fromJson(x))),
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "totalResults": totalResults,
      };
}

class AnnouncementData {
  String id;
  String title;
  String description;
  DateTime date;

  AnnouncementData({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  factory AnnouncementData.fromJson(Map<String, dynamic> json) =>
      AnnouncementData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
