import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paladins_app/models/models.dart';
import 'package:provider/provider.dart';
import 'package:paladins_app/providers/map_provider.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:paladins_app/themes/theme.dart';


List<GetItemsResponse> itemsUsados = [];

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
      floating: true,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          color: Colors.black38,
          alignment: Alignment.bottomCenter,
          child: Text('Match Details'),
        ),
        stretchModes: [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          StretchMode.blurBackground

        ],
        background:  FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: AssetImage('${MapProvider.nameMap(map)}'),
          fit: BoxFit.cover,
        ),
      ),
     // title: Text('AAAAA'),
    );
  }
}

class _TeamInfo extends StatefulWidget {

  final List<GetMatchDetailsResponse> team;

  const _TeamInfo({Key? key, required this.team}) : super(key: key);

  @override
  __TeamInfoState createState() => __TeamInfoState();
}

var _sortAscending = true;
var _sortColumnIndex = 0;
class __TeamInfoState extends State<_TeamInfo> {
  @override
  Widget build(BuildContext context) {
    // bool sort=true;
    final _profileProvider = Provider.of<PaladinsProvider>(context, listen: false);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataRowHeight: 55,
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,

        columns: [


          DataColumn(label: Text('Name', style: Theme.of(context).textTheme.bodyText1,), onSort: (int columnIndex, bool ascending){
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if(ascending){
                widget.team..sort((a, b) => a.playerName.compareTo(b.playerName));
              }else {
                widget.team..sort((a, b) => b.playerName.compareTo(a.playerName));
              }
            });
          }),
          DataColumn(label: Text('Credits', style: Theme.of(context).textTheme.bodyText1,),onSort: (int columnIndex, bool ascending){
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if(ascending){
                widget.team.sort((a, b) => a.goldEarned.compareTo(b.goldEarned));
              }else {
                widget.team.sort((a, b) => b.goldEarned.compareTo(a.goldEarned));
              }
            });
          }),
          DataColumn(label: Text( 'Rank', style: Theme.of(context).textTheme.bodyText1, )),
          DataColumn(label: Text('K/D/A', style: Theme.of(context).textTheme.bodyText1,)), 

          // DataColumn(label: Text('Damage', style: Theme.of(context).textTheme.bodyText1,),numeric: true,),
          
           DataColumn(label: Text('Damage'),onSort: (int columnIndex, bool ascending){
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if(ascending){
                widget.team.sort((a, b) => a.damagePlayer.compareTo(b.damagePlayer));
              }else {
                widget.team.sort((a, b) => b.damagePlayer.compareTo(a.damagePlayer));
              }
            });
          }),

           DataColumn(label: Text('Shielding'), onSort: (int columnIndex, bool ascending){
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if(ascending){
                widget.team.sort((a, b) => a.damageMitigated.compareTo(b.damageMitigated));
              }else {
                widget.team.sort((a, b) => b.damageMitigated.compareTo(a.damageMitigated));
              }
            });
          }),

          //DataColumn(label: Text('Shielding', style: Theme.of(context).textTheme.bodyText1,)),
          DataColumn(label: Text('Healing', style: Theme.of(context).textTheme.bodyText1), onSort: (int columnIndex, bool ascending){
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if(ascending){
                widget.team.sort((a, b) => a.healing.compareTo(b.healing));
              }else {
                widget.team.sort((a, b) => b.healing.compareTo(a.healing));
              }
            });
          }),
          DataColumn(label: Text( 'Taken', style: Theme.of(context).textTheme.bodyText1,), onSort: (int columnIndex, bool ascending){
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if(ascending){
                widget.team.sort((a, b) => a.damageTaken.compareTo(b.damageTaken));
              }else {
                widget.team.sort((a, b) => b.damageTaken.compareTo(a.damageTaken));
              }
            });
          } ),
          DataColumn(label: Text( 'KD', style: Theme.of(context).textTheme.bodyText1), onSort: (int columnIndex, bool ascending){
            setState(() {
              _sortColumnIndex = columnIndex;
              _sortAscending = ascending;
              if(ascending){
                widget.team.sort((a, b) => a.kdRatio.compareTo(b.kdRatio));
              }else {
                widget.team.sort((a, b) => b.kdRatio.compareTo(a.kdRatio));
              }
            });
          }),
          DataColumn(label: Text('Items', style: Theme.of(context).textTheme.bodyText1)),
          DataColumn(label: Text('Loadout', style: Theme.of(context).textTheme.bodyText1)),
            
          
          
        ],

        rows: widget.team.map((match) => DataRow( 
          cells: [
            
             DataCell( _Player(match: match), onTap: (){
               if(match.playerName == '' ){ 
                 final message = 'Private profile';
                 Fluttertoast.showToast(msg: message, fontSize: 18, backgroundColor: Colors.grey.shade700);
               }
               else{
                 _profileProvider.clearData(match.playerName);
                 Navigator.pop(context, 'profile' );
                }}),

              DataCell(Text(match.goldEarned.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: Theme.of(context).textTheme.bodyText2,)),              
              DataCell(FadeInImage(image: NetworkImage(RankProvider.urlRank(match.leagueTier)),placeholder: AssetImage('assets/no-image.jpg'), width: 50, height: 50,)),
              DataCell(Text(match.kda, style: Theme.of(context).textTheme.bodyText2,)),
              DataCell(Text(match.damagePlayer.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: Theme.of(context).textTheme.bodyText2,)),
              DataCell(Text(match.damageMitigated.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: Theme.of(context).textTheme.bodyText2,)),
              DataCell(Text(match.healing.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: Theme.of(context).textTheme.bodyText2,)),
              DataCell(Text(match.damageTaken.toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},'), style: Theme.of(context).textTheme.bodyText2,)),
              DataCell(Text(match.kdRatio.toStringAsFixed(2), style: Theme.of(context).textTheme.bodyText2,)),
              DataCell(_Items(player: match),),
              DataCell(_Loadouts(player: match)),
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
          Hero(
            tag: '${match.referenceName}${match.playerName}${match.match}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: FadeInImage(
                width: 45,
                height: 45,
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(ChampImageProvider.urlChampImageByName(match.referenceName))
              ),
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

    if(match.matchQueueId == 424){
      return Container(
        child: Column(
          children: [
            SizedBox(height: 5,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text('Score: ', style: Theme.of(context).textTheme.headline2,)),
            SizedBox(height: 10,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ( match.winningTaskForce == 1  )
                ? Container(
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(match.team1Score.toString(), style: Theme.of(context).textTheme.headline2,)),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20,), child: Text('VS'),),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(match.team2Score.toString(), style: Theme.of(context).textTheme.headline2,)),
                    ],
                  )
                )
                : Container(
                  child: Row(children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(match.team2Score.toString(), style: Theme.of(context).textTheme.headline2,)),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20,), child: Text('VS'),),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(match.team1Score.toString(), style: Theme.of(context).textTheme.headline2,)),
                  ],),
                )

              ],
            ),
          ],
        ),
      );
    }


    if( match.matchQueueId == 486) {

      return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Score:', style: Theme.of(context).textTheme.headline2,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Team 1 \n bans:'),
                  _BansImages(url: '${ChampImageProvider.urlChampImageById(match.banId1)}'),
                  _BansImages(url: '${ChampImageProvider.urlChampImageById(match.banId3)}'),
                  _BansImages(url: '${ChampImageProvider.urlChampImageById(match.banId6)}'),
                ],
              ),
              
                ( match.winningTaskForce == 1  )
                ? Container(
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(match.team1Score.toString(), style: Theme.of(context).textTheme.headline2,)),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20,), child: Text('VS'),),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(match.team2Score.toString(), style: Theme.of(context).textTheme.headline2,)),
                    ],
                  )
                )
                : Container(
                  child: Row(children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(match.team2Score.toString(), style: Theme.of(context).textTheme.headline2,)),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20,), child: Text('VS'),),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 2), child: Text(match.team1Score.toString(), style: Theme.of(context).textTheme.headline2,)),
                  ],),
                ),

              Column(
                children: [
                  Text('Team 2 \n bans:'),
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

    return Container(
      child: Column(
        children: [
          SizedBox(height: 5,),
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 20,), child: Text('VS'),),
              ],
            ),
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

class _Loadouts extends StatelessWidget {

  final GetMatchDetailsResponse player;
  const _Loadouts({Key? key, required this.player}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final itemList = Provider.of<PaladinsProvider>(context).getItemsResponse;
  
  return Container(
    
    child: Row(
      children: [
        _ImageInteractive(url: _getItemUrls(player.itemId6, itemList), level: player.itemLevel6, id: player.itemId6),
        _ImageInteractive(url: _getItemUrls(player.itemId1, itemList), level: player.itemLevel1, id: player.itemId1),
        _ImageInteractive(url: _getItemUrls(player.itemId2, itemList), level: player.itemLevel2, id: player.itemId2),
        _ImageInteractive(url: _getItemUrls(player.itemId3, itemList), level: player.itemLevel3, id: player.itemId3),
        _ImageInteractive(url: _getItemUrls(player.itemId4, itemList), level: player.itemLevel4, id: player.itemId4),
        _ImageInteractive(url: _getItemUrls(player.itemId5, itemList), level: player.itemLevel5, id: player.itemId5),

      ],
    ),
  );
  }
}

class _Items extends StatelessWidget {
  final GetMatchDetailsResponse player;
  const _Items({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemList = Provider.of<PaladinsProvider>(context).getItemsResponse;
  
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _ImageInteractive(url: _getItemUrls(player.activeId1, itemList), level: player.activeLevel1, id: player.activeId1),
        _ImageInteractive(url: _getItemUrls(player.activeId2, itemList), level: player.activeLevel2, id: player.activeId2),
        _ImageInteractive(url: _getItemUrls(player.activeId3, itemList), level: player.activeLevel3, id: player.activeId3),
        _ImageInteractive(url: _getItemUrls(player.activeId4, itemList), level: player.activeLevel4, id: player.activeId4),

      ],
    ),
  );
  }
  }


