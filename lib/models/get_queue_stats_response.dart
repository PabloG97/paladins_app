// To parse this JSON data, do
//
//     final getQueueStatsResponse = getQueueStatsResponseFromJson(jsonString);

import 'dart:convert';

List<GetQueueStatsResponse> getQueueStatsResponseFromJson(String str) => List<GetQueueStatsResponse>.from(json.decode(str).map((x) => GetQueueStatsResponse.fromJson(x)));

String getQueueStatsResponseToJson(List<GetQueueStatsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetQueueStatsResponse {
    GetQueueStatsResponse({
      required this.assists,
      required this.champion,
      required this.championId,
      required this.deaths,
      required this.gold,
      required this.kills,
      required this.lastPlayed,
      required this.losses,
      required this.matches,
      required this.minutes,
      required this.queue,
      required this.wins,
      required this.playerId,
        this.retMsg,
    });

    int assists;
    String champion;
    int championId;
    int deaths;
    int gold;
    int kills;
    String lastPlayed;
    int losses;
    int matches;
    int minutes;
    String queue;
    int wins;
    String playerId;
    dynamic retMsg;

    factory GetQueueStatsResponse.fromJson(Map<String, dynamic> json) => GetQueueStatsResponse(
        assists: json["Assists"],
        champion: json["Champion"],
        championId: json["ChampionId"],
        deaths: json["Deaths"],
        gold: json["Gold"],
        kills: json["Kills"],
        lastPlayed: json["LastPlayed"],
        losses: json["Losses"],
        matches: json["Matches"],
        minutes: json["Minutes"],
        queue: json["Queue"],
        wins: json["Wins"],
        playerId: json["player_id"],
        retMsg: json["ret_msg"],
    );

    Map<String, dynamic> toJson() => {
        "Assists": assists,
        "Champion": champion,
        "ChampionId": championId,
        "Deaths": deaths,
        "Gold": gold,
        "Kills": kills,
        "LastPlayed": lastPlayed,
        "Losses": losses,
        "Matches": matches,
        "Minutes": minutes,
        "Queue": queue,
        "Wins": wins,
        "player_id": playerId,
        "ret_msg": retMsg,
    };
}
