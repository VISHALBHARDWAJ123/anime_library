import 'package:anime_library/utils/app_export.dart';

class RecommendedMangaAnimeModel {
  final RecommendedPaginationModel? pagination;
  final List<RecommendationItemModel>? data;

  RecommendedMangaAnimeModel({this.data, this.pagination});

  factory RecommendedMangaAnimeModel.fromRawJson(String str) =>
      RecommendedMangaAnimeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecommendedMangaAnimeModel.fromJson(Map<String, dynamic> json) =>
      RecommendedMangaAnimeModel(
        pagination: json['pagination'] == null
            ? RecommendedPaginationModel()
            : RecommendedPaginationModel.fromJson(json['pagination']),
        data: json["data"] == null
            ? []
            : List<RecommendationItemModel>.from(
                json["data"]!.map((x) => RecommendationItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RecommendationItemModel {
  final String? malId;
  final List<Entry>? entry;
  final String? content;
  final String? date;
  final User? user;

  RecommendationItemModel({
    this.malId,
    this.entry,
    this.content,
    this.date,
    this.user,
  });

  factory RecommendationItemModel.fromRawJson(String str) =>
      RecommendationItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecommendationItemModel.fromJson(Map<String, dynamic> json) =>
      RecommendationItemModel(
        malId: json["mal_id"],
        entry: json["entry"] == null
            ? []
            : List<Entry>.from(json["entry"]!.map((x) => Entry.fromJson(x))),
        content: json["content"],
        date: json["date"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "entry": entry == null
            ? []
            : List<dynamic>.from(entry!.map((x) => x.toJson())),
        "content": content,
        "date": date,
        "user": user?.toJson(),
      };
}

class Entry {
  final int? malId;
  final String? url;
  final Map<String, Image>? images;
  final String? title;

  Entry({
    this.malId,
    this.url,
    this.images,
    this.title,
  });

  factory Entry.fromRawJson(String str) => Entry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        malId: json["mal_id"],
        url: json["url"],
        images: Map.from(json["images"]!)
            .map((k, v) => MapEntry<String, Image>(k, Image.fromJson(v))),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": Map.from(images!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "title": title,
      };
}

class Image {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  Image({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
        largeImageUrl: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "large_image_url": largeImageUrl,
      };
}

class User {
  final String? url;
  final String? username;

  User({
    this.url,
    this.username,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        url: json["url"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "username": username,
      };
}

class RecommendedPaginationModel {
  final int? lastVisiblePage;
  final bool? hasNextPage;

  RecommendedPaginationModel({
    this.lastVisiblePage,
    this.hasNextPage,
  });

  factory RecommendedPaginationModel.fromRawJson(String str) =>
      RecommendedPaginationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecommendedPaginationModel.fromJson(Map<String, dynamic> json) =>
      RecommendedPaginationModel(
        lastVisiblePage: json["last_visible_page"],
        hasNextPage: json["has_next_page"],
      );

  Map<String, dynamic> toJson() => {
        "last_visible_page": lastVisiblePage,
        "has_next_page": hasNextPage,
      };
}
