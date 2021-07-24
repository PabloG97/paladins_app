import 'package:flutter/material.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:paladins_app/widgets/champ_ranked_slider.dart';
import 'package:paladins_app/widgets/profile_summary.dart';
import 'package:paladins_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final profileProvider = Provider.of<PaladinsProvider>(context);

    //print('Path de la imagen: '+ profileProvider.playerData[0].avatarUrl,);
    final size = MediaQuery.of(context).size;
    if(profileProvider.getPlayerResponse.isEmpty){
      return Scaffold(
        appBar: AppBar(
        
        title: Text('Profile-data'),
        centerTitle: true,
        elevation: 0,
      ),
        body: Container(
          width: double.infinity,
          height: size.height * 0.5,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        
        title: Text(profileProvider.getPlayerResponse[0].region),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            ProfileNameAndTitle(getPlayer: profileProvider.getPlayerResponse),
            Divider(),
            ProfileRank(getPlayer: profileProvider.getPlayerResponse, state: profileProvider.state),
            Divider( height: 1,),
            ProfileSummary(getPlayer: profileProvider.getPlayerResponse[0]),
            ChampSlider(title: 'Most level: ', getChampionsRank: profileProvider.championsRank),
            ProfileRankedStats(getPlayer: profileProvider.getPlayerResponse[0], getQueueStatsResponse: profileProvider.getQueueStatsResponse),
            ChampRankedSlider( title: 'Most played(ranked):', getQueueStats: profileProvider.getQueueStatsResponse),
            
            // ProfileCurrentMatch( matchPlayerDetails: profileProvider.matchPlayerDetails ),            
            //MapInfo(),

          ],
        ),
      ),
    );
  }
}