import 'package:flutter/material.dart';
import 'package:paladins_app/providers/paladins_provider.dart';
import 'package:paladins_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CurrentMatchScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  final profileProvider = Provider.of<PaladinsProvider>(context);

    if(profileProvider.status == -1){
      return LoadingWidget(title: 'Current Match',);
    }

    return Scaffold(
      appBar: AppBar(
        
        title: Text('Current Match'),
        centerTitle: true,
        elevation: 0,
         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
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
