import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:live_score/features/scores/_.export.dart';

class ScoresResponseModel {
  ScoresResponseModel({
    this.success,
    this.data,
  });

  factory ScoresResponseModel.fromRawJson(final String str) => ScoresResponseModel.fromJson(json.decode(str));

  factory ScoresResponseModel.fromJson(final Map<String, dynamic> json) => ScoresResponseModel(
        success: json["success"],
        data: json["data"] == null ? null : ScoresResponseModelData.fromJson(json["data"]),
      );

  List<ScoresMatchModel> get matches => data?.match ?? [];
  final bool? success;
  final ScoresResponseModelData? data;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class ScoresResponseModelData {
  ScoresResponseModelData({
    this.match,
  });

  factory ScoresResponseModelData.fromRawJson(final String str) => ScoresResponseModelData.fromJson(json.decode(str));

  factory ScoresResponseModelData.fromJson(final Map<String, dynamic> json) => ScoresResponseModelData(
        match: json["match"] == null
            ? []
            : List<ScoresMatchModel>.from(json["match"]!.map((final x) => ScoresMatchModel.fromJson(x))),
      );
  final List<ScoresMatchModel>? match;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "match": match == null ? [] : List<dynamic>.from(match!.map((final x) => x.toJson())),
      };
}

class ScoresMatchModel extends MatchEntity {
  ScoresMatchModel({
    required super.home,
    required super.status,
    required super.id,
    required super.time,
    required super.away,
    required super.scores,
    super.country,
    super.location,
    super.competition,
    super.lastChanged,
    super.added,
    super.scheduled,
    this.federation,
    this.fixtureId,
    this.odds,
    this.outcomes,
    this.urls,
  });

  factory ScoresMatchModel.fromRawJson(final String str) => ScoresMatchModel.fromJson(json.decode(str));

  factory ScoresMatchModel.fromJson(final Map<String, dynamic> json) => ScoresMatchModel(
        country: json["country"] == null ? null : ScoreCountryModel.fromJson(json["country"]),
        lastChanged: json["last_changed"] == null
            ? null
            : DateFormat('yyyy-MM-dd HH:mm:ss').parse(json["last_changed"], true).toLocal(),
        home: json["home"] == null ? ScoreAwayModel(name: 'Undefined') : ScoreAwayModel.fromJson(json["home"]),
        added: json["added"] == null ? null : DateFormat('yyyy-MM-dd HH:mm:ss').parse(json["added"], true).toLocal(),
        status: MatchStatusses.fromKey(json["status"]),
        federation: json["federation"],
        location: json["location"],
        scheduled: json["scheduled"],
        competition: json["competition"] == null ? null : ScoreCompetitionModel.fromJson(json["competition"]),
        id: json["id"],
        time: json["time"],
        fixtureId: json["fixture_id"],
        odds: json["odds"] == null ? null : ScoreOddsModel.fromJson(json["odds"]),
        away: json["away"] == null ? ScoreAwayModel(name: 'Undefined') : ScoreAwayModel.fromJson(json["away"]),
        outcomes: json["outcomes"] == null ? null : ScoreOutcomesModel.fromJson(json["outcomes"]),
        scores: json["scores"] == null ? ScoreScoresModel(score: '0 - 0') : ScoreScoresModel.fromJson(json["scores"]),
        urls: json["urls"] == null ? null : ScoreUrlsModel.fromJson(json["urls"]),
      );

  final Map<String, dynamic>? federation;
  final int? fixtureId;
  final ScoreOddsModel? odds;
  final ScoreOutcomesModel? outcomes;
  final ScoreUrlsModel? urls;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "country": country?.toJson(),
        "last_changed": lastChanged?.toIso8601String(),
        "home": home.toJson(),
        "added": added?.toIso8601String(),
        "status": status,
        "federation": federation,
        "location": location,
        "scheduled": scheduled,
        "competition": competition?.toJson(),
        "id": id,
        "time": time,
        "fixture_id": fixtureId,
        "odds": odds?.toJson(),
        "away": away.toJson(),
        "outcomes": outcomes?.toJson(),
        "scores": scores.toJson(),
        "urls": urls?.toJson(),
      };
}

class ScoreAwayModel {
  ScoreAwayModel({
    this.stadium,
    this.id,
    this.logo,
    this.name,
    this.countryId,
  });

  factory ScoreAwayModel.fromRawJson(final String str) => ScoreAwayModel.fromJson(json.decode(str));

  factory ScoreAwayModel.fromJson(final Map<String, dynamic> json) => ScoreAwayModel(
        stadium: json["stadium"],
        id: json["id"],
        logo: json["logo"],
        name: json["name"],
        countryId: json["country_id"],
      );
  final String? stadium;
  final int? id;
  final String? logo;
  final String? name;
  final int? countryId;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "stadium": stadium,
        "id": id,
        "logo": logo,
        "name": name,
        "country_id": countryId,
      };
}

class ScoreCompetitionModel {
  ScoreCompetitionModel({
    this.tier,
    this.isCup,
    this.hasGroups,
    this.id,
    this.active,
    this.name,
    this.isLeague,
    this.nationalTeamsOnly,
  });

  factory ScoreCompetitionModel.fromRawJson(final String str) => ScoreCompetitionModel.fromJson(json.decode(str));

