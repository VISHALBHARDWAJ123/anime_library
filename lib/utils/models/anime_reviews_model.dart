import 'package:anime_library/utils/app_export.dart';

class AnimeReviewsModel {
  List<ReviewItemModel>? data;
  EpisodePagination? pagination;

  AnimeReviewsModel({
    this.data,
    this.pagination,
  });

  factory AnimeReviewsModel.fromRawJson(String str) => AnimeReviewsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeReviewsModel.fromJson(Map<String, dynamic> json) => AnimeReviewsModel(
        pagination: json["pagination"] == null ? null : EpisodePagination.fromJson(json["pagination"]),
        data: json["data"] == null ? [] : List<ReviewItemModel>.from(json["data"]!.map((x) => ReviewItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ReviewItemModel {
  final int? malId;
  final String? url;
  final String? type;
  final Reactions? reactions;
  final String? date;
  final String? review;
  final int? score;
  final List<String>? tags;
  final bool? isSpoiler;
  final bool? isPreliminary;
  final dynamic episodesWatched;
  final User? user;

  ReviewItemModel({
    this.malId,
    this.url,
    this.type,
    this.reactions,
    this.date,
    this.review,
    this.score,
    this.tags,
    this.isSpoiler,
    this.isPreliminary,
    this.episodesWatched,
    this.user,
  });

  factory ReviewItemModel.fromRawJson(String str) => ReviewItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewItemModel.fromJson(Map<String, dynamic> json) => ReviewItemModel(
        malId: json["mal_id"],
        url: json["url"],
        type: json["type"],
        reactions: json["reactions"] == null ? null : Reactions.fromJson(json["reactions"]),
        date: json["date"],
        review: json["review"],
        score: json["score"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        isSpoiler: json["is_spoiler"],
        isPreliminary: json["is_preliminary"],
        episodesWatched: json["episodes_watched"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "type": type,
        "reactions": reactions?.toJson(),
        "date": date,
        "review": review,
        "score": score,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "is_spoiler": isSpoiler,
        "is_preliminary": isPreliminary,
        "episodes_watched": episodesWatched,
        "user": user?.toJson(),
      };
}

class Reactions {
  final int? overall;
  final int? nice;
  final int? loveIt;
  final int? funny;
  final int? confusing;
  final int? informative;
  final int? wellWritten;
  final int? creative;

  Reactions({
    this.overall,
    this.nice,
    this.loveIt,
    this.funny,
    this.confusing,
    this.informative,
    this.wellWritten,
    this.creative,
  });

  factory Reactions.fromRawJson(String str) => Reactions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        overall: json["overall"],
        nice: json["nice"],
        loveIt: json["love_it"],
        funny: json["funny"],
        confusing: json["confusing"],
        informative: json["informative"],
        wellWritten: json["well_written"],
        creative: json["creative"],
      );

  Map<String, dynamic> toJson() => {
        "overall": overall,
        "nice": nice,
        "love_it": loveIt,
        "funny": funny,
        "confusing": confusing,
        "informative": informative,
        "well_written": wellWritten,
        "creative": creative,
      };
}

class User {
  final String? url;
  final String? username;
  final Map<String, UserImage>? images;

  User({
    this.url,
    this.username,
    this.images,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        url: json["url"],
        username: json["username"],
        images: Map.from(json["images"]!).map((k, v) => MapEntry<String, UserImage>(k, UserImage.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "username": username,
        "images": Map.from(images!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class UserImage {
  final String? imageUrl;

  UserImage({
    this.imageUrl,
  });

  factory UserImage.fromRawJson(String str) => UserImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserImage.fromJson(Map<String, dynamic> json) => UserImage(
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
      };
}
