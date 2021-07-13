import 'package:flutter/material.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:paladins_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final profileProvider = Provider.of<PaladinsProvider>(context);

    print('Path de la imagen: '+ profileProvider.imgPath,);
    final size = MediaQuery.of(context).size;
    if(profileProvider.imgPath == ''){
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

            ProfileImg(getPlayer: profileProvider.playerData),
            ProfileData(getPlayer: profileProvider.playerData),

          ],
        ),
      ),
    );
  }
}