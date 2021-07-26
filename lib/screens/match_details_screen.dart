import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paladins_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:paladins_app/providers/map_provider.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:paladins_app/themes/theme.dart';

class MatchDetailsScreen extends StatelessWidget {
  const MatchDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<GetMatchDetailsResponse> winnerTeam;
    List<GetMatchDetailsResponse> loserTeam;

    final profileProvider = Provider.of<PaladinsProvider>(context, listen: false);
    final int matchId = ModalRoute.of(context)?.settings.arguments as int;
    return FutureBuilder(
      future: profileProvider.getMatchDetails(matchId),
      builder: ( _ , AsyncSnapshot<List<GetMatchDetailsResponse>> snapshot){
        if (! snapshot.hasData){
          return _Loading();
        }
        
        final matches = snapshot.data!;
        winnerTeam = createWinnerTeam(matches);
        loserTeam = createLosserTeam(matches);

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              _CustomAppBar( match: matches[0], ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    padding: EdgeInsets.all(7.5),
                    child: Column(
                      children: [
                        _TeamInfo(team: winnerTeam),
                        _Bans(match: matches[0]),
                        _TeamInfo(team: loserTeam),
                        
                      ],
                    ),
                  )
                ])
              )
            ],
          ),
        );
      },
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final GetMatchDetailsResponse match;

  const _CustomAppBar({
    Key? key, required this.match,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
  final _split = match.mapGame.split(' ');
  String map = _split[1];
    return SliverAppBar(
      backgroundColor: experimentalTheme().primaryColor,
      expandedHeight: 150,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          color: Colors.black38,
          alignment: Alignment.bottomCenter,
          child: Text('Match Details'),
        ),
        background:  FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: AssetImage('${MapProvider.nameMap(map)}'),
          fit: BoxFit.cover,
          
        ),
      ),
    );
  }
}

class _TeamInfo extends StatelessWidget {

  final List<GetMatchDetailsResponse> team;

  const _TeamInfo({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataRowHeight: 60,
        sortAscending: true,
        sortColumnIndex: 3,
        columns: [


          DataColumn(
            label: Text(
              'Name', style: Theme.of(context).textTheme.bodyText1,
            ),
            ),
          DataColumn(
            label: Text(
              'Rank', style: Theme.of(context).textTheme.bodyText1,
            )),
          DataColumn(
            label: Text(
              'K/D/A', style: Theme.of(context).textTheme.bodyText1,
            )), 
          DataColumn(
            onSort: (columnIndex, ascending) {
              
            },
            label: Text(
              'Damage', style: Theme.of(context).textTheme.bodyText1,
            ),
            numeric: true,

            ),
          DataColumn(
            label: Text(
              'Shielding', style: Theme.of(context).textTheme.bodyText1,
            )),
          DataColumn(
            label: Text(
              'Healing', style: Theme.of(context).textTheme.bodyText1,
            )),
          DataColumn(
            label: Text(
              'Taken', style: Theme.of(context).textTheme.bodyText1,
            )),
          DataColumn(
            label: Text( 'KD', style: Theme.of(context).textTheme.bodyText1)),
          DataColumn(label: Text('Items', style: Theme.of(context).textTheme.bodyText1)),
          // DataColumn(label: Text('Loadout', style: Theme.of(context).textTheme.bodyText1)),
            
          
          
        ],

        rows: team.map((match) => DataRow( 
          cells: [
            
             DataCell( _Player(match: match)),

              DataCell(FadeInImage(image: NetworkImage(RankProvider.urlRank(match.leagueTier)),placeholder: AssetImage('assets/no-image.jpg'), width: 50, height: 50,)),
              DataCell(Text(match.kda, style: Theme.of(context).textTheme.bodyText2,)),
              DataCell(Text(match.damagePlayer.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: Theme.of(context).textTheme.bodyText2,)),
              DataCell(Text(match.damageMitigated.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: Theme.of(context).textTheme.bodyText2,)),
              DataCell(Text(match.healing.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: Theme.of(context).textTheme.bodyText2,)),
              DataCell(Text(match.damageTaken.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: Theme.of(context).textTheme.bodyText2,)),
              DataCell(Text(match.kdRatio.toStringAsFixed(2), style: Theme.of(context).textTheme.bodyText2,)),
              // DataCell(_Items(player: match)),
              DataCell(_Loadout(player: match),),
          ]),).toList(),
       // rows: matches.map((MatchDetailsScreen) => null).toList()
      ),
    );
  }
}

class _Player extends StatelessWidget {

  final GetMatchDetailsResponse match;

  const _Player({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: FadeInImage(
              width: 45,
              height: 45,
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(ChampImageProvider.urlChampImageByName(match.referenceName))
            ),
          ),
          SizedBox(width: 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(match.playerName),
              Text(match.referenceName)
            ],
          )
        ],
      ),
    );
  }
}

class _Bans extends StatelessWidget {

  final GetMatchDetailsResponse match;

