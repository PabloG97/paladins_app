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
      final size = MediaQuery.of(context).size;
      return _loading(size);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: Text('Match history'),
          elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MatchSlider( getMatchHistoryResponse: profileProvider.getMatchHistoryResponse ),
          ],
        ),
      ),
    );
  }

  Scaffold _loading(Size size) {
    return Scaffold(
      appBar: AppBar(
      
      title: Text('Match History'),
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