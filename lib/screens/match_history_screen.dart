import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:paladins_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MatchHistoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<PaladinsProvider>(context);
    
    if(profileProvider.getMatchHistoryResponse.isEmpty){
      return LoadingWidget(title: 'Match history');
    }
    if( profileProvider.getMatchHistoryResponse[0].retMsg != null){
          final size = MediaQuery.of(context).size;
          return Scaffold(
      appBar: AppBar(
        title: Text('Match history'),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body:
           Container(
            width: size.width,
            height: size.height*0.8,
            child: Center(
              child: Text('The player has no recent games'),
            )
          ));
      }
    
    return RefreshIndicator (
      onRefresh: profileProvider.getPlayer,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Match history'),
          centerTitle: true,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MatchSlider( getMatchHistoryResponse: profileProvider.getMatchHistoryResponse ),
            ],
          ),
        ),
      ),
    );
  }
}