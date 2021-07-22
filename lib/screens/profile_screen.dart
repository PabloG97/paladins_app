import 'package:flutter/material.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:paladins_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final profileProvider = Provider.of<PaladinsProvider>(context);

    //print('Path de la imagen: '+ profileProvider.playerData[0].avatarUrl,);
    final size = MediaQuery.of(context).size;
    if(profileProvider.dataRecolected == ''){
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
        
        title: Text(profileProvider.playerData[0].region),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            ProfileNameAndTitle(getPlayer: profileProvider.playerData),
            ProfileRank(getPlayer: profileProvider.playerData, state: profileProvider.state),
            ChampSlider(title: 'Most level: ', getChampionsRank: profileProvider.championsRank),
            // ProfileCurrentMatch( matchPlayerDetails: profileProvider.matchPlayerDetails ),            
            //MapInfo(),

          ],
        ),
      ),
    );
  }
}