  factory ScoreCompetitionModel.fromJson(final Map<String, dynamic> json) => ScoreCompetitionModel(
        tier: json["tier"],
        isCup: json["is_cup"],
        hasGroups: json["has_groups"],
        id: json["id"],
        active: json["active"],
        name: json["name"],
        isLeague: json["is_league"],
        nationalTeamsOnly: json["national_teams_only"],
      );
  final int? tier;
  final bool? isCup;
  final bool? hasGroups;
  final int? id;
  final bool? active;
  final String? name;
  final bool? isLeague;
  final bool? nationalTeamsOnly;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "tier": tier,
        "is_cup": isCup,
        "has_groups": hasGroups,
        "id": id,
        "active": active,
        "name": name,
        "is_league": isLeague,
        "national_teams_only": nationalTeamsOnly,
      };
}

class ScoreCountryModel {
  ScoreCountryModel({
    this.isReal,
    this.id,
    this.uefaCode,
    this.name,
    this.fifaCode,
    this.flag,
  });

  factory ScoreCountryModel.fromRawJson(final String str) => ScoreCountryModel.fromJson(json.decode(str));

  factory ScoreCountryModel.fromJson(final Map<String, dynamic> json) => ScoreCountryModel(
        isReal: json["is_real"],
        id: json["id"],
        uefaCode: json["uefa_code"],
        name: json["name"],
        fifaCode: json["fifa_code"],
        flag: json["flag"],
      );
  final bool? isReal;
  final int? id;
  final String? uefaCode;
  final String? name;
  final String? fifaCode;
  final String? flag;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "is_real": isReal,
        "id": id,
        "uefa_code": uefaCode,
        "name": name,
        "fifa_code": fifaCode,
        "flag": flag,
      };
}

class ScoreOddsModel {
  ScoreOddsModel({
    this.live,
    this.pre,
  });

  factory ScoreOddsModel.fromRawJson(final String str) => ScoreOddsModel.fromJson(json.decode(str));

  factory ScoreOddsModel.fromJson(final Map<String, dynamic> json) => ScoreOddsModel(
        live: json["live"] == null ? null : ScoreLiveModel.fromJson(json["live"]),
        pre: json["pre"] == null ? null : ScoreLiveModel.fromJson(json["pre"]),
      );
  final ScoreLiveModel? live;
  final ScoreLiveModel? pre;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "live": live?.toJson(),
        "pre": pre?.toJson(),
      };
}

class ScoreLiveModel {
  ScoreLiveModel({
    this.the1,
    this.the2,
    this.x,
  });

  factory ScoreLiveModel.fromRawJson(final String str) => ScoreLiveModel.fromJson(json.decode(str));

  factory ScoreLiveModel.fromJson(final Map<String, dynamic> json) => ScoreLiveModel(
        the1: json["1"]?.toDouble(),
        the2: json["2"]?.toDouble(),
        x: json["X"]?.toDouble(),
      );
  final double? the1;
  final double? the2;
  final double? x;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "1": the1,
        "2": the2,
        "X": x,
      };
}

class ScoreOutcomesModel {
  ScoreOutcomesModel({
    this.halfTime,
    this.fullTime,
    this.extraTime,
    this.penaltyShootout,
  });

  factory ScoreOutcomesModel.fromRawJson(final String str) => ScoreOutcomesModel.fromJson(json.decode(str));

  factory ScoreOutcomesModel.fromJson(final Map<String, dynamic> json) => ScoreOutcomesModel(
        halfTime: json["half_time"],
        fullTime: json["full_time"],
        extraTime: json["extra_time"],
        penaltyShootout: json["penalty_shootout"],
      );
  final dynamic halfTime;
  final dynamic fullTime;
  final dynamic extraTime;
  final dynamic penaltyShootout;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "half_time": halfTime,
        "full_time": fullTime,
        "extra_time": extraTime,
        "penalty_shootout": penaltyShootout,
      };
}

class ScoreScoresModel {
  ScoreScoresModel({
    this.score,
    this.htScore,
    this.ftScore,
    this.etScore,
    this.psScore,
  });

  factory ScoreScoresModel.fromRawJson(final String str) => ScoreScoresModel.fromJson(json.decode(str));

  factory ScoreScoresModel.fromJson(final Map<String, dynamic> json) => ScoreScoresModel(
        score: json["score"] == '? - ?' ? null : json["score"],
        htScore: json["ht_score"],
        ftScore: json["ft_score"],
        etScore: json["et_score"],
        psScore: json["ps_score"],
      );
  final String? score;
  final String? htScore;
  final String? ftScore;
  final String? etScore;
  final String? psScore;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "score": score,
        "ht_score": htScore,
        "ft_score": ftScore,
        "et_score": etScore,
        "ps_score": psScore,
      };
}

class ScoreUrlsModel {
  ScoreUrlsModel({
    this.events,
    this.statistics,
    this.lineups,
    this.head2Head,
  });

  factory ScoreUrlsModel.fromRawJson(final String str) => ScoreUrlsModel.fromJson(json.decode(str));

  factory ScoreUrlsModel.fromJson(final Map<String, dynamic> json) => ScoreUrlsModel(
        events: json["events"],
        statistics: json["statistics"],
        lineups: json["lineups"],
        head2Head: json["head2head"],
      );
  final String? events;
  final String? statistics;
  final String? lineups;
  final String? head2Head;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "events": events,
        "statistics": statistics,
        "lineups": lineups,
        "head2head": head2Head,
      };
}
