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
        
        title: Text('Profile-data'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            ProfileNameAndTitle(getPlayer: profileProvider.playerData),
            ProfileRank(getPlayer: profileProvider.playerData, state: profileProvider.state),

            Row(
              children: [
                    Padding(
                  padding: EdgeInsets.only(left: 15, top: 0, bottom: 2),

                  child: Text('Current match:', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),  overflow: TextOverflow.ellipsis, maxLines: 2)
                ),
              ],
            ),
            ProfileCurrentMatch( matchPlayerDetails: profileProvider.matchPlayerDetails ),
            //ProfileCurrentMatch( matchPlayerDetails: profileProvider.matchPlayerDetails ),
            
            //MapInfo(),

          ],
        ),
      ),
    );
  }
}