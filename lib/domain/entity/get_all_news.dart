import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  final bool success;
  final String message;
  final List<NewsData> data;

  NewsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    success: json["success"],
    message: json["message"],
    data: List<NewsData>.from(json["data"].map((x) => NewsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class NewsData {
  final int id;
  final String newsTitle;
  final String newsDetails;
  final DateTime createdAt;
  final DateTime updatedAt;

  NewsData({
    required this.id,
    required this.newsTitle,
    required this.newsDetails,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
    id: json["id"],
    newsTitle: json["news_title"],
    newsDetails: json["news_details"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "news_title": newsTitle,
    "news_details": newsDetails,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
