// To parse this JSON data, do
//
//     final getMatchDetailsResponse = getMatchDetailsResponseFromJson(jsonString);

import 'dart:convert';

List<GetMatchDetailsResponse> getMatchDetailsResponseFromJson(String str) => List<GetMatchDetailsResponse>.from(json.decode(str).map((x) => GetMatchDetailsResponse.fromJson(x)));

String getMatchDetailsResponseToJson(List<GetMatchDetailsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMatchDetailsResponse {
    GetMatchDetailsResponse({
      required this.accountLevel,
      required this.activeId1,
      required this.activeId2,
      required this.activeId3,
      required this.activeId4,
      required this.activeLevel1,
      required this.activeLevel2,
      required this.activeLevel3,
      required this.activeLevel4,
      this.activePlayerId,
      required this.assists,
      required this.banId1,
      required this.banId2,
      required this.banId3,
      required this.banId4,
      required this.banId5,
      required this.banId6,
      required this.ban1,
      required this.ban2,
      required this.ban3,
      required this.ban4,
      required this.ban5,
      required this.ban6,
      required this.campsCleared,
      required this.championId,
      required this.damageBot,
      required this.damageDoneInHand,
      required this.damageDoneMagical,
      required this.damageDonePhysical,
      required this.damageMitigated,
      required this.damagePlayer,
      required this.damageTaken,
      required this.damageTakenMagical,
      required this.damageTakenPhysical,
      required this.deaths,
      required this.distanceTraveled,
      this.entryDatetime,
      required this.finalMatchLevel,
      required this.goldEarned,
      required this.goldPerMinute,
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
      required this.itemActive1,
      required this.itemActive2,
      required this.itemActive3,
      required this.itemActive4,
      required this.itemPurch1,
      required this.itemPurch2,
      required this.itemPurch3,
      required this.itemPurch4,
      required this.itemPurch5,
      required this.itemPurch6,
      required this.killingSpree,
      required this.killsBot,
      required this.killsDouble,
      required this.killsFireGiant,
      required this.killsFirstBlood,
      required this.killsGoldFury,
      required this.killsPenta,
      required this.killsPhoenix,
      required this.killsPlayer,
      required this.killsQuadra,
      required this.killsSiegeJuggernaut,
      required this.killsSingle,
      required this.killsTriple,
      required this.killsWildJuggernaut,
      required this.leagueLosses,
      required this.leaguePoints,
      required this.leagueTier,
      required this.leagueWins,
      required this.mapGame,
      required this.masteryLevel,
      required this.match,
      required this.matchDuration,
      this.mergedPlayers,
      required this.minutes,
      required this.multiKillMax,
      required this.objectiveAssists,
      required this.partyId,
      required this.platform,
      required this.rankStatLeague,
      required this.referenceName,
      required this.region,
      required this.skin,
      required this.skinId,
      required this.structureDamage,
      required this.surrendered,
      required this.taskForce,
      required this.team1Score,
      required this.team2Score,
      required this.teamId,
      required this.teamName,
      required this.timeInMatchSeconds,
      required this.towersDestroyed,
      required this.wardsPlaced,
      required this.winStatus,
      required this.winningTaskForce,
      required this.hasReplay,
      this.hzGamerTag,
      this.hzPlayerName,
      required this.matchQueueId,
      required this.name,
      required this.playerId,
      required this.playerName,
      this.playerPortalId,
      this.playerPortalUserId,
      this.retMsg,
    });

    get kdRatio {
      return this.killsPlayer / this.deaths;
    }

    get kda{
      return '${this.killsPlayer}/${this.deaths}/${this.assists}';
    }

    int accountLevel;
    int activeId1;
    int activeId2;
    int activeId3;
    int activeId4;
    int activeLevel1;
    int activeLevel2;
    int activeLevel3;
    int activeLevel4;
    String? activePlayerId;
    int assists;
    int banId1;
    int banId2;
    int banId3;
    int banId4;
    int banId5;
    int banId6;
    String? ban1;
    String? ban2;
    String? ban3;
    String? ban4;
    String? ban5;
    String? ban6;
    int campsCleared;
    int championId;
    int damageBot;
    int damageDoneInHand;
    int damageDoneMagical;
    int damageDonePhysical;
    int damageMitigated;
    int damagePlayer;
    int damageTaken;
    int damageTakenMagical;
    int damageTakenPhysical;
    int deaths;
    int distanceTraveled;
    String? entryDatetime;
    int finalMatchLevel;
    int goldEarned;
    int goldPerMinute;
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
    String? itemActive1;
    String? itemActive2;
    String? itemActive3;
    String? itemActive4;
    String? itemPurch1;
    String? itemPurch2;
    String? itemPurch3;
    String? itemPurch4;
    String? itemPurch5;
    String? itemPurch6;
    int killingSpree;
    int killsBot;
    int killsDouble;
    int killsFireGiant;
    int killsFirstBlood;
    int killsGoldFury;
    int killsPenta;
    int killsPhoenix;
    int killsPlayer;
    int killsQuadra;
    int killsSiegeJuggernaut;
    int killsSingle;
    int killsTriple;
    int killsWildJuggernaut;
    int leagueLosses;
    int leaguePoints;
    int leagueTier;
    int leagueWins;
    String mapGame;
    int masteryLevel;
    int match;
    int matchDuration;
    List<MergedPlayer>? mergedPlayers;
    int minutes;
    int multiKillMax;
    int objectiveAssists;
    int partyId;
    String platform;
    int rankStatLeague;
    String referenceName;
    String region;
    String skin;
    int skinId;
    int structureDamage;
    int surrendered;
    int taskForce;
    int team1Score;
    int team2Score;
    int teamId;
    String teamName;
    int timeInMatchSeconds;
    int towersDestroyed;
    int wardsPlaced;
    String winStatus;
    int winningTaskForce;
    String hasReplay;
    dynamic hzGamerTag;
    dynamic hzPlayerName;
    int matchQueueId;
    String name;
    String playerId;
    String playerName;
    String? playerPortalId;
    String? playerPortalUserId;
    dynamic retMsg;
    bool hasGroup = false;
    String partyName = 'Solo';

    factory GetMatchDetailsResponse.fromJson(Map<String, dynamic> json) => GetMatchDetailsResponse(
        accountLevel: json["Account_Level"],
        activeId1: json["ActiveId1"],
        activeId2: json["ActiveId2"],
        activeId3: json["ActiveId3"],
        activeId4: json["ActiveId4"],
        activeLevel1: json["ActiveLevel1"],
        activeLevel2: json["ActiveLevel2"],
        activeLevel3: json["ActiveLevel3"],
        activeLevel4: json["ActiveLevel4"],
        activePlayerId: json["ActivePlayerId"],
        assists: json["Assists"],
        banId1: json["BanId1"],
        banId2: json["BanId2"],
        banId3: json["BanId3"],
        banId4: json["BanId4"],
        banId5: json["BanId5"],
        banId6: json["BanId6"],
        ban1: json["Ban_1"],
        ban2: json["Ban_2"],
        ban3: json["Ban_3"],
        ban4: json["Ban_4"],
        ban5: json["Ban_5"],
        ban6: json["Ban_6"],
        campsCleared: json["Camps_Cleared"],
        championId: json["ChampionId"],
        damageBot: json["Damage_Bot"],
        damageDoneInHand: json["Damage_Done_In_Hand"],
        damageDoneMagical: json["Damage_Done_Magical"],
        damageDonePhysical: json["Damage_Done_Physical"],
        damageMitigated: json["Damage_Mitigated"],
        damagePlayer: json["Damage_Player"],
        damageTaken: json["Damage_Taken"],
        damageTakenMagical: json["Damage_Taken_Magical"],
        damageTakenPhysical: json["Damage_Taken_Physical"],
        deaths: json["Deaths"],
        distanceTraveled: json["Distance_Traveled"],
        entryDatetime: json["Entry_Datetime"],
        finalMatchLevel: json["Final_Match_Level"],
        goldEarned: json["Gold_Earned"],
        goldPerMinute: json["Gold_Per_Minute"],
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
        itemActive1: json["Item_Active_1"],
        itemActive2: json["Item_Active_2"],
        itemActive3: json["Item_Active_3"],
        itemActive4: json["Item_Active_4"],
        itemPurch1: json["Item_Purch_1"],
        itemPurch2: json["Item_Purch_2"],
        itemPurch3: json["Item_Purch_3"],
        itemPurch4: json["Item_Purch_4"],
        itemPurch5: json["Item_Purch_5"],
        itemPurch6: json["Item_Purch_6"],
        killingSpree: json["Killing_Spree"],
        killsBot: json["Kills_Bot"],
        killsDouble: json["Kills_Double"],
        killsFireGiant: json["Kills_Fire_Giant"],
        killsFirstBlood: json["Kills_First_Blood"],
        killsGoldFury: json["Kills_Gold_Fury"],
        killsPenta: json["Kills_Penta"],
        killsPhoenix: json["Kills_Phoenix"],
        killsPlayer: json["Kills_Player"],
        killsQuadra: json["Kills_Quadra"],
        killsSiegeJuggernaut: json["Kills_Siege_Juggernaut"],
        killsSingle: json["Kills_Single"],
        killsTriple: json["Kills_Triple"],
        killsWildJuggernaut: json["Kills_Wild_Juggernaut"],
        leagueLosses: json["League_Losses"],
        leaguePoints: json["League_Points"],
        leagueTier: json["League_Tier"],
        leagueWins: json["League_Wins"],
        mapGame: json["Map_Game"],
        masteryLevel: json["Mastery_Level"],
        match: json["Match"],
        matchDuration: json["Match_Duration"],
        mergedPlayers: json["MergedPlayers"] == null ? null : List<MergedPlayer>.from(json["MergedPlayers"].map((x) => MergedPlayer.fromJson(x))),
        minutes: json["Minutes"],
        multiKillMax: json["Multi_kill_Max"],
        objectiveAssists: json["Objective_Assists"],
        partyId: json["PartyId"],
        platform: json["Platform"],
        rankStatLeague: json["Rank_Stat_League"],
        referenceName: json["Reference_Name"],
        region: json["Region"],
        skin: json["Skin"],
        skinId: json["SkinId"],
        structureDamage: json["Structure_Damage"],
        surrendered: json["Surrendered"],
        taskForce: json["TaskForce"],
        team1Score: json["Team1Score"],
        team2Score: json["Team2Score"],
        teamId: json["TeamId"],
        teamName: json["Team_Name"],
        timeInMatchSeconds: json["Time_In_Match_Seconds"],
        towersDestroyed: json["Towers_Destroyed"],
        wardsPlaced: json["Wards_Placed"],
        winStatus: json["Win_Status"],
        winningTaskForce: json["Winning_TaskForce"],
        hasReplay: json["hasReplay"],
        hzGamerTag: json["hz_gamer_tag"],
        hzPlayerName: json["hz_player_name"],
        matchQueueId: json["match_queue_id"],
        name: json["name"],
        playerId: json["playerId"],
        playerName: json["playerName"],
        playerPortalId: json["playerPortalId"] == null ? null : json["playerPortalId"],
        playerPortalUserId: json["playerPortalUserId"] == null ? null : json["playerPortalUserId"],
        retMsg: json["ret_msg"],
    );

    Map<String, dynamic> toJson() => {
        "Account_Level": accountLevel,
        "ActiveId1": activeId1,
        "ActiveId2": activeId2,
        "ActiveId3": activeId3,
        "ActiveId4": activeId4,
        "ActiveLevel1": activeLevel1,
        "ActiveLevel2": activeLevel2,
        "ActiveLevel3": activeLevel3,
        "ActiveLevel4": activeLevel4,
        "ActivePlayerId": activePlayerId,
        "Assists": assists,
        "BanId1": banId1,
        "BanId2": banId2,
        "BanId3": banId3,
        "BanId4": banId4,
        "BanId5": banId5,
        "BanId6": banId6,
        "Ban_1": ban1,
        "Ban_2": ban2,
        "Ban_3": ban3,
        "Ban_4": ban4,
        "Ban_5": ban5,
        "Ban_6": ban6,
        "Camps_Cleared": campsCleared,
        "ChampionId": championId,
        "Damage_Bot": damageBot,
        "Damage_Done_In_Hand": damageDoneInHand,
        "Damage_Done_Magical": damageDoneMagical,
        "Damage_Done_Physical": damageDonePhysical,
        "Damage_Mitigated": damageMitigated,
        "Damage_Player": damagePlayer,
        "Damage_Taken": damageTaken,
        "Damage_Taken_Magical": damageTakenMagical,
        "Damage_Taken_Physical": damageTakenPhysical,
        "Deaths": deaths,
        "Distance_Traveled": distanceTraveled,
        "Entry_Datetime": entryDatetime,
        "Final_Match_Level": finalMatchLevel,
        "Gold_Earned": goldEarned,
        "Gold_Per_Minute": goldPerMinute,
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
        "Item_Active_1": itemActive1,
        "Item_Active_2": itemActive2,
        "Item_Active_3": itemActive3,
        "Item_Active_4": itemActive4,
        "Item_Purch_1": itemPurch1,
        "Item_Purch_2": itemPurch2,
        "Item_Purch_3": itemPurch3,
        "Item_Purch_4": itemPurch4,
        "Item_Purch_5": itemPurch5,
        "Item_Purch_6": itemPurch6,
        "Killing_Spree": killingSpree,
        "Kills_Bot": killsBot,
        "Kills_Double": killsDouble,
        "Kills_Fire_Giant": killsFireGiant,
        "Kills_First_Blood": killsFirstBlood,
        "Kills_Gold_Fury": killsGoldFury,
        "Kills_Penta": killsPenta,
        "Kills_Phoenix": killsPhoenix,
        "Kills_Player": killsPlayer,
        "Kills_Quadra": killsQuadra,
        "Kills_Siege_Juggernaut": killsSiegeJuggernaut,
        "Kills_Single": killsSingle,
        "Kills_Triple": killsTriple,
        "Kills_Wild_Juggernaut": killsWildJuggernaut,
        "League_Losses": leagueLosses,
        "League_Points": leaguePoints,
        "League_Tier": leagueTier,
        "League_Wins": leagueWins,
        "Map_Game": mapGame,
        "Mastery_Level": masteryLevel,
        "Match": match,
        "Match_Duration": matchDuration,
        "MergedPlayers": mergedPlayers == null ? null : mergedPlayers,
        "Minutes": minutes,
        "Multi_kill_Max": multiKillMax,
        "Objective_Assists": objectiveAssists,
        "PartyId": partyId,
        "Platform": platform,
        "Rank_Stat_League": rankStatLeague,
        "Reference_Name": referenceName,
        "Region": region,
        "Skin": skin,
        "SkinId": skinId,
        "Structure_Damage": structureDamage,
        "Surrendered": surrendered,
        "TaskForce": taskForce,
        "Team1Score": team1Score,
        "Team2Score": team2Score,
        "TeamId": teamId,
        "Team_Name": teamName,
        "Time_In_Match_Seconds": timeInMatchSeconds,
        "Towers_Destroyed": towersDestroyed,
        "Wards_Placed": wardsPlaced,
        "Win_Status": winStatus,
        "Winning_TaskForce": winningTaskForce,
        "hasReplay": hasReplay,
        "hz_gamer_tag": hzGamerTag,
        "hz_player_name": hzPlayerName,
        "match_queue_id": matchQueueId,
        "name": name,
        "playerId": playerId,
        "playerName": playerName,
        "playerPortalId": playerPortalId == null ? null : playerPortalId,
        "playerPortalUserId": playerPortalUserId == null ? null : playerPortalUserId,
        "ret_msg": retMsg,
    };
}

class MergedPlayer {
    MergedPlayer({
        this.mergeDatetime,
        this.playerId,
        this.portalId,
    });

    String? mergeDatetime;
    String? playerId;
    String? portalId;

    factory MergedPlayer.fromJson(Map<String, dynamic> json) => MergedPlayer(
        mergeDatetime: json["merge_datetime"],
        playerId: json["playerId"],
        portalId: json["portalId"],
    );

    Map<String, dynamic> toJson() => {
        "merge_datetime": mergeDatetime,
        "playerId": playerId,
        "portalId": portalId,
    };
}