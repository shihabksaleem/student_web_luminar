// class BannerModel {
//   int? status;
//   List<BannerResData>? banner_res_data;

//   BannerModel({
//     this.status,
//     this.banner_res_data,
//   });

//   factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
//         status: json["status"],
//         banner_res_data: json["data"] == null
//             ? []
//             : List<BannerResData>.from(
//                 json["data"]!.map((x) => BannerResData.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": banner_res_data == null
//             ? []
//             : List<dynamic>.from(banner_res_data!.map((x) => x.toJson())),
//       };
// }

// class BannerResData {
//   int? id;
//   dynamic createdBy;
//   dynamic updatedBy;
//   String? name;
//   DateTime? createdAt;
//   DateTime? updatedDate;
//   int? batch;

//   BannerResData({
//     this.id,
//     this.createdBy,
//     this.updatedBy,
//     this.name,
//     this.createdAt,
//     this.updatedDate,
//     this.batch,
//   });

//   factory BannerResData.fromJson(Map<String, dynamic> json) => BannerResData(
//         id: json["id"],
//         createdBy: json["created_by"],
//         updatedBy: json["updated_by"],
//         name: json["name"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         updatedDate: json["updated_date"] == null
//             ? null
//             : DateTime.parse(json["updated_date"]),
//         batch: json["batch"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "created_by": createdBy,
//         "updated_by": updatedBy,
//         "name": name,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_date": updatedDate?.toIso8601String(),
//         "batch": batch,
//       };
// }

// // To parse this JSON data, do
// //
// //     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  int? status;
  List<BannerResData>? banner_res_data;

  BannerModel({
    this.status,
    this.banner_res_data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        status: json["status"],
        banner_res_data: json["data"] == null
            ? []
            : List<BannerResData>.from(
                json["data"]!.map((x) => BannerResData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": banner_res_data == null
            ? []
            : List<dynamic>.from(banner_res_data!.map((x) => x.toJson())),
      };
}

class BannerResData {
  int? id;
  String? img;

  BannerResData({
    this.id,
    this.img,
  });

  factory BannerResData.fromJson(Map<String, dynamic> json) => BannerResData(
        id: json["id"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
      };
}
