// To parse this JSON data, do
//
//     final getPlayerReponse = getPlayerReponseFromJson(jsonString);

import 'dart:convert';
import 'package:paladins_app/models/models.dart';



List<GetPlayer> getPlayerReponseFromJson(String str) => List<GetPlayer>.from(json.decode(str).map((x) => GetPlayer.fromJson(x)));

String getPlayerReponseToJson(List<GetPlayer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class Ranked {
    Ranked({
        required this.leaves,
        required this.losses,
        required this.name,
        required this.points,
        required this.prevRank,
        required this.rank,
        required this.season,
        required this.tier,
        required this.trend,
        required this.wins,
        required this.playerId,
        required this.retMsg,
    });

    int leaves;
    int losses;
    String name;
    int points;
    int prevRank;
    int rank;
    int season;
    int tier;
    int trend;
    int wins;
    dynamic playerId;
    dynamic retMsg;

    factory Ranked.fromJson(Map<String, dynamic> json) => Ranked(
        leaves: json["Leaves"],
        losses: json["Losses"],
        name: json["Name"],
        points: json["Points"],
        prevRank: json["PrevRank"],
        rank: json["Rank"],
        season: json["Season"],
        tier: json["Tier"],
        trend: json["Trend"],
        wins: json["Wins"],
        playerId: json["player_id"],
        retMsg: json["ret_msg"],
    );

    Map<String, dynamic> toJson() => {
        "Leaves": leaves,
        "Losses": losses,
        "Name": name,
        "Points": points,
        "PrevRank": prevRank,
        "Rank": rank,
        "Season": season,
        "Tier": tier,
        "Trend": trend,
        "Wins": wins,
        "player_id": playerId,
        "ret_msg": retMsg,
    };
}
