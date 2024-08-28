import 'package:anime_library/utils/app_export.dart';

class AnimeStatsModel {
  final DataModel? data;

  AnimeStatsModel({
    this.data,
  });

  factory AnimeStatsModel.fromRawJson(String str) => AnimeStatsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnimeStatsModel.fromJson(Map<String, dynamic> json) => AnimeStatsModel(
        data: json["data"] == null ? null : DataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class DataModel {
  final int? watching;
  final int? completed;
  final int? onHold;
  final int? dropped;
  final int? planToWatch;
  final int? total;
  final List<Score>? scores;

  DataModel({
    this.watching,
    this.completed,
    this.onHold,
    this.dropped,
    this.planToWatch,
    this.total,
    this.scores,
  });

  factory DataModel.fromRawJson(String str) => DataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        watching: json["watching"],
        completed: json["completed"],
        onHold: json["on_hold"],
        dropped: json["dropped"],
        planToWatch: json["plan_to_watch"],
        total: json["total"],
        scores: json["scores"] == null ? [] : List<Score>.from(json["scores"]!.map((x) => Score.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "watching": watching,
        "completed": completed,
        "on_hold": onHold,
        "dropped": dropped,
        "plan_to_watch": planToWatch,
        "total": total,
        "scores": scores == null ? [] : List<dynamic>.from(scores!.map((x) => x.toJson())),
      };
}

class Score {
  final int? score;
  final int? votes;
  final double? percentage;

  Score({
    this.score,
    this.votes,
    this.percentage,
  });

  factory Score.fromRawJson(String str) => Score.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        score: json["score"],
        votes: json["votes"],
        percentage: json["percentage"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "score": score,
        "votes": votes,
        "percentage": percentage,
      };
}