  const _Bans({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(match.ban1 == null && match.ban2 == null && match.ban3 == null && match.ban4 == null && match.ban5 == null && match.ban6 == null){
      return Container(
        child: Padding(padding: EdgeInsets.symmetric(vertical: 25, horizontal: 50), child: Text('VS'),)
      );
    }

    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Bans:'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Team 1:'),
                  _BansImages(url: '${ChampImageProvider.urlChampImageById(match.banId1)}'),
                  _BansImages(url: '${ChampImageProvider.urlChampImageById(match.banId3)}'),
                  _BansImages(url: '${ChampImageProvider.urlChampImageById(match.banId6)}'),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text('VS'),),
              Column(
                children: [
                  Text('Team 2:'),
                  _BansImages(url: '${ChampImageProvider.urlChampImageById(match.banId2)}'),
                  _BansImages(url: '${ChampImageProvider.urlChampImageById(match.banId4)}'),
                  _BansImages(url: '${ChampImageProvider.urlChampImageById(match.banId5)}'),
                ],
              ),
            ],
          ),
          SizedBox(height: 10,)
        ],
        
      ),
    );
  }
}

class _BansImages extends StatelessWidget {
  final String url;

  const _BansImages({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 45,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('$url'),
              fit: BoxFit.cover,  
              width: 60,
              height: 40,
              
            ),
          ),
          SizedBox(height: 5,)
        ],
      ),
    );
  }
}

List<GetMatchDetailsResponse> createWinnerTeam(List<GetMatchDetailsResponse> allTeams){
   List<GetMatchDetailsResponse> winnerTeam = [];
   for(int i = 0; i < allTeams.length ; i++){
     if(allTeams[i].winStatus == 'Winner'){
       winnerTeam.add(allTeams[i]);
     }
   }
   return winnerTeam;
 }

List<GetMatchDetailsResponse> createLosserTeam(List<GetMatchDetailsResponse> allTeams){
   List<GetMatchDetailsResponse> losserTeam = [];
   for(int i = 0; i < allTeams.length ; i++){
     if(allTeams[i].winStatus == 'Loser'){
       losserTeam.add(allTeams[i]);
     }
   }
   return losserTeam;
 }

class _Items extends StatelessWidget {

  final GetMatchDetailsResponse player;
  const _Items({Key? key, required this.player}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final itemList = Provider.of<PaladinsProvider>(context).getItemsResponse;
  
  return Container(
    
    child: Row(
      children: [
        _ImageItem(url: _getItemUrls(player.itemId6, itemList)),
        _ImageItem(url: _getItemUrls(player.itemId1, itemList)),
        _ImageItem(url: _getItemUrls(player.itemId2, itemList)),
        _ImageItem(url: _getItemUrls(player.itemId3, itemList)),
        _ImageItem(url: _getItemUrls(player.itemId4, itemList)),
        _ImageItem(url: _getItemUrls(player.itemId5, itemList)),

      ],
    ),
  );
  }
}

class _Loadout extends StatelessWidget {
  final GetMatchDetailsResponse player;
  const _Loadout({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemList = Provider.of<PaladinsProvider>(context).getItemsResponse;
  
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ImageItem(url: _getItemUrls(player.activeId1, itemList)),
        _ImageItem(url: _getItemUrls(player.activeId2, itemList)),
        _ImageItem(url: _getItemUrls(player.activeId3, itemList)),
        _ImageItem(url: _getItemUrls(player.activeId4, itemList)),

      ],
    ),
  );
  }
  }


class _ImageItem extends StatelessWidget {
  final String url;

  const _ImageItem({Key? key, required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return FadeInImage(
    //   placeholder: AssetImage('assets/no-image.jpg'), 
    //   image: NetworkImage('$url'),
    //   placeholderErrorBuilder: (context, error, stackTrace)
    //    {
    //     return Image.asset(
    //         'assets/no-image.jpg',
    //         fit: BoxFit.cover);
    //   },
    //   imageErrorBuilder:
    //     (context, error, stackTrace) {
    //     return Image.asset(
    //         'assets/no-image.jpg',
    //         fit: BoxFit.cover);
    //   },
    //   width: 50,
    //   height: 100,
    // );
    return Container(
      padding: EdgeInsets.all(1),
      child: CachedNetworkImage(
        
        fit:BoxFit.fill,
        width:50,
        height:40,
        imageUrl:'$url',
        placeholder:(context, url) => CircularProgressIndicator(),
        errorWidget:(context, url, error) => new Icon(Icons.error),
      ),
    );
  }
}

_getItemUrls(int itemId, List<GetItemsResponse> getItemsResponse){
  if(itemId != 0){
    for(int i = 0; i < getItemsResponse.length; i++){
      if( getItemsResponse[i].itemId == itemId){
        return getItemsResponse[i].itemIconUrl;
      }
    }
  }
  return 'https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg';
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      title: Text('Profile-Data'),
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