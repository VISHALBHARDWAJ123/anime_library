import 'package:anime_library/utils/app_export.dart';

class AnimeDetailsModel {
  final Data? data;

  AnimeDetailsModel({
    this.data,
  });

  factory AnimeDetailsModel.fromRawJson(String str) => AnimeDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeDetailsModel.fromJson(Map<String, dynamic> json) => AnimeDetailsModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final int? malId;
  final String? url;
  final Map<String, ImageModel>? images;
  final Trailer? trailer;
  final bool? approved;
  final List<TitleModel>? titles;
  final String? title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<dynamic>? titleSynonyms;
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
  final List<Demographic>? explicitGenres;
  final List<Demographic>? themes;
  final List<Demographic>? demographics;
  final List<Relation>? relations;
  final AnimeTheme? theme;
  final List<External>? dataExternal;
  final List<External>? streaming;

  Data({
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
    this.relations,
    this.theme,
    this.dataExternal,
    this.streaming,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        malId: json["mal_id"],
        url: json["url"],
        images: Map.from(json["images"]!).map((k, v) => MapEntry<String, ImageModel>(k, ImageModel.fromJson(v))),
        trailer: json["trailer"] == null ? null : Trailer.fromJson(json["trailer"]),
        approved: json["approved"],
        titles: json["titles"] == null ? [] : List<TitleModel>.from(json["titles"]!.map((x) => TitleModel.fromJson(x))),
        title: json["title"],
        titleEnglish: json["title_english"],
        titleJapanese: json["title_japanese"],
        titleSynonyms: json["title_synonyms"] == null ? [] : List<dynamic>.from(json["title_synonyms"]!.map((x) => x)),
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
        explicitGenres: json["explicit_genres"] == null ? [] : List<Demographic>.from(json["explicit_genres"]!.map((x) => Demographic.fromJson(x))),
        themes: json["themes"] == null ? [] : List<Demographic>.from(json["themes"]!.map((x) => Demographic.fromJson(x))),
        demographics: json["demographics"] == null ? [] : List<Demographic>.from(json["demographics"]!.map((x) => Demographic.fromJson(x))),
        relations: json["relations"] == null ? [] : List<Relation>.from(json["relations"]!.map((x) => Relation.fromJson(x))),
        theme: json["theme"] == null ? null : AnimeTheme.fromJson(json["theme"]),
        dataExternal: json["external"] == null ? [] : List<External>.from(json["external"]!.map((x) => External.fromJson(x))),
        streaming: json["streaming"] == null ? [] : List<External>.from(json["streaming"]!.map((x) => External.fromJson(x))),
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
        "demographics": demographics == null ? [] : List<dynamic>.from(demographics!.map((x) => x)),
        "relations": relations == null ? [] : List<dynamic>.from(relations!.map((x) => x.toJson())),
        "theme": theme?.toJson(),
        "external": dataExternal == null ? [] : List<dynamic>.from(dataExternal!.map((x) => x.toJson())),
        "streaming": streaming == null ? [] : List<dynamic>.from(streaming!.map((x) => x.toJson())),
      };
}

/*class Aired {
  final String? from;
  final String? to;
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
        from: json["from"],
        to: json["to"],
        prop: json["prop"] == null ? null : Prop.fromJson(json["prop"]),
        string: json["string"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "prop": prop?.toJson(),
        "string": string,
      };
}*/

/*class Prop {
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
}*/

/*class Broadcast {
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

  factory Broadcast.fromRawJson(String str) =>
      Broadcast.fromJson(json.decode(str));

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
}*/

class External {
  final String? name;
  final String? url;

  External({
    this.name,
    this.url,
  });

  factory External.fromRawJson(String str) => External.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory External.fromJson(Map<String, dynamic> json) => External(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Relation {
  final String? relation;
  final List<Demographic>? entry;

  Relation({
    this.relation,
    this.entry,
  });

  factory Relation.fromRawJson(String str) => Relation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Relation.fromJson(Map<String, dynamic> json) => Relation(
        relation: json["relation"],
        entry: json["entry"] == null ? [] : List<Demographic>.from(json["entry"]!.map((x) => Demographic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "relation": relation,
        "entry": entry == null ? [] : List<dynamic>.from(entry!.map((x) => x.toJson())),
      };
}

class AnimeTheme {
  final List<String>? openings;
  final List<String>? endings;

  AnimeTheme({
    this.openings,
    this.endings,
  });

  factory AnimeTheme.fromRawJson(String str) => AnimeTheme.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeTheme.fromJson(Map<String, dynamic> json) => AnimeTheme(
        openings: json["openings"] == null ? [] : List<String>.from(json["openings"]!.map((x) => x)),
        endings: json["endings"] == null ? [] : List<String>.from(json["endings"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "openings": openings == null ? [] : List<dynamic>.from(openings!.map((x) => x)),
        "endings": endings == null ? [] : List<dynamic>.from(endings!.map((x) => x)),
      };
}
