class FolderVideoModel {
  int? status;
  List<FolderVideoDetails>? folderList;

  FolderVideoModel({
    this.status,
    this.folderList,
  });

  factory FolderVideoModel.fromJson(Map<String, dynamic> json) =>
      FolderVideoModel(
        status: json["status"],
        folderList: json["data"] == null
            ? []
            : List<FolderVideoDetails>.from(
                json["data"]!.map((x) => FolderVideoDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": folderList == null
            ? []
            : List<dynamic>.from(folderList!.map((x) => x.toJson())),
      };
}

class FolderVideoDetails {
  int? id;
  dynamic createdBy;
  dynamic updatedBy;
  String? name;
  DateTime? createdAt;
  DateTime? updatedDate;
  int? batch;

  FolderVideoDetails({
    this.id,
    this.createdBy,
    this.updatedBy,
    this.name,
    this.createdAt,
    this.updatedDate,
    this.batch,
  });

  factory FolderVideoDetails.fromJson(Map<String, dynamic> json) =>
      FolderVideoDetails(
        id: json["id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedDate: json["updated_date"] == null
            ? null
            : DateTime.parse(json["updated_date"]),
        batch: json["batch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_date": updatedDate?.toIso8601String(),
        "batch": batch,
      };
}
