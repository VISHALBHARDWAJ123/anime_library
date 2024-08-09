import 'package:anime_library/utils/app_export.dart';

class CharacterDetailsModel {
  final CharacterData? data;

  CharacterDetailsModel({
    this.data,
  });

  factory CharacterDetailsModel.fromRawJson(String str) => CharacterDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterDetailsModel.fromJson(Map<String, dynamic> json) => CharacterDetailsModel(
        data: json["data"] == null ? null : CharacterData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class CharacterData {
  final int? malId;
  final String? url;
  final DataImages? images;
  final String? name;
  final String? nameKanji;
  final List<dynamic>? nicknames;
  final int? favorites;
  final String? about;
  final List<AnimeElement>? anime;
  final List<Manga>? manga;
  final List<Voice>? voices;
  final String? fullDetails;

  CharacterData({
    this.malId,
    this.url,
    this.images,
    this.name,
    this.nameKanji,
    this.nicknames,
    this.favorites,
    this.about,
    this.anime,
    this.manga,
    this.voices,
    this.fullDetails,
  });

  factory CharacterData.fromRawJson(String str) => CharacterData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterData.fromJson(Map<String, dynamic> json) => CharacterData(
        malId: json["mal_id"] ?? 0,
        url: json["url"] ?? '',
        images: json["images"] == null ? null : DataImages.fromJson(json["images"]),
        name: json["name"] ?? '',
        nameKanji: json["name_kanji"] ?? '',
        nicknames: json["nicknames"] == null ? [] : List<dynamic>.from(json["nicknames"]!.map((x) => x)),
        favorites: json["favorites"],
        about: getBaiscDetails(json["about"] ?? '', json["name"] ?? ''),
        fullDetails: getFullDetails(json['about'] ?? ''),
        anime: json["anime"] == null ? [] : List<AnimeElement>.from(json["anime"]!.map((x) => AnimeElement.fromJson(x))),
        manga: json["manga"] == null ? [] : List<Manga>.from(json["manga"]!.map((x) => Manga.fromJson(x))),
        voices: json["voices"] == null ? [] : List<Voice>.from(json["voices"]!.map((x) => Voice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": images?.toJson(),
        "name": name,
        "name_kanji": nameKanji,
        "nicknames": nicknames == null ? [] : List<dynamic>.from(nicknames!.map((x) => x)),
        "favorites": favorites,
        "about": about,
        "anime": anime == null ? [] : List<dynamic>.from(anime!.map((x) => x.toJson())),
        "manga": manga == null ? [] : List<dynamic>.from(manga!.map((x) => x.toJson())),
        "voices": voices == null ? [] : List<dynamic>.from(voices!.map((x) => x.toJson())),
      };
}

class AnimeElement {
  final String? role;
  final MangaClass? anime;

  AnimeElement({
    this.role = '',
    this.anime,
  });

  factory AnimeElement.fromRawJson(String str) => AnimeElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeElement.fromJson(Map<String, dynamic> json) => AnimeElement(
        role: json["role"] ?? '',
        anime: json["anime"] == null ? null : MangaClass.fromJson(json["anime"]),
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "anime": anime?.toJson(),
      };
}

class MangaClass {
  final int? malId;
  final String? url;
  final Map<String, CharacterImage>? images;
  final String? title;

  MangaClass({
    this.malId = 0,
    this.url = '',
    this.images,
    this.title = '',
  });

  factory MangaClass.fromRawJson(String str) => MangaClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MangaClass.fromJson(Map<String, dynamic> json) => MangaClass(
        malId: json["mal_id"] ?? 0,
        url: json["url"] ?? '',
        images: Map.from(json["images"]!).map((k, v) => MapEntry<String, CharacterImage>(k, CharacterImage.fromJson(v))),
        title: json["title"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": Map.from(images!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "title": title,
      };
}

class CharacterImage {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  CharacterImage({
    this.imageUrl = '',
    this.smallImageUrl = '',
    this.largeImageUrl = '',
  });

  factory CharacterImage.fromRawJson(String str) => CharacterImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterImage.fromJson(Map<String, dynamic> json) => CharacterImage(
        imageUrl: json["image_url"] ?? '',
        smallImageUrl: json["small_image_url"] ?? '',
        largeImageUrl: json["large_image_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
        "large_image_url": largeImageUrl,
      };
}

class DataImages {
  final Jpg? jpg;
  final Webp? webp;

  DataImages({
    this.jpg,
    this.webp,
  });

  factory DataImages.fromRawJson(String str) => DataImages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataImages.fromJson(Map<String, dynamic> json) => DataImages(
        jpg: json["jpg"] == null ? Jpg() : Jpg.fromJson(json["jpg"]),
        webp: json["webp"] == null ? Webp() : Webp.fromJson(json["webp"]),
      );

  Map<String, dynamic> toJson() => {
        "jpg": jpg?.toJson(),
        "webp": webp?.toJson(),
      };
}

class Manga {
  final String? role;
  final MangaClass? manga;

  Manga({
    this.role = '',
    this.manga,
  });

  factory Manga.fromRawJson(String str) => Manga.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Manga.fromJson(Map<String, dynamic> json) => Manga(
        role: json["role"] ?? '',
        manga: json["manga"] == null ? MangaClass() : MangaClass.fromJson(json["manga"]),
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "manga": manga?.toJson(),
      };
}

class Voice {
  final Person? person;
  final String? language;

  Voice({
    this.person,
    this.language,
  });

  factory Voice.fromRawJson(String str) => Voice.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Voice.fromJson(Map<String, dynamic> json) => Voice(
        person: json["person"] == null ? Person() : Person.fromJson(json["person"]),
        language: json["language"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "person": person?.toJson(),
        "language": language,
      };
}

class Person {
  final int? malId;
  final String? url;
  final PersonImages? images;
  final String? name;

  Person({
    this.malId = 0,
    this.url = '',
    this.images,
    this.name = '',
  });

  factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        malId: json["mal_id"],
        url: json["url"],
        images: json["images"] == null ? null : PersonImages.fromJson(json["images"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": images?.toJson(),
        "name": name,
      };
}

class PersonImages {
  final Jpg? jpg;

  PersonImages({
    this.jpg,
  });

  factory PersonImages.fromRawJson(String str) => PersonImages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PersonImages.fromJson(Map<String, dynamic> json) => PersonImages(
        jpg: json["jpg"] == null ? null : Jpg.fromJson(json["jpg"]),
      );

  Map<String, dynamic> toJson() => {
        "jpg": jpg?.toJson(),
      };
}
