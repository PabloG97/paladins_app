import 'package:flutter/material.dart';
import 'package:paladins_app/models/models.dart';
import 'package:paladins_app/providers/providers.dart';

class ChampRankedSlider extends StatelessWidget {

  final List<GetQueueStatsResponse> getQueueStats;
  final String title;

  const ChampRankedSlider({ Key? key, required this.getQueueStats, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 165,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, top: 0, bottom: 2),
            child: Text( title , style: Theme.of(context).textTheme.headline3,  overflow: TextOverflow.ellipsis, maxLines: 2)
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: getQueueStats.length,
              itemBuilder: ( _ , int index){
                return _ChampImage( getQueueStat: getQueueStats[index]);
              }),
          ),

          
        ],
      ),
    );
    
  }
}

class _ChampImage extends StatelessWidget {

  final GetQueueStatsResponse getQueueStat;
  

  const _ChampImage({ Key? key, required this.getQueueStat }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      //color: Colors.green,
      margin: EdgeInsets.all(5),
      child: Column(
        
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('${ChampImageProvider.urlChampImageByName(getQueueStat.champion)}'),
              fit: BoxFit.cover,  
            ),
          ),
          SizedBox(height: 3),
          Text(
            getQueueStat.champion,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )

        ],
      ),
    );
  }
}