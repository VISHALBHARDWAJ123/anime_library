import 'package:anime_library/utils/app_export.dart';

class AnimeEpisodesModel {
  EpisodePagination? pagination;
  List<Datum>? data;

  AnimeEpisodesModel({
    this.pagination,
    this.data,
  });

  factory AnimeEpisodesModel.fromRawJson(String str) => AnimeEpisodesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeEpisodesModel.fromJson(Map<String, dynamic> json) => AnimeEpisodesModel(
        pagination: json["pagination"] == null ? null : EpisodePagination.fromJson(json["pagination"]),
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? malId;
  final String? url;
  final String? title;
  final String? titleJapanese;
  final String? titleRomanji;
  final String? aired;
  final double? score;
  final bool? filler;
  final bool? recap;
  final String? forumUrl;

  Datum({
    this.malId,
    this.url,
    this.title,
    this.titleJapanese,
    this.titleRomanji,
    this.aired,
    this.score,
    this.filler,
    this.recap,
    this.forumUrl,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        malId: json["mal_id"],
        url: json["url"],
        title: json["title"],
        titleJapanese: json["title_japanese"],
        titleRomanji: json["title_romanji"],
        aired: json["aired"],
        score: json["score"]?.toDouble(),
        filler: json["filler"],
        recap: json["recap"],
        forumUrl: json["forum_url"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "title": title,
        "title_japanese": titleJapanese,
        "title_romanji": titleRomanji,
        "aired": aired,
        "score": score,
        "filler": filler,
        "recap": recap,
        "forum_url": forumUrl,
      };
}

class EpisodePagination {
  final int? lastVisiblePage;
  final bool? hasNextPage;

  EpisodePagination({
    this.lastVisiblePage,
    this.hasNextPage,
  });

  factory EpisodePagination.fromRawJson(String str) => EpisodePagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EpisodePagination.fromJson(Map<String, dynamic> json) => EpisodePagination(
        lastVisiblePage: json["last_visible_page"],
        hasNextPage: json["has_next_page"],
      );

  Map<String, dynamic> toJson() => {
        "last_visible_page": lastVisiblePage,
        "has_next_page": hasNextPage,
      };
}
