// To parse this JSON data, do
//
//     final searchPlayerResponse = searchPlayerResponseFromJson(jsonString);

import 'dart:convert';

List<SearchPlayerResponse> searchPlayerResponseFromJson(String str) => List<SearchPlayerResponse>.from(json.decode(str).map((x) => SearchPlayerResponse.fromJson(x)));

String searchPlayerResponseToJson(List<SearchPlayerResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchPlayerResponse {
    SearchPlayerResponse({
      required this.name,
      this.hzPlayerName,
      required this.playerId,
      required this.portalId,
      required this.privacyFlag,
      this.retMsg,
    });

    get hirezName{
      if(hzPlayerName == null) return 'Private profile';
      return this.hzPlayerName;
    }

    String name;
    String? hzPlayerName;
    String playerId;
    String portalId;
    String privacyFlag;
    dynamic retMsg;

    factory SearchPlayerResponse.fromJson(Map<String, dynamic> json) => SearchPlayerResponse(
        name: json["Name"],
        hzPlayerName: json["hz_player_name"] == null ? null : json["hz_player_name"],
        playerId: json["player_id"],
        portalId: json["portal_id"],
        privacyFlag: json["privacy_flag"],
        retMsg: json["ret_msg"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "hz_player_name": hzPlayerName == null ? null : hzPlayerName,
        "player_id": playerId,
        "portal_id": portalId,
        "privacy_flag": privacyFlag,
        "ret_msg": retMsg,
    };
}
