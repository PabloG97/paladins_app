import 'package:flutter/material.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:paladins_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MatchesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<PaladinsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: Text('Match history'),
          elevation: 0,
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     onPressed: (){},
          //   )
          // ],
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
}