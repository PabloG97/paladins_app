
import 'package:flutter/material.dart';
import 'package:paladins_app/models/models.dart';
import 'package:paladins_app/providers/providers.dart';
import 'package:provider/provider.dart';

class ProfileSearchDelegate extends SearchDelegate{

  @override
  String get searchFieldLabel => 'Search profile';


  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton( 
          icon: Icon(Icons.clear),
          onPressed: () => query = '',
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: (){
          close(context,null);
        }, 
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      if(query.isEmpty){
        return _emptyContainer();
      }

      final profileProvider = Provider.of<PaladinsProvider>(context, listen: false);
      profileProvider.getSuggestionsByQuery(query);
      return StreamBuilder(
        stream: profileProvider.suggestionStream,
        builder: ( _ , AsyncSnapshot <List<SearchPlayerResponse>> snapshot){
          
          if(!snapshot.hasData) return _emptyContainer(); 


          final profiles = snapshot.data!;
          return ListView.builder(
            itemCount: profiles.length,
            itemBuilder: ( _ , int index) => _ProfileItem(profile: profiles[index], profileProvider: profileProvider)
          );

        },
      );
    }
  

    Widget _emptyContainer(){
      return Container(
        child: Center(
          child: Icon(Icons.person_search, color: Colors.black38, size: 150,),
        ),
      );
    }

    @override
    Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return _emptyContainer();
    }

    final profileProvider = Provider.of<PaladinsProvider>(context, listen: false);
    profileProvider.getSuggestionsByQuery(query);
    return StreamBuilder(
      stream: profileProvider.suggestionStream,
      builder: ( _ , AsyncSnapshot <List<SearchPlayerResponse>> snapshot){
        
        if(!snapshot.hasData) return _emptyContainer(); 


        final profiles = snapshot.data!;
        return ListView.builder(
          itemCount: profiles.length,
          itemBuilder: ( _ , int index) => _ProfileItem(profile: profiles[index], profileProvider: profileProvider)
        );

      },
    );
  }
}

class _ProfileItem extends StatelessWidget {

  final SearchPlayerResponse profile;
  final PaladinsProvider profileProvider;

  const _ProfileItem({Key? key, required this.profile, required this.profileProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  if(profile.hzPlayerName == null){ return Container();}
    return ListTile(  
      leading: FadeInImage(
        image: NetworkImage(PlataformProvider.urlPlataform(profile.portalId)), 
        placeholder: AssetImage('assets/no-image.jpg'),
        height: 50,
        width: 50,),
      title: Text(profile.hirezName),
      subtitle: Text('id: ${profile.playerId}'),
      onTap: (){
        if(profile.hzPlayerName == null ){}
        if (profile.hzPlayerName == profileProvider.getPlayerResponse[0].name ) {
          Navigator.pop(context, 'tabs' );
        }
        else{
          profileProvider.getPlayerResponse = [];
          profileProvider.getMatchHistoryResponse = [];
          profileProvider.matchPlayerDetails = [];
          profileProvider.playerSearch = profile.hzPlayerName!;
          profileProvider.getPlayer();
          // Navigator.push(context, 'tabs');
          Navigator.pop(context, 'tabs' );
          print(profile.hzPlayerName);
        }
        },
    );
  }
  
}

