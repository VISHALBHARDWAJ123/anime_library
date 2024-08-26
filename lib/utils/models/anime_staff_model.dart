import 'package:anime_library/utils/app_export.dart';

class AnimeStaffModel {
  final List<AnimeStaffItemModel>? data;

  AnimeStaffModel({
    this.data,
  });

  factory AnimeStaffModel.fromRawJson(String str) => AnimeStaffModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeStaffModel.fromJson(Map<String, dynamic> json) => AnimeStaffModel(
        data: json["data"] == null ? [] : List<AnimeStaffItemModel>.from(json["data"]!.map((x) => AnimeStaffItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class AnimeStaffItemModel {
  final StaffPerson? person;
  final List<String>? positions;

  AnimeStaffItemModel({
    this.person,
    this.positions,
  });

  factory AnimeStaffItemModel.fromRawJson(String str) => AnimeStaffItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeStaffItemModel.fromJson(Map<String, dynamic> json) => AnimeStaffItemModel(
        person: json["person"] == null ? null : StaffPerson.fromJson(json["person"]),
        positions: json["positions"] == null ? [] : List<String>.from(json["positions"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "person": person?.toJson(),
        "positions": positions == null ? [] : List<dynamic>.from(positions!.map((x) => x)),
      };
}

class StaffPerson {
  final int? malId;
  final String? url;
  final StaffImage? images;
  final String? name;

  StaffPerson({
    this.malId,
    this.url,
    this.images,
    this.name,
  });

  factory StaffPerson.fromRawJson(String str) => StaffPerson.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StaffPerson.fromJson(Map<String, dynamic> json) => StaffPerson(
        malId: json["mal_id"],
        url: json["url"],
        images: json["images"] == null ? null : StaffImage.fromJson(json["images"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "mal_id": malId,
        "url": url,
        "images": images?.toJson(),
        "name": name,
      };
}

class StaffImage {
  final JpgPicture? jpg;

  StaffImage({
    this.jpg,
  });

  factory StaffImage.fromRawJson(String str) => StaffImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StaffImage.fromJson(Map<String, dynamic> json) => StaffImage(
        jpg: json["jpg"] == null ? null : JpgPicture.fromJson(json["jpg"]),
      );

  Map<String, dynamic> toJson() => {
        "jpg": jpg?.toJson(),
      };
}

class JpgPicture {
  final String? imageUrl;

  JpgPicture({
    this.imageUrl,
  });

  factory JpgPicture.fromRawJson(String str) => JpgPicture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JpgPicture.fromJson(Map<String, dynamic> json) => JpgPicture(
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
      };
}
