// To parse this JSON data, do
//
//     final batchesListResModel = batchesListResModelFromJson(jsonString);

import 'dart:convert';

BatchesListResModel batchesListResModelFromJson(String str) =>
    BatchesListResModel.fromJson(json.decode(str));

String batchesListResModelToJson(BatchesListResModel data) =>
    json.encode(data.toJson());

class BatchesListResModel {
  int? status;
  List<BatchData>? batchesList;
  int? totalResults;

  BatchesListResModel({
    this.status,
    this.batchesList,
    this.totalResults,
  });

  factory BatchesListResModel.fromJson(Map<String, dynamic> json) =>
      BatchesListResModel(
        status: json["status"],
        batchesList: json["data"] == null
            ? []
            : List<BatchData>.from(
                json["data"]!.map((x) => BatchData.fromJson(x))),
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": batchesList == null
            ? []
            : List<dynamic>.from(batchesList!.map((x) => x.toJson())),
        "total_results": totalResults,
      };
}

class BatchData {
  int? id;
  String? batchName;
  String? startdate;
  String? time;
  bool? isActive;
  int? course;
  List<int>? students;

  BatchData({
    this.id,
    this.batchName,
    this.startdate,
    this.time,
    this.isActive,
    this.course,
    this.students,
  });

  factory BatchData.fromJson(Map<String, dynamic> json) => BatchData(
        id: json["id"],
        batchName: json["batch_name"],
        startdate: json["startdate"],
        time: json["time"],
        isActive: json["is_active"],
        course: json["course"],
        students: json["students"] == null
            ? []
            : List<int>.from(json["students"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch_name": batchName,
        "startdate": startdate,
        "time": time,
        "is_active": isActive,
        "course": course,
        "students":
            students == null ? [] : List<dynamic>.from(students!.map((x) => x)),
      };
}
