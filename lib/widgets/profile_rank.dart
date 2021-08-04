import 'package:flutter/material.dart';
import 'package:paladins_app/models/models.dart';
import 'package:paladins_app/providers/providers.dart';

class ProfileRank extends StatelessWidget {

  final List<GetPlayer> getPlayer;
  final String state;
 

  const ProfileRank({Key? key, required this.getPlayer, required this.state}) : super(key: key);


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
              height: 80,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text('Rankeds Stats'),
              
              Text('Status:', style: Theme.of(context).textTheme.headline3, overflow: TextOverflow.ellipsis, maxLines: 2),
              Text( state , style: Theme.of(context).textTheme.headline2, overflow: TextOverflow.ellipsis, maxLines: 1)
            ],
          ),
          Column(
            children: [
              Text('Winrate:', style: Theme.of(context).textTheme.headline3, overflow: TextOverflow.ellipsis, maxLines: 2),
              Text(getPlayer[0].winRateCasual.toStringAsFixed(2)+'%', style: Theme.of(context).textTheme.headline2, overflow: TextOverflow.ellipsis, maxLines: 1),
            ],
          ),
          Column(
            children: [
              Text('Leave:', style: Theme.of(context).textTheme.headline3, overflow: TextOverflow.ellipsis, maxLines: 2),
              Text(getPlayer[0].leaveRateCasual.toStringAsFixed(2)+'%', style: Theme.of(context).textTheme.headline2, overflow: TextOverflow.ellipsis, maxLines: 1),

            ],
          ),
        ],
      ),
    );
  }
  
}
