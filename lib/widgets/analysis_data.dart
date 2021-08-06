
import 'package:flutter/material.dart';
import 'package:paladins_app/models/models.dart';

double _kd = 0;
double _kda = 0;
class AnalysisData extends StatelessWidget {

  final GetPlayer getPlayer;
  final List<GetChampionsRankResponse> getChampionsRank;


  const AnalysisData({Key? key, required this.getPlayer, required this.getChampionsRank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DateTime(getPlayer.createdDatetime).isUtc;
    // DateTime dt = DateTime.parse(getPlayer.createdDatetime);
    _getGlobalKDAndKDA(getChampionsRank);
    List<String> date = (getPlayer.createdDatetime).split(' ');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        _Header(getPlayer: getPlayer,),
        Divider( endIndent: 10,indent: 10,),
        Row(
          children: [ Padding( padding: EdgeInsets.only(left: 15, top: 0, bottom: 15), child: Text( 'Global data:' , style: Theme.of(context).textTheme.headline6,  overflow: TextOverflow.ellipsis, maxLines: 2)),],
        ),
        Table(
          children: [

            TableRow(

              children: [
                _TitleAndDescription(title: 'Region: ', description: getPlayer.region),
                _TitleAndDescription(title: 'Hours played: ', description: getPlayer.hoursPlayed.toString()),
                _TitleAndDescription(title: 'Created: ', description: date[0]),
              ]
            ),
            
            TableRow(
              children: [
                _TitleAndDescription(title: 'Global KD: ', description: _kd.toStringAsFixed(2)),
                _TitleAndDescription(title: 'Global KDA: ', description: _kda.toStringAsFixed(2)),
                _TitleAndDescription(title: 'Id player: ', description: getPlayer.activePlayerId.toString()),
                // _TitleAndDescription(title: 'Global main role: ', description: dt.toString(),
              ]
            ),
          ],
        ),

      ],
    );
  }
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

_getGlobalKDAndKDA(List<GetChampionsRankResponse> getChampionsRank){

  int _kills = 0;
  int _deaths = 0;
  int _assists = 0;

  for(int i = 0; i < getChampionsRank.length; i++){
    _kills += getChampionsRank[i].kills;
    _deaths += getChampionsRank[i].deaths;
    _assists += getChampionsRank[i].assists;
  }
  
  _kd = _kills / _deaths;
  _kda = (_kills + (_assists /2))/_deaths;

}

class _Header extends StatelessWidget {

  final GetPlayer getPlayer;

  const _Header({Key? key, required this.getPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(getPlayer.hirezName, style: Theme.of(context).textTheme.headline1,  overflow: TextOverflow.ellipsis, maxLines: 2, ),

        ],
      )
      
    );
  }
}