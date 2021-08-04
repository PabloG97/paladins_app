import 'package:flutter/material.dart';
import 'package:paladins_app/models/models.dart';

class ProfileSummary extends StatelessWidget {

  final GetPlayer getPlayer;

  const ProfileSummary({Key? key, required this.getPlayer}) : super(key: key);

  // DateTime lastLogin = getPlayer.lastLoginDatetime; 
  @override
  Widget build(BuildContext context) {
  List<String> lastLogin = (getPlayer.lastLoginDatetime).split(' ');
  final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,

      child: Container(
        //color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 0, bottom: 2),
              child: Text( 'Summary:' , style: Theme.of(context).textTheme.headline3,  overflow: TextOverflow.ellipsis, maxLines: 2)
            
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
                      _TitleAndDescription(title: 'Last login:', description: lastLogin[0]),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.33,
                  child: Column(
                    children: [
                      _TitleAndDescription(title: 'Platform:', description: getPlayer.platform,),
                    ],
                  ),
                ), 
                Container(
                  width: size.width * 0.33,
                  child: Column(
                    children: [
                      _TitleAndDescription(title: 'Level:', description: getPlayer.level.toString()),
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
                      _TitleAndDescription(title: 'Wins:', description: getPlayer.wins.toString(),),
                    ],
                  ),
                ), 
                Container(
                  width: size.width * 0.33,
                  child: Column(
                    children: [
                      _TitleAndDescription(title: 'Matches: ', description: (getPlayer.wins + getPlayer.losses).toString()),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.33,
                  child: Column(
                    children: [
                      _TitleAndDescription(title: 'Loses:', description: getPlayer.losses.toString()),
                    ],
                  ),
                ),  
              ],
            ),
            SizedBox(height: 10,),
              
          ],
        ),
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


