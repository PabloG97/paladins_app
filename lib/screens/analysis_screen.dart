import 'package:flutter/material.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:paladins_app/widgets/analysis_ranked.dart';
import 'package:paladins_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final profileProvider = Provider.of<PaladinsProvider>(context);

    if(profileProvider.getPlayerResponse.isEmpty){
      return _Loading();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis'),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnalysisData(getPlayer: profileProvider.getPlayerResponse[0], getChampionsRank: profileProvider.championsRank),
            Divider( indent: 10, endIndent: 10),
            AnalysisRanked(getQueueStatsResponse: profileProvider.getCasualStats, title: 'Siege casual stats'),
            ChampRankedSlider( title: 'Most played:', getQueueStats: profileProvider.getCasualStats),
            Divider( indent: 10, endIndent: 10),
            AnalysisRanked(getQueueStatsResponse: profileProvider.getQueueStatsResponse, title: 'Ranked stats'),
            ChampRankedSlider( title: 'Most played:', getQueueStats: profileProvider.getQueueStatsResponse),
            Divider( indent: 10, endIndent: 10),
            ProfileRankedStats(getPlayer: profileProvider.getPlayerResponse[0], getQueueStatsResponse: profileProvider.getQueueStatsResponse),
          ],
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
      
      title: Text('Analysis'),
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

