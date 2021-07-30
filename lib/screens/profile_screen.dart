import 'package:flutter/material.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:paladins_app/search/search_delegate.dart';
import 'package:paladins_app/widgets/champ_ranked_slider.dart';
import 'package:paladins_app/widgets/profile_summary.dart';
import 'package:paladins_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final profileProvider = Provider.of<PaladinsProvider>(context);

    //print('Path de la imagen: '+ profileProvider.playerData[0].avatarUrl,);
    if(profileProvider.getPlayerResponse.isEmpty){
      return _Loading();
    }

    return RefreshIndicator(
      onRefresh:  profileProvider.getPlayer,
      child: Scaffold(
        appBar: AppBar(
          
          title: Text(profileProvider.getPlayerResponse[0].region),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => showSearch(context: context, delegate: ProfileSearchDelegate()), 
              icon: Icon(Icons.search_outlined)),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
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
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      title: Text('Profile-Data'),
      centerTitle: true,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
    ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}