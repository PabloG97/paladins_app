// To parse this JSON data, do
//
//     final getItemsResponse = getItemsResponseFromJson(jsonString);

import 'dart:convert';

List<GetItemsResponse> getItemsResponseFromJson(String str) => List<GetItemsResponse>.from(json.decode(str).map((x) => GetItemsResponse.fromJson(x)));
class GetItemsResponse {
    GetItemsResponse({
      required this.description,
      required this.deviceName,
      required this.iconId,
      required this.itemId,
      required this.price,
      required this.shortDesc,
      required this.championId,
      required this.itemIconUrl,
      required this.itemType,
      required this.rechargeSeconds,
      this.retMsg,
      required this.talentRewardLevel,
    });

    String description;
    String deviceName;
    int iconId;
    int itemId;
    int price;
    String shortDesc;
    int championId;
    String itemIconUrl;
    String itemType;
    int rechargeSeconds;
    dynamic retMsg;
    int talentRewardLevel;

    factory GetItemsResponse.fromJson(Map<String, dynamic> json) => GetItemsResponse(
        description: json["Description"],
        deviceName: json["DeviceName"],
        iconId: json["IconId"],
        itemId: json["ItemId"],
        price: json["Price"],
        shortDesc: json["ShortDesc"],
        championId: json["champion_id"],
        itemIconUrl: json["itemIcon_URL"],
        itemType: json["item_type"],
        rechargeSeconds: json["recharge_seconds"],
        retMsg: json["ret_msg"],
        talentRewardLevel: json["talent_reward_level"],
    );
}
// final itemTypeValues = EnumValues({
//     "Burn Card Damage Vendor": ItemType.BURN_CARD_DAMAGE_VENDOR,
//     "Burn Card Defense Vendor": ItemType.BURN_CARD_DEFENSE_VENDOR,
//     "Burn Card Healing Vendor": ItemType.BURN_CARD_HEALING_VENDOR,
//     "Burn Card Utility Vendor": ItemType.BURN_CARD_UTILITY_VENDOR,
//     "Card Vendor Rank 1 Epic": ItemType.CARD_VENDOR_RANK_1_EPIC,
//     "Card Vendor Rank 1 Rare": ItemType.CARD_VENDOR_RANK_1_RARE,
//     "Inventory Vendor - Champion Cards": ItemType.INVENTORY_VENDOR_CHAMPION_CARDS,
//     "Inventory Vendor - Talents": ItemType.INVENTORY_VENDOR_TALENTS,
//     "Inventory Vendor - Talents Default": ItemType.INVENTORY_VENDOR_TALENTS_DEFAULT,
//     "zDeprecated Card Vendor Rank 2": ItemType.Z_DEPRECATED_CARD_VENDOR_RANK_2,
//     "zDeprecated Card Vendor Rank 3": ItemType.Z_DEPRECATED_CARD_VENDOR_RANK_3,
//     "zDeprecated Card Vendor Rank 4": ItemType.Z_DEPRECATED_CARD_VENDOR_RANK_4
// });
