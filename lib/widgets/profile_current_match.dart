import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paladins_app/models/models.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:provider/provider.dart';
/* import 'package:paladins_app/models/models.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:provider/provider.dart'; */

class ProfileCurrentMatch extends StatelessWidget {


  final int status;
  final List<MatchPlayerDetails> matchPlayerDetails;

  const ProfileCurrentMatch({Key? key, required this.matchPlayerDetails, required this.status}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final profileProvider = Provider.of<PaladinsProvider>(context);  
    if(profileProvider.status == -1){
    
      return Loading();
    }
    
    else if ( profileProvider.status != 3){
      return Container(
        width: size.width,
        height: size.height*0.8,
        
        child: Center(
          child: Text('The player is not in a live game'),
        )
      );
    }
    else{
      final size = MediaQuery.of(context).size;
      return Container(
        width: double.infinity,
        height: 500,
        //margin: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              //color: Colors.yellow,
              width: size.width * .40,
              child: Column(
                children: [
                  Text('Team 1'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: matchPlayerDetails.length,
                      itemBuilder: ( _ , int index){
                        return _Team1(matchPlayerDetail: matchPlayerDetails[index]);
                      }
                    ),
                  ), 
                ],
              ),
            ),
            Container(
            // color: Colors.brown,
              width: size.width * .20,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Map:', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),  overflow: TextOverflow.ellipsis, maxLines: 2),
                    Text('${matchPlayerDetails[0].mapGame}', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),  overflow: TextOverflow.ellipsis, maxLines: 4),

                  ],
                ),
              )
            ),
            Container(
              //color: Colors.pink,
              width: size.width * .40,
              child: Column(
                children: [
                  Text('Team 2'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: matchPlayerDetails.length,
                      itemBuilder: ( _ , int index){
                        return _Team2(matchPlayerDetail: matchPlayerDetails[index]);
                      }
                    ),
                  ), 
                ],
              ),
            )
            
          ],
        ),
      );
    }
  }
}

class _Team1 extends StatelessWidget {

  final MatchPlayerDetails matchPlayerDetail;

  const _Team1({Key? key, required this.matchPlayerDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(matchPlayerDetail.taskForce == 1){
      return _NameChampAndRank(matchPlayerDetail: matchPlayerDetail);
    } else{
      return Container();
    }
    
  }
}


class _Team2 extends StatelessWidget {

  final MatchPlayerDetails matchPlayerDetail;

  const _Team2({Key? key, required this.matchPlayerDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(matchPlayerDetail.taskForce == 2){
      return _NameChampAndRank(matchPlayerDetail: matchPlayerDetail);
    } else{
      return Container();
    }
    
  }
}


class _NameChampAndRank extends StatelessWidget {

  final MatchPlayerDetails matchPlayerDetail;

  const _NameChampAndRank({Key? key, required this.matchPlayerDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 250,
    height: 80,
    //color: Colors.lightBlueAccent,
    margin: EdgeInsets.all(2),
    child: Row(
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(RankProvider.urlRank(matchPlayerDetail.tier)),
                height: 55,
              ),
            ),

          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text( '${matchPlayerDetail.playerName}' ),
            Text('Level: ${matchPlayerDetail.accountLevel.toString()}'),
            Text( '${matchPlayerDetail.championName}')
          ],
        )
      ],
    ),
    );
  } 
}

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      title: Text('Current Match'),
      centerTitle: true,
      elevation: 0,
    ),
      body: Container(
        width: 500,
        height: 500,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}