class _ImageInteractive extends StatelessWidget {
  final String url;
  final int level;
  final int id;

  const _ImageInteractive({Key? key, required this.url,  required this.level, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      child: GestureDetector(
        onTap: () {
            _buildShowDialog(context,  _getItemOfMatch(id), level );
        },
        child: _ImageLoadoutAndItem(url: url),
      ),
    );
    
  
  }



  Future<dynamic> _buildShowDialog(BuildContext context, GetItemsResponse item, int level) {
    final size = MediaQuery.of(context).size;
    if(item.description == ''){
      return showDialog(
    context: context,
    builder: (BuildContext context) { return Container();}
      );}
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
              width: double.maxFinite,
              height: 150 ,
              child: Row(children: [
                _ImageLoadoutAndItem(url: url),
                SizedBox( width: 7.5),

                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: size.width - 185 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.deviceName, style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text(item.description, maxLines: 5, overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify,),
                      if(level != 0)
                      Padding( padding: EdgeInsets.only(top: 10), child: Text('Level: $level'))
                  ],)
                ) 
              
              ],)
          ),
        );
    }
  );
  }
}

class _ImageLoadoutAndItem extends StatelessWidget {
  const _ImageLoadoutAndItem({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        
        fit:BoxFit.fill,
        width:50,
        height:40,
        imageUrl:'$url',
        placeholder:(context, url) => CircularProgressIndicator(),
        errorWidget:(context, url, error) {
          return Container(
            padding: EdgeInsets.all(1),
            child: CachedNetworkImage(
              
              fit:BoxFit.fill,
              width:50,
              height:40,
              imageUrl:'https://static.thenounproject.com/png/504708-200.png',
              placeholder:(context, url) => CircularProgressIndicator(),
              errorWidget:(context, url, error) => new Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }
}

 

_getItemUrls(int itemId, List<GetItemsResponse> getItemsResponse){
  int i = 0;
  while(i != getItemsResponse.length){
    if( getItemsResponse[i].itemId == itemId){
      itemsUsados.add(getItemsResponse[i]);
      return getItemsResponse[i].itemIconUrl;
    }
    i++;
  }
  return 'https://i.pinimg.com/originals/97/ea/a6/97eaa682491355a6c6b2ad3c7f086a3a.jpg';
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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

_getItemOfMatch(int itemId){
  int i = 0;
  while(i != itemsUsados.length){
    if( itemsUsados[i].itemId == itemId){
      return itemsUsados[i];
    }
    i++;
  }
}

 