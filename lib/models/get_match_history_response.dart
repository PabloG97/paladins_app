// To parse this JSON data, do
//
//     final getMatchHistoryResponse = getMatchHistoryResponseFromJson(jsonString);

import 'dart:convert';

List<GetMatchHistoryResponse> getMatchHistoryResponseFromJson(String str) => List<GetMatchHistoryResponse>.from(json.decode(str).map((x) => GetMatchHistoryResponse.fromJson(x)));

String getMatchHistoryResponseToJson(List<GetMatchHistoryResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMatchHistoryResponse {
    GetMatchHistoryResponse({
      required this.activeId1,
      required this.activeId2,
      required this.activeId3,
      required this.activeId4,
      required this.activeLevel1,
      required this.activeLevel2,
      required this.activeLevel3,
      required this.activeLevel4,
      this.active1,
      this.active2,
      this.active3,
      this.active4,
      required this.assists,
      this.champion,
      required this.championId,
      required this.creeps,
      required this.damage,
      required this.damageBot,
      required this.damageDoneInHand,
      required this.damageMitigated,
      required this.damageStructure,
      required this.damageTaken,
      required this.damageTakenMagical,
      required this.damageTakenPhysical,
      required this.deaths,
      required this.distanceTraveled,
      required this.gold,
      required this.healing,
      required this.healingBot,
      required this.healingPlayerSelf,
      required this.itemId1,
      required this.itemId2,
      required this.itemId3,
      required this.itemId4,
      required this.itemId5,
      required this.itemId6,
      required this.itemLevel1,
      required this.itemLevel2,
      required this.itemLevel3,
      required this.itemLevel4,
      required this.itemLevel5,
      required this.itemLevel6,
      this.item1,
      this.item2,
      this.item3,
      this.item4,
      this.item5,
      this.item6,
      required this.killingSpree,
      required this.kills,
      required this.level,
      this.mapGame,
      required this.match,
      required this.matchQueueId,
      this.matchTime,
      required this.minutes,
      required this.multiKillMax,
      required this.objectiveAssists,
      this.queue,
      this.region,
      this.skin,
      required this.skinId,
      required this.surrendered,
      required this.taskForce,
      required this.team1Score,
      required this.team2Score,
      required this.timeInMatchSeconds,
      required this.wardsPlaced,
      this.winStatus,
      required this.winningTaskForce,
      required this.playerId,
      this.playerName,
      this.retMsg,
    });

    get kdaMatch {
      return '${this.kills}/${this.deaths}/${this.assists}';
    }

    get mode{
      if( this.queue == 'Team Deathmatch'){
        return 'TDM';
      }else if(this.queue == 'Team Deathmatch Training'){
        return 'TDM training';
      }else if(this.queue == 'Team Deathmatch Training'){
        return 'TDM training';
      }
      return this.queue;
    }


    int activeId1;
    int activeId2;
    int activeId3;
    int activeId4;
    int activeLevel1;
    int activeLevel2;
    int activeLevel3;
    int activeLevel4;
    String? active1;
    String? active2;
    String? active3;
    String? active4;
    int assists;
    String? champion;
    int championId;
    int creeps;
    int damage;
    int damageBot;
    int damageDoneInHand;
    int damageMitigated;
    int damageStructure;
    int damageTaken;
    int damageTakenMagical;
    int damageTakenPhysical;
    int deaths;
    int distanceTraveled;
    int gold;
    int healing;
    int healingBot;
    int healingPlayerSelf;
    int itemId1;
    int itemId2;
    int itemId3;
    int itemId4;
    int itemId5;
    int itemId6;
    int itemLevel1;
    int itemLevel2;
    int itemLevel3;
    int itemLevel4;
    int itemLevel5;
    int itemLevel6;
    String? item1;
    String? item2;
    String? item3;
    String? item4;
    String? item5;
    String? item6;
    int killingSpree;
    int kills;
    int level;
    String? mapGame;
    int match;
    int matchQueueId;
    String? matchTime;
    int minutes;
    int multiKillMax;
    int objectiveAssists;
    String? queue;
    String? region;
    String? skin;
    int skinId;
    int surrendered;
    int taskForce;
    int team1Score;
    int team2Score;
    int timeInMatchSeconds;
    int wardsPlaced;
    String? winStatus;
    int winningTaskForce;
    int playerId;
    String? playerName;
    dynamic retMsg;

    factory GetMatchHistoryResponse.fromJson(Map<String, dynamic> json) => GetMatchHistoryResponse(
        activeId1: json["ActiveId1"],
        activeId2: json["ActiveId2"],
        activeId3: json["ActiveId3"],
        activeId4: json["ActiveId4"],
        activeLevel1: json["ActiveLevel1"],
        activeLevel2: json["ActiveLevel2"],
        activeLevel3: json["ActiveLevel3"],
        activeLevel4: json["ActiveLevel4"],
        active1: json["Active_1"],
        active2: json["Active_2"],
        active3: json["Active_3"],
        active4: json["Active_4"],
        assists: json["Assists"],
        champion: json["Champion"],
        championId: json["ChampionId"],
        creeps: json["Creeps"],
        damage: json["Damage"],
        damageBot: json["Damage_Bot"],
        damageDoneInHand: json["Damage_Done_In_Hand"],
        damageMitigated: json["Damage_Mitigated"],
        damageStructure: json["Damage_Structure"],
        damageTaken: json["Damage_Taken"],
        damageTakenMagical: json["Damage_Taken_Magical"],
        damageTakenPhysical: json["Damage_Taken_Physical"],
        deaths: json["Deaths"],
        distanceTraveled: json["Distance_Traveled"],
        gold: json["Gold"],
        healing: json["Healing"],
        healingBot: json["Healing_Bot"],
        healingPlayerSelf: json["Healing_Player_Self"],
        itemId1: json["ItemId1"],
        itemId2: json["ItemId2"],
        itemId3: json["ItemId3"],
        itemId4: json["ItemId4"],
        itemId5: json["ItemId5"],
        itemId6: json["ItemId6"],
        itemLevel1: json["ItemLevel1"],
        itemLevel2: json["ItemLevel2"],
        itemLevel3: json["ItemLevel3"],
        itemLevel4: json["ItemLevel4"],
        itemLevel5: json["ItemLevel5"],
        itemLevel6: json["ItemLevel6"],
        item1: json["Item_1"],
        item2: json["Item_2"],
        item3: json["Item_3"],
        item4: json["Item_4"],
        item5: json["Item_5"],
        item6: json["Item_6"],
        killingSpree: json["Killing_Spree"],
        kills: json["Kills"],
        level: json["Level"],
        mapGame: json["Map_Game"],
        match: json["Match"],
        matchQueueId: json["Match_Queue_Id"],
        matchTime: json["Match_Time"],
        minutes: json["Minutes"],
        multiKillMax: json["Multi_kill_Max"],
        objectiveAssists: json["Objective_Assists"],
        queue: json["Queue"],
        region: json["Region"],
        skin: json["Skin"],
        skinId: json["SkinId"],
        surrendered: json["Surrendered"],
        taskForce: json["TaskForce"],
        team1Score: json["Team1Score"],
        team2Score: json["Team2Score"],
        timeInMatchSeconds: json["Time_In_Match_Seconds"],
        wardsPlaced: json["Wards_Placed"],
        winStatus: json["Win_Status"],
        winningTaskForce: json["Winning_TaskForce"],
        playerId: json["playerId"],
        playerName: json["playerName"],
        retMsg: json["ret_msg"],
    );

    Map<String, dynamic> toJson() => {
        "ActiveId1": activeId1,
        "ActiveId2": activeId2,
        "ActiveId3": activeId3,
        "ActiveId4": activeId4,
        "ActiveLevel1": activeLevel1,
        "ActiveLevel2": activeLevel2,
        "ActiveLevel3": activeLevel3,
        "ActiveLevel4": activeLevel4,
        "Active_1": active1,
        "Active_2": active2,
        "Active_3": active3,
        "Active_4": active4,
        "Assists": assists,
        "Champion": champion,
        "ChampionId": championId,
        "Creeps": creeps,
        "Damage": damage,
        "Damage_Bot": damageBot,
        "Damage_Done_In_Hand": damageDoneInHand,
        "Damage_Mitigated": damageMitigated,
        "Damage_Structure": damageStructure,
        "Damage_Taken": damageTaken,
        "Damage_Taken_Magical": damageTakenMagical,
        "Damage_Taken_Physical": damageTakenPhysical,
        "Deaths": deaths,
        "Distance_Traveled": distanceTraveled,
        "Gold": gold,
        "Healing": healing,
        "Healing_Bot": healingBot,
        "Healing_Player_Self": healingPlayerSelf,
        "ItemId1": itemId1,
        "ItemId2": itemId2,
        "ItemId3": itemId3,
        "ItemId4": itemId4,
        "ItemId5": itemId5,
        "ItemId6": itemId6,
        "ItemLevel1": itemLevel1,
        "ItemLevel2": itemLevel2,
        "ItemLevel3": itemLevel3,
        "ItemLevel4": itemLevel4,
        "ItemLevel5": itemLevel5,
        "ItemLevel6": itemLevel6,
        "Item_1": item1,
        "Item_2": item2,
        "Item_3": item3,
        "Item_4": item4,
        "Item_5": item5,
        "Item_6": item6,
        "Killing_Spree": killingSpree,
        "Kills": kills,
        "Level": level,
        "Map_Game": mapGame,
        "Match": match,
        "Match_Queue_Id": matchQueueId,
        "Match_Time": matchTime,
        "Minutes": minutes,
        "Multi_kill_Max": multiKillMax,
        "Objective_Assists": objectiveAssists,
        "Queue": queue,
        "Region": region,
        "Skin": skin,
        "SkinId": skinId,
        "Surrendered": surrendered,
        "TaskForce": taskForce,
        "Team1Score": team1Score,
        "Team2Score": team2Score,
        "Time_In_Match_Seconds": timeInMatchSeconds,
        "Wards_Placed": wardsPlaced,
        "Win_Status": winStatus,
        "Winning_TaskForce": winningTaskForce,
        "playerId": playerId,
        "playerName": playerName,
        "ret_msg": retMsg,
    };
}

