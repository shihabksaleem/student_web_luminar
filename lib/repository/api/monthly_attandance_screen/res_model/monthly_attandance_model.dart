class MonthyAttandanceModel {
  List<Data>? data;

  MonthyAttandanceModel({
    this.data,
  });

  factory MonthyAttandanceModel.fromJson(Map<String, dynamic> json) =>
      MonthyAttandanceModel(
        data: json["data"] == null
            ? []
            : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      );
}

class Data {
  int? id;
  int? batch;
  int? student;
  DateTime? date;
  String? status;

  Data({
    this.id,
    this.batch,
    this.student,
    this.date,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        batch: json["batch"],
        student: json["student"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
      );
}
