// To parse this JSON data, do
//
//     final getMatchPlayerDetails = getMatchPlayerDetailsFromJson(jsonString);

import 'dart:convert';

List<MatchPlayerDetails> getMatchPlayerDetailsFromJson(String str) => List<MatchPlayerDetails>.from(json.decode(str).map((x) => MatchPlayerDetails.fromJson(x)));

String getMatchPlayerDetailsToJson(List<MatchPlayerDetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MatchPlayerDetails {
    MatchPlayerDetails({
        required this.accountChampionsPlayed,
        required this.accountLevel,
        required this.championId,
        required this.championLevel,
        this.championName,
        required this.masteryLevel,
        required this.match,
        required this.queue,
        required this.skin,
        required this.skinId,
        required this.tier,
        required this.mapGame,
        required this.playerCreated,
        required this.playerId,
        required this.playerName,
        required this.playerPortalId,
        required this.playerPortalUserId,
        required this.playerRegion,
        this.retMsg,
        required this.taskForce,
        required this.tierLosses,
        required this.tierWins,
    });

    get titleProfile{
      if(this.playerName != '')
        return this.playerName;
      else
        return '<Private.profile>';
    }

    int accountChampionsPlayed;
    int accountLevel;
    int championId;
    int championLevel;
    String? championName;
    int masteryLevel;
    int match;
    String queue;
    String skin;
    int skinId;
    int tier;
    String mapGame;
    String playerCreated;
    String playerId;
    String playerName;
    String playerPortalId;
    String playerPortalUserId;
    String playerRegion;
    String? retMsg;
    int taskForce;
    int tierLosses;
    int tierWins;

    factory MatchPlayerDetails.fromJson(Map<String, dynamic> json) => MatchPlayerDetails(
        accountChampionsPlayed: json["Account_Champions_Played"],
        accountLevel: json["Account_Level"],
        championId: json["ChampionId"],
        championLevel: json["ChampionLevel"],
        championName: json["ChampionName"],
        masteryLevel: json["Mastery_Level"],
        match: json["Match"],
        queue: json["Queue"],
        skin: json["Skin"],
        skinId: json["SkinId"],
        tier: json["Tier"],
        mapGame: json["mapGame"],
        playerCreated: json["playerCreated"],
        playerId: json["playerId"],
        playerName: json["playerName"],
        playerPortalId: json["playerPortalId"],
        playerPortalUserId: json["playerPortalUserId"],
        playerRegion: json["playerRegion"],
        retMsg: json["ret_msg"],
        taskForce: json["taskForce"],
        tierLosses: json["tierLosses"],
        tierWins: json["tierWins"],
    );

    Map<String, dynamic> toJson() => {
        "Account_Champions_Played": accountChampionsPlayed,
        "Account_Level": accountLevel,
        "ChampionId": championId,
        "ChampionLevel": championLevel,
        "ChampionName": championName,
        "Mastery_Level": masteryLevel,
        "Match": match,
        "Queue": queue,
        "Skin": skin,
        "SkinId": skinId,
        "Tier": tier,
        "mapGame": mapGame,
        "playerCreated": playerCreated,
        "playerId": playerId,
        "playerName": playerName,
        "playerPortalId": playerPortalId,
        "playerPortalUserId": playerPortalUserId,
        "playerRegion": playerRegion,
        "ret_msg": retMsg,
        "taskForce": taskForce,
        "tierLosses": tierLosses,
        "tierWins": tierWins,
    };
}
