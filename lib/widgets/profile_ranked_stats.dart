import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paladins_app/models/models.dart';
import 'package:paladins_app/providers/providers.dart';

class ProfileRankedStats extends StatelessWidget {

  final GetPlayer getPlayer;
  final List<GetQueueStatsResponse> getQueueStatsResponse;

  const ProfileRankedStats({Key? key, required this.getPlayer, required this.getQueueStatsResponse}) : super(key: key);

  // DateTime lastLogin = getPlayer.lastLoginDatetime; 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String mainRole = DataAnalyzer.mainRole(getQueueStatsResponse); 
    return Container(
      width: double.infinity,
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, top: 0, bottom: 2),
            child: Text( 'Ranked stats:' , style: Theme.of(context).textTheme.headline3,  overflow: TextOverflow.ellipsis, maxLines: 2)
          
          ),
          SizedBox(height: 10,),

           Row( 
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.33,
                  child: Column(
                    children: [
                      _TitleAndDescription(title: 'Winrate:', description: getPlayer.winRateRanked.toStringAsFixed(2)+'%')
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.33,
                  child: Column(
                    children: [
                      _TitleAndDescription(title: 'Main:', description: mainRole)
                    ],
                  ),
                ), 
                Container(
                  width: size.width * 0.33,
                  child: Column(
                    children: [
                      _TitleAndDescription(title: 'Leave:', description: getPlayer.leaveRateRanked.toStringAsFixed(2)+'%')
                    ],
                  ),
                ),  
              ],
            ),  
            SizedBox( height: 10),
            Row( 
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                Container(
                  width: size.width * 0.33,
                  child: Column(
                    children: [
                      _TitleAndDescription(title: 'Wins:', description: getPlayer.rankedKbm.wins.toString(),),
                    ],
                  ),
                ), 
                Container(
                  width: size.width * 0.33,
                  child: Column(
                    children: [
                      _TitleAndDescription(title: 'Matches: ', description: (getPlayer.rankedKbm.wins + getPlayer.rankedKbm.losses).toString()),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.33,
                  child: Column(
                    children: [
                      _TitleAndDescription(title: 'Loses:', description: getPlayer.rankedKbm.losses.toString()),
                    ],
                  ),
                ),  
              ],
            ),
            SizedBox(height: 10,),

        ],
      ),
    );
  }
}


class _TitleAndDescription extends StatelessWidget {

  final String title;
  final String description;

  const _TitleAndDescription({Key? key, required this.title, required this.description}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
     // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( title , style: Theme.of(context).textTheme.headline3, overflow: TextOverflow.ellipsis, maxLines: 2),
        Text( description , style: Theme.of(context).textTheme.headline2, overflow: TextOverflow.ellipsis, maxLines: 1)
      ],
    );
  }
}