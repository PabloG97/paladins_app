import 'package:flutter/material.dart';
import 'package:paladins_app/models/models.dart';
import 'package:paladins_app/providers/providers.dart';

double _kd  = 0;
double _kda = 0;
int   _wins = 0;
int  _losses = 0;

class AnalysisRanked extends StatelessWidget {
  final List<GetQueueStatsResponse> getQueueStatsResponse;
  final String title;
  
  const AnalysisRanked({Key? key, required this.getQueueStatsResponse, required this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    _getGlobalKDAndKDA(getQueueStatsResponse);
    String mainRole = DataAnalyzer.mainRoleRanked(getQueueStatsResponse); 
    return Column(
      children: [
        Row(
          children: [ Padding( padding: EdgeInsets.only(left: 15, bottom: 7), child: Text( title , style: Theme.of(context).textTheme.headline6,  overflow: TextOverflow.ellipsis, maxLines: 2)),],
        ),
        Table(
          children: [

            TableRow(

              children: [
                _TitleAndDescription(title: 'Winrate: ', description: ((_wins/(_wins+_losses))*100).toStringAsFixed(2)+'%'),
                _TitleAndDescription(title: 'Main', description: mainRole),
                _TitleAndDescription(title: 'Matches ', description: (_wins + _losses).toString()),
              ]
            ),
            
            TableRow(
              children: [
                _TitleAndDescription(title: 'KD: ', description: _kd.toStringAsFixed(2)),
                _TitleAndDescription(title: 'KDA: ', description: _kda.toStringAsFixed(2)),
                _TitleAndDescription(title: 'Wins: ', description: _wins.toString()),
                // _TitleAndDescription(title: 'Global main role: ', description: dt.toString(),
              ]
            ),
          ],
        ),
      ],
    );
  }
}

_getGlobalKDAndKDA(List<GetQueueStatsResponse> getQueueStatsRsponse){

  _kd  = 0;
  _kda = 0;
  _wins = 0;
  _losses = 0;

  int _kills = 0;
  int _deaths = 0;
  int _assists = 0;

  for(int i = 0; i < getQueueStatsRsponse.length; i++){
    _kills += getQueueStatsRsponse[i].kills;
    _deaths += getQueueStatsRsponse[i].deaths;
    _assists += getQueueStatsRsponse[i].assists;
    _wins += getQueueStatsRsponse[i].wins;
    _losses += getQueueStatsRsponse[i].losses;
  }
  
  _kd = _kills / _deaths;
  _kda = (_kills + (_assists /2))/_deaths;

}

class _TitleAndDescription extends StatelessWidget {

  final String title;
  final String description;

  const _TitleAndDescription({Key? key, required this.title, required this.description}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text( title , style: Theme.of(context).textTheme.headline3, overflow: TextOverflow.ellipsis, maxLines: 2),
        Text( description , style: Theme.of(context).textTheme.headline2, overflow: TextOverflow.ellipsis, maxLines: 1),
        SizedBox(height: 12.5,)
      ],
      
    );
  }
}