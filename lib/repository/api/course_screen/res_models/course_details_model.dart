// // To parse this JSON data, do
// //
// //     final courseScreenModel = courseScreenModelFromJson(jsonString);

// import 'dart:convert';

// CourseScreenModel courseScreenModelFromJson(String str) =>
//     CourseScreenModel.fromJson(json.decode(str));

// String courseScreenModelToJson(CourseScreenModel data) =>
//     json.encode(data.toJson());

// class CourseScreenModel {
//   String status;
//   List<CourseScreen> data;
//   int totalResults;

//   CourseScreenModel({
//     required this.status,
//     required this.data,
//     required this.totalResults,
//   });

//   factory CourseScreenModel.fromJson(Map<String, dynamic> json) =>
//       CourseScreenModel(
//         status: json["status"],
//         data: List<CourseScreen>.from(
//             json["data"].map((x) => CourseScreen.fromJson(x))),
//         totalResults: json["totalResults"],
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "totalResults": totalResults,
//       };
// }

// class CourseScreen {
//   String id;
//   String title;
//   String description;
//   String duration;
//   String onlineFees;
//   String offlineFees;
//   String thumbnail;

//   CourseScreen({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.duration,
//     required this.onlineFees,
//     required this.offlineFees,
//     required this.thumbnail,
//   });

//   factory CourseScreen.fromJson(Map<String, dynamic> json) => CourseScreen(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         duration: json["duration"],
//         onlineFees: json["online_fees"],
//         offlineFees: json["offline_fees"],
//         thumbnail: json["thumbnail"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "duration": duration,
//         "online_fees": onlineFees,
//         "offline_fees": offlineFees,
//         "thumbnail": thumbnail,
//       };
// }
