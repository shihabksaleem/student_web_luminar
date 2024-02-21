class StudentPersonalDetailsResModel {
  int? id;
  String? fullName;
  String? phone;
  String? dob;
  String? email;
  String? gender;
  bool? phoneVerified;
  bool? isActive;
  String? status;
  String? parentNo;
  List<int>? coursesId;
  String? profilePic;

  StudentPersonalDetailsResModel({
    this.id,
    this.fullName,
    this.phone,
    this.dob,
    this.email,
    this.gender,
    this.phoneVerified,
    this.isActive,
    this.status,
    this.parentNo,
    this.coursesId,
    this.profilePic,
  });

  factory StudentPersonalDetailsResModel.fromJson(Map<String, dynamic> json) => StudentPersonalDetailsResModel(
        id: json["id"],
        fullName: json["full_name"],
        phone: json["phone"],
        dob: json["dob"],
        email: json["email"],
        gender: json["gender"],
        phoneVerified: json["phone_verified"],
        isActive: json["is_active"],
        status: json["status"],
        parentNo: json["parent_no"],
        coursesId: json["courses_id"] == null ? [] : List<int>.from(json["courses_id"]!.map((x) => x)),
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "phone": phone,
        "dob": dob,
        "email": email,
        "gender": gender,
        "phone_verified": phoneVerified,
        "is_active": isActive,
        "status": status,
        "parent_no": parentNo,
        "courses_id": coursesId == null ? [] : List<dynamic>.from(coursesId!.map((x) => x)),
        "profile_pic": profilePic,
      };
}
