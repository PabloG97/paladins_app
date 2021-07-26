
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
      return Text('builResults');
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

    return FutureBuilder(
      future: profileProvider.searchPlayer(query),
      builder: ( _ , AsyncSnapshot <List<SearchPlayerResponse>> snapshot){
        
        if(!snapshot.hasData) return _emptyContainer(); 


        final profiles = snapshot.data!;
        return ListView.builder(
          itemCount: profiles.length,
          itemBuilder: ( _ , int index) => _ProfileItem(profile: profiles[index]) ,
        );

      },
    );
  }
}

class _ProfileItem extends StatelessWidget {

  final SearchPlayerResponse profile;

  const _ProfileItem({Key? key, required this.profile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text( profile.portalId ),
      title: Text(profile.hirezName),
      subtitle: Text('id: ${profile.playerId}'),
      onTap: (){print(profile.hzPlayerName);},
    );
  }
}