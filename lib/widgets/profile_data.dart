import 'package:flutter/material.dart';
import 'package:paladins_app/models/models.dart';
import 'package:paladins_app/providers/providers.dart';

class ProfileData extends StatelessWidget {

  final List<GetPlayer> getPlayer;
 

  const ProfileData({Key? key, required this.getPlayer}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
     // color: Colors.green,
     // margin: EdgeInsets.symmetric(horizontal: 25),
      //height: size.height *0.125  ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Padding(padding: EdgeInsets.only(right: 15)),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(RankProvider.urlRank(getPlayer[0].tierRankedKbm)),
              height: 115,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text('Rankeds Stats'),
              
              Text('Main:', style: TextStyle( fontSize: 20 ), overflow: TextOverflow.ellipsis, maxLines: 2),
              Text('Cassie', style: TextStyle( fontSize: 18 ), overflow: TextOverflow.ellipsis, maxLines: 1)
            ],
          ),
          Column(
            children: [
              Text('Winrate:', style: TextStyle( fontSize: 20, ), overflow: TextOverflow.ellipsis, maxLines: 2),
              Text(getPlayer[0].winRate.toStringAsFixed(2)+'%', style: TextStyle( fontSize: 18 ), overflow: TextOverflow.ellipsis, maxLines: 1),
            ],
          ),
          Column(
            children: [
              Text('Leaves:', style: TextStyle( fontSize: 20, ), overflow: TextOverflow.ellipsis, maxLines: 2),
              Text(getPlayer[0].leaveRate.toStringAsFixed(2)+'%', style: TextStyle( fontSize: 18 ), overflow: TextOverflow.ellipsis, maxLines: 1),

            ],
          ),
        ],
      ),
    );
  }
  
}
