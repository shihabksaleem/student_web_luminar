class BatchCalssVideosListResModel {
  int? status;
  List<BatchClassVideoModel>? batchClassVideosList;

  BatchCalssVideosListResModel({
    this.status,
    this.batchClassVideosList,
  });

  factory BatchCalssVideosListResModel.fromJson(Map<String, dynamic> json) =>
      BatchCalssVideosListResModel(
        status: json["status"],
        batchClassVideosList: json["data"] == null
            ? []
            : List<BatchClassVideoModel>.from(
                json["data"]!.map((x) => BatchClassVideoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": batchClassVideosList == null
            ? []
            : List<dynamic>.from(batchClassVideosList!.map((x) => x.toJson())),
      };
}

class BatchClassVideoModel {
  int? id;
  String? title;
  String? description;
  String? date;
  String? link;
  int? batch;

  BatchClassVideoModel({
    this.id,
    this.title,
    this.description,
    this.date,
    this.link,
    this.batch,
  });

  factory BatchClassVideoModel.fromJson(Map<String, dynamic> json) =>
      BatchClassVideoModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: json["date"],
        link: json["link"],
        batch: json["batch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "date": date,
        "link": link,
        "batch": batch,
      };
}
