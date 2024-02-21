// To parse this JSON data, do
//
//     final instagramPostsResModel = instagramPostsResModelFromJson(jsonString);

import 'dart:convert';

InstagramPostsResModel instagramPostsResModelFromJson(String str) => InstagramPostsResModel.fromJson(json.decode(str));

String instagramPostsResModelToJson(InstagramPostsResModel data) => json.encode(data.toJson());

class InstagramPostsResModel {
    List<InstaPostModel> data;
    Paging paging;

    InstagramPostsResModel({
        required this.data,
        required this.paging,
    });

    factory InstagramPostsResModel.fromJson(Map<String, dynamic> json) => InstagramPostsResModel(
        data: List<InstaPostModel>.from(json["data"].map((x) => InstaPostModel.fromJson(x))),
        paging: Paging.fromJson(json["paging"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "paging": paging.toJson(),
    };
}

class InstaPostModel {
    String id;
    String? caption;
    String mediaUrl;

    InstaPostModel({
        required this.id,
        this.caption,
        required this.mediaUrl,
    });

    factory InstaPostModel.fromJson(Map<String, dynamic> json) => InstaPostModel(
        id: json["id"],
        caption: json["caption"],
        mediaUrl: json["media_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
        "media_url": mediaUrl,
    };
}

class Paging {
    Cursors cursors;

    Paging({
        required this.cursors,
    });

    factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        cursors: Cursors.fromJson(json["cursors"]),
    );

    Map<String, dynamic> toJson() => {
        "cursors": cursors.toJson(),
    };
}

class Cursors {
    String before;
    String after;

    Cursors({
        required this.before,
        required this.after,
    });

    factory Cursors.fromJson(Map<String, dynamic> json) => Cursors(
        before: json["before"],
        after: json["after"],
    );

    Map<String, dynamic> toJson() => {
        "before": before,
        "after": after,
    };
}
