import 'package:flutter/material.dart';
import 'package:paladins_app/providers/paladins_provider.dart';
import 'package:paladins_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CurrentMatchScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  final profileProvider = Provider.of<PaladinsProvider>(context);

    if(profileProvider.status == -1){
      return Loading();
    }

    return Scaffold(
      appBar: AppBar(
        
        title: Text('Current Match'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCurrentMatch(matchPlayerDetails: profileProvider.matchPlayerDetails, status: profileProvider.status)
          ],
        ),
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
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}