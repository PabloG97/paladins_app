
import 'package:flutter/material.dart';
import 'package:paladins_app/models/get_match_history_response.dart';
import 'package:paladins_app/providers/map_provider.dart';
import 'package:paladins_app/providers/providers.dart';

class MatchSlider extends StatelessWidget {

  final List<GetMatchHistoryResponse> getMatchHistoryResponse;

  const MatchSlider({Key? key, required this.getMatchHistoryResponse}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
  
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * .82,
      //color: Colors.red,
      
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            
            child: ListView.builder(
              itemCount: getMatchHistoryResponse.length,
              
              itemBuilder: ( _ , int index ){
                final _split = getMatchHistoryResponse[index].mapGame.split(' ');
                
                String map = _split[1];
                print(map);
                return Container(
                  decoration: BoxDecoration(

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(85, 65), topLeft: Radius.circular(45) ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff212121),
                        image: DecorationImage(
                          image: AssetImage("${MapProvider.nameMap(map)}"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                        )
                      ),
                      margin: EdgeInsets.all(5),
                      width: double.infinity,
                      height: 140,
                      //color: Colors.lightBlue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _IdMatchAndRegion(getMatchHistoryResponse: getMatchHistoryResponse, index: index),
                          _MatchDetails(getMatchHistoryResponse: getMatchHistoryResponse, index: index,),
                          _Date(getMatchHistoryResponse: getMatchHistoryResponse, index: index,),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    
      

    );
  }
}

class _IdMatchAndRegion extends StatelessWidget {

  final int index;

  const _IdMatchAndRegion({
    Key? key,
    required this.getMatchHistoryResponse, required this.index,
  }) : super(key: key);

  final List<GetMatchHistoryResponse> getMatchHistoryResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: ( getMatchHistoryResponse[index].winStatus == 'Win')
      //     ? Colors.blue.shade400 
      //     : Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Text('Region: ${getMatchHistoryResponse[index].region}', style: TextStyle(color: Colors.white60),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Text('Id: ${getMatchHistoryResponse[index].match}', style: TextStyle(color: Colors.white60),),
          ),
          
        ],
      ),
    );
  }
}

class _MatchDetails extends StatelessWidget {

  const _MatchDetails({
    Key? key,
    required this.getMatchHistoryResponse, required this.index,
  }) : super(key: key);

  final List<GetMatchHistoryResponse> getMatchHistoryResponse;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              height: 80,
              width: 80,
              image: NetworkImage('${ChampImageProvider.urlChampImageByName(getMatchHistoryResponse[index].champion)}')
            ),
          ),
              _TitleAndDescription(title: getMatchHistoryResponse[index].champion, description: getMatchHistoryResponse[index].timeInMatchSeconds.toString()),
              _TitleAndDescription(title: 'Mode:', description: getMatchHistoryResponse[index].mode),
              _TitleAndDescription(title: 'K/D/A', description: getMatchHistoryResponse[index].kdaMatch),
        ],
      ),
    );
  }
}

class _Date extends StatelessWidget {

  final int index;

  const _Date({
    Key? key,
    required this.getMatchHistoryResponse, required this.index,
  }) : super(key: key);

  final List<GetMatchHistoryResponse> getMatchHistoryResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ( getMatchHistoryResponse[index].winStatus == 'Win')
          ? const Color(0xff177171)
          : const Color(0xff711717),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 25),
            child: Text('${getMatchHistoryResponse[index].matchTime }', style: TextStyle( color: Colors.white60),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3, horizontal: 25),
            child: Text('${getMatchHistoryResponse[index].minutes } m', style: TextStyle( color: Colors.white60),),
          ),
        ],
      ),
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
     // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( title , style: Theme.of(context).textTheme.headline4, overflow: TextOverflow.ellipsis, maxLines: 2),
        Text( description , style: Theme.of(context).textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 1)
      ],
    );
  }
}
