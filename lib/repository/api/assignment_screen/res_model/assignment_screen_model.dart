// To parse this JSON data, do
//
//     final assignmentScreenModel = assignmentScreenModelFromJson(jsonString);

import 'dart:convert';

AssignmentScreenModel assignmentScreenModelFromJson(String str) =>
    AssignmentScreenModel.fromJson(json.decode(str));

String assignmentScreenModelToJson(AssignmentScreenModel data) =>
    json.encode(data.toJson());

class AssignmentScreenModel {
  String status;
  List<Assignment> assignments;
  int totalResults;

  AssignmentScreenModel({
    required this.status,
    required this.assignments,
    required this.totalResults,
  });

  factory AssignmentScreenModel.fromJson(Map<String, dynamic> json) =>
      AssignmentScreenModel(
        status: json["status"],
        assignments: List<Assignment>.from(
            json["assignments"].map((x) => Assignment.fromJson(x))),
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "assignments": List<dynamic>.from(assignments.map((x) => x.toJson())),
        "totalResults": totalResults,
      };
}

class Assignment {
  String id;
  String taskName;
  DateTime date;
  String time;
  String status;

  Assignment({
    required this.id,
    required this.taskName,
    required this.date,
    required this.time,
    required this.status,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        id: json["id"],
        taskName: json["task_name"],
        date: DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task_name": taskName,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": status,
      };
}
