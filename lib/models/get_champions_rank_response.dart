// To parse this JSON data, do
//
//     final getChampionsRankResponse = getChampionsRankResponseFromJson(jsonString);

import 'dart:convert';

List<GetChampionsRankResponse> getChampionsRankResponseFromJson(String str) => List<GetChampionsRankResponse>.from(json.decode(str).map((x) => GetChampionsRankResponse.fromJson(x)));

String getChampionsRankResponseToJson(List<GetChampionsRankResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetChampionsRankResponse {
    GetChampionsRankResponse({
      required this.assists,
      required this.deaths,
      required this.gold,
      required this.kills,
      required this.lastPlayed,
      required this.losses,
      required this.minionKills,
      required this.minutes,
      required this.rank,
      required this.wins,
      required this.worshippers,
      required this.champion,
      required this.championId,
      required this.playerId,
      this.retMsg,
    });

    int assists;
    int deaths;
    int gold;
    int kills;
    String lastPlayed;
    int losses;
    int minionKills;
    int minutes;
    int rank;
    int wins;
    int worshippers;
    String champion;
    String championId;
    String playerId;
    dynamic retMsg;

    factory GetChampionsRankResponse.fromJson(Map<String, dynamic> json) => GetChampionsRankResponse(
        assists: json["Assists"],
        deaths: json["Deaths"],
        gold: json["Gold"],
        kills: json["Kills"],
        lastPlayed: json["LastPlayed"],
        losses: json["Losses"],
        minionKills: json["MinionKills"],
        minutes: json["Minutes"],
        rank: json["Rank"],
        wins: json["Wins"],
        worshippers: json["Worshippers"],
        champion: json["champion"],
        championId: json["champion_id"],
        playerId: json["player_id"],
        retMsg: json["ret_msg"],
    );

    Map<String, dynamic> toJson() => {
        "Assists": assists,
        "Deaths": deaths,
        "Gold": gold,
        "Kills": kills,
        "LastPlayed": lastPlayed,
        "Losses": losses,
        "MinionKills": minionKills,
        "Minutes": minutes,
        "Rank": rank,
        "Wins": wins,
        "Worshippers": worshippers,
        "champion": champion,
        "champion_id": championId,
        "player_id": playerId,
        "ret_msg": retMsg,
    };
}
