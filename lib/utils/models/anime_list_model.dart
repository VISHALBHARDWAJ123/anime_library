import 'package:anime_library/utils/app_export.dart';

class AnimeListModel {
  final Pagination? pagination;
  final List<AnimeListItemModel>? data;

  AnimeListModel({
    this.pagination,
    this.data,
  });

  factory AnimeListModel.fromRawJson(String str) => AnimeListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeListModel.fromJson(Map<String, dynamic> json) => AnimeListModel(
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null ? [] : List<AnimeListItemModel>.from(json["data"]!.map((x) => AnimeListItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AnimeListItemModel {
  final int? malId;
  final String? url;
  final Map<String, ImageModel>? images;
  final Trailer? trailer;
  final bool? approved;
  final List<TitleModel>? titles;
  final String? title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String>? titleSynonyms;
  final String? type;
  final String? source;
  final int? episodes;
  final String? status;
  final bool? airing;
  final Aired? aired;
  final String? duration;
  final String? rating;
  final double? score;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final Broadcast? broadcast;
  final List<Demographic>? producers;
  final List<Demographic>? licensors;
  final List<Demographic>? studios;
  final List<Demographic>? genres;
  final List<dynamic>? explicitGenres;
  final List<Demographic>? themes;
  final List<Demographic>? demographics;

  AnimeListItemModel({
    this.malId,
    this.url,
    this.images,
    this.trailer,
    this.approved,
    this.titles,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
  });

  factory AnimeListItemModel.fromRawJson(String str) => AnimeListItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeListItemModel.fromJson(Map<String, dynamic> json) => AnimeListItemModel(
        malId: json["mal_id"],
        url: json["url"],
        images: Map.from(json["images"]!).map((k, v) => MapEntry<String, ImageModel>(k, ImageModel.fromJson(v))),
        trailer: json["trailer"] == null ? null : Trailer.fromJson(json["trailer"]),
        approved: json["approved"],
        titles: json["titles"] == null ? [] : List<TitleModel>.from(json["titles"]!.map((x) => TitleModel.fromJson(x))),
        title: json["title"],
        titleEnglish: json["title_english"],
        titleJapanese: json["title_japanese"],
        titleSynonyms: json["title_synonyms"] == null ? [] : List<String>.from(json["title_synonyms"]!.map((x) => x)),
        type: json["type"],
        source: json["source"],
        episodes: json["episodes"],
        status: json["status"],
        airing: json["airing"],
        aired: json["aired"] == null ? null : Aired.fromJson(json["aired"]),
        duration: json["duration"],
        rating: json["rating"],
        score: json["score"]?.toDouble(),
        scoredBy: json["scored_by"],
        rank: json["rank"],
        popularity: json["popularity"],
        members: json["members"],
        favorites: json["favorites"],
        synopsis: json["synopsis"],
        background: json["background"],
        season: json["season"],
        year: json["year"],
        broadcast: json["broadcast"] == null ? null : Broadcast.fromJson(json["broadcast"]),
        producers: json["producers"] == null ? [] : List<Demographic>.from(json["producers"]!.map((x) => Demographic.fromJson(x))),
        licensors: json["licensors"] == null ? [] : List<Demographic>.from(json["licensors"]!.map((x) => Demographic.fromJson(x))),
        studios: json["studios"] == null ? [] : List<Demographic>.from(json["studios"]!.map((x) => Demographic.fromJson(x))),
        genres: json["genres"] == null ? [] : List<Demographic>.from(json["genres"]!.map((x) => Demographic.fromJson(x))),
        explicitGenres: json["explicit_genres"] == null ? [] : List<dynamic>.from(json["explicit_genres"]!.map((x) => x)),
        themes: json["themes"] == null ? [] : List<Demographic>.from(json["themes"]!.map((x) => Demographic.fromJson(x))),
        demographics: json["demographics"] == null ? [] : List<Demographic>.from(json["demographics"]!.map((x) => Demographic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": Map.from(images!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "trailer": trailer?.toJson(),
        "approved": approved,
        "titles": titles == null ? [] : List<dynamic>.from(titles!.map((x) => x.toJson())),
        "title": title,
        "title_english": titleEnglish,
        "title_japanese": titleJapanese,
        "title_synonyms": titleSynonyms == null ? [] : List<dynamic>.from(titleSynonyms!.map((x) => x)),
        "type": type,
        "source": source,
        "episodes": episodes,
        "status": status,
        "airing": airing,
        "aired": aired?.toJson(),
        "duration": duration,
        "rating": rating,
        "score": score,
        "scored_by": scoredBy,
        "rank": rank,
        "popularity": popularity,
        "members": members,
        "favorites": favorites,
        "synopsis": synopsis,
        "background": background,
        "season": season,
        "year": year,
        "broadcast": broadcast?.toJson(),
        "producers": producers == null ? [] : List<dynamic>.from(producers!.map((x) => x.toJson())),
        "licensors": licensors == null ? [] : List<dynamic>.from(licensors!.map((x) => x.toJson())),
        "studios": studios == null ? [] : List<dynamic>.from(studios!.map((x) => x.toJson())),
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "explicit_genres": explicitGenres == null ? [] : List<dynamic>.from(explicitGenres!.map((x) => x)),
        "themes": themes == null ? [] : List<dynamic>.from(themes!.map((x) => x.toJson())),
        "demographics": demographics == null ? [] : List<dynamic>.from(demographics!.map((x) => x.toJson())),
      };
}

class Aired {
  final DateTime? from;
  final DateTime? to;
  final Prop? prop;
  final String? string;

  Aired({
    this.from,
    this.to,
    this.prop,
    this.string,
  });

  factory Aired.fromRawJson(String str) => Aired.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"] == null ? null : DateTime.parse(json["to"]),
        prop: json["prop"] == null ? null : Prop.fromJson(json["prop"]),
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "from": from?.toIso8601String(),
        "to": to?.toIso8601String(),
        "prop": prop?.toJson(),
        "string": string,
      };
}

class Prop {
  final From? from;
  final From? to;

  Prop({
    this.from,
    this.to,
  });

  factory Prop.fromRawJson(String str) => Prop.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prop.fromJson(Map<String, dynamic> json) => Prop(
        from: json["from"] == null ? null : From.fromJson(json["from"]),
        to: json["to"] == null ? null : From.fromJson(json["to"]),
      );

  Map<String, dynamic> toJson() => {
        "from": from?.toJson(),
        "to": to?.toJson(),
      };
}

class From {
  final int? day;
  final int? month;
  final int? year;

  From({
    this.day,
    this.month,
    this.year,
  });

  factory From.fromRawJson(String str) => From.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory From.fromJson(Map<String, dynamic> json) => From(
        day: json["day"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
      };
}

class Broadcast {
  final String? day;
  final String? time;
  final String? timezone;
  final String? string;

  Broadcast({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  factory Broadcast.fromRawJson(String str) => Broadcast.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
        day: json["day"],
        time: json["time"],
        timezone: json["timezone"],
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "time": time,
        "timezone": timezone,
        "string": string,
      };
}

class Demographic {
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  Demographic({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  factory Demographic.fromRawJson(String str) => Demographic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Demographic.fromJson(Map<String, dynamic> json) => Demographic(
        malId: json["mal_id"],
        type: json["type"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "type": type,
        "name": name,
        "url": url,
      };
}

class ImageModel {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  ImageModel({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  factory ImageModel.fromRawJson(String str) => ImageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
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

class TitleModel {
  final String? type;
  final String? title;

  TitleModel({
    this.type,
    this.title,
  });

  factory TitleModel.fromRawJson(String str) => TitleModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TitleModel.fromJson(Map<String, dynamic> json) => TitleModel(
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
      };
}

class Trailer {
  final String? youtubeId;
  final String? url;
  final String? embedUrl;
  final Images? images;

  Trailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
    this.images,
  });

  factory Trailer.fromRawJson(String str) => Trailer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Trailer.fromJson(Map<String, dynamic> json) => Trailer(
        youtubeId: json["youtube_id"],
        url: json["url"],
        embedUrl: json["embed_url"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "youtube_id": youtubeId,
        "url": url,
        "embed_url": embedUrl,
        "images": images?.toJson(),
      };
}

class Images {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? mediumImageUrl;
  final String? largeImageUrl;
  final String? maximumImageUrl;

  Images({
    this.imageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.maximumImageUrl,
  });

  factory Images.fromRawJson(String str) => Images.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
        maximumImageUrl: json["maximum_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
        "maximum_image_url": maximumImageUrl,
      };
}
