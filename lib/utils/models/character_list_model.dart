import 'dart:convert';

class CharacterListModel {
  final Pagination? pagination;
  final List<CharacterItemModel>? data;

  CharacterListModel({
    this.pagination,
    this.data,
  });

  factory CharacterListModel.fromRawJson(String str) =>
      CharacterListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterListModel.fromJson(Map<String, dynamic> json) =>
      CharacterListModel(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null
            ? []
            : List<CharacterItemModel>.from(
                json["data"]!.map((x) => CharacterItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CharacterItemModel {
  final int? malId;
  final String? url;
  final CharacterImageModel? images;
  final String? name;
  final String? nameKanji;
  final List<String>? nicknames;
  final int? favorites;
  final String? about;

  CharacterItemModel({
    this.malId,
    this.url,
    this.images,
    this.name,
    this.nameKanji,
    this.nicknames,
    this.favorites,
    this.about,
  });

  factory CharacterItemModel.fromRawJson(String str) =>
      CharacterItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterItemModel.fromJson(Map<String, dynamic> json) =>
      CharacterItemModel(
        malId: json["mal_id"] ?? 0,
        url: json["url"] ?? '',
        images: json["images"] == null
            ? CharacterImageModel()
            : CharacterImageModel.fromJson(json["images"]),
        name: json["name"] ?? '',
        nameKanji: json["name_kanji"] ?? '',
        nicknames: json["nicknames"] == null
            ? []
            : List<String>.from(json["nicknames"]!.map((x) => x)),
        favorites: json["favorites"] ?? 0,
        about: json["about"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": images?.toJson(),
        "name": name,
        "name_kanji": nameKanji,
        "nicknames": nicknames == null
            ? []
            : List<dynamic>.from(nicknames!.map((x) => x)),
        "favorites": favorites,
        "about": about,
      };
}

class CharacterImageModel {
  final Jpg? jpg;
  final Webp? webp;

  CharacterImageModel({
    this.jpg,
    this.webp,
  });

  factory CharacterImageModel.fromRawJson(String str) =>
      CharacterImageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharacterImageModel.fromJson(Map<String, dynamic> json) =>
      CharacterImageModel(
        jpg: json["jpg"] == null ? null : Jpg.fromJson(json["jpg"]),
        webp: json["webp"] == null ? null : Webp.fromJson(json["webp"]),
      );

  Map<String, dynamic> toJson() => {
        "jpg": jpg?.toJson(),
        "webp": webp?.toJson(),
      };
}

class Jpg {
  final String? imageUrl;

  Jpg({
    this.imageUrl = '',
  });

  factory Jpg.fromRawJson(String str) => Jpg.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Jpg.fromJson(Map<String, dynamic> json) => Jpg(
        imageUrl: json["image_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
      };
}

class Webp {
  final String? imageUrl;
  final String? smallImageUrl;

  Webp({
    this.imageUrl = '',
    this.smallImageUrl = '',
  });

  factory Webp.fromRawJson(String str) => Webp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Webp.fromJson(Map<String, dynamic> json) => Webp(
        imageUrl: json["image_url"] ?? '',
        smallImageUrl: json["small_image_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
        "small_image_url": smallImageUrl,
      };
}

class Pagination {
  final int? lastVisiblePage;
  final bool? hasNextPage;
  final int? currentPage;
  final Items? items;

  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
    this.currentPage,
    this.items,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        lastVisiblePage: json["last_visible_page"] ?? 0,
        hasNextPage: json["has_next_page"] ?? false,
        currentPage: json["current_page"] ?? 0,
        items: json["items"] == null ? Items() : Items.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "last_visible_page": lastVisiblePage,
        "has_next_page": hasNextPage,
        "current_page": currentPage,
        "items": items?.toJson(),
      };
}

class Items {
  final int? count;
  final int? total;
  final int? perPage;

  Items({
    this.count,
    this.total,
    this.perPage,
  });

  factory Items.fromRawJson(String str) => Items.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        count: json["count"],
        total: json["total"],
        perPage: json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "total": total,
        "per_page": perPage,
      };
}
