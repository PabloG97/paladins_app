import 'dart:async';

import 'package:flutter/cupertino.dart';
//import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:paladins_app/helpers/debouncer.dart';
import 'package:paladins_app/models/models.dart';


class PaladinsProvider extends ChangeNotifier {

  String _devId          = '3998';
  String _authKey        = '5A0807BD531045C491C067C8CEA3AF87';
  String _endPoint       = 'api.paladins.com'; //No se coloca https
  String _responseFormat = 'Json';
  String _sessionId      = '';
  String _timeStamp      = '';
  String _idCasuals       = '/';
  DateTime _today         = new DateTime.now().toUtc();
  String state           = '';
  int status             = -1;
  String playerSearch    = 'Gêno';
  int playerId           = -1;


  
  List<GetPlayer> getPlayerResponse = [];
  List<GetPlayer> getPlayerBatch = [];
  List<MatchPlayerDetails> matchPlayerDetails = [];
  List<GetChampionsRankResponse> championsRank = [];
  List<GetQueueStatsResponse> getQueueStatsResponse = [];
  List<GetMatchHistoryResponse> getMatchHistoryResponse = [];
  Map<int, List<GetMatchDetailsResponse>> getMatchDetailResponse = {};
  List<GetItemsResponse> getItemsResponse = [];
  List<SearchPlayerResponse> searchPlayerResponse = [];

  //List<dynamic> _profile = [];
  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500),
  );
  final StreamController<List<SearchPlayerResponse>> _suggestionStreamController = new StreamController.broadcast(); 
  Stream<List<SearchPlayerResponse>> get suggestionStream => this._suggestionStreamController.stream;


  PaladinsProvider()  {

    print('PaladinsProvider init');
    _timeStamp = getTimeStamp(_today);
   
    createSession();
    
  }

  Future<String> _getJsonData(String method, [String parameter = '']) async {
    String _signature = createSignature(method);
    final url = Uri.https(_endPoint, '/paladinsapi.svc/$method$_responseFormat/$_devId/$_signature/$_sessionId/$_timeStamp$parameter');
    final response = await http.get(url);
    print('URL ($method): $url');
    return response.body;
  }

  getTimeStamp(DateTime today){
    String _timeStamp ="${today.year.toString()}${today.month.toString().padLeft(2,'0')}${today.day.toString().padLeft(2,'0')}${today.hour.toString().padLeft(2,'0')}${today.minute.toString().padLeft(2,'0')}${today.second.toString().padLeft(2,'0')}";
    return _timeStamp;
  }

  createSignature(String request) {
    //String _timeStamp = getTimeStamp(today);
    String _signature = _devId+request+_authKey+_timeStamp; //+ currentTime
    List<int> _bytes = utf8.encode(_signature);
    Digest _digest = md5.convert(_bytes);
    
    return _digest.toString();
  }

  createSession() async {
    String _signature =  this.createSignature('createsession');
    final url = Uri.https(_endPoint, '/paladinsapi.svc/createsession$_responseFormat/$_devId/$_signature/$_timeStamp');
    //print('createSession (URL): $url');
    final response = await http.get(url);
    final Map<String, dynamic>decodedData = json.decode(response.body);
    _sessionId =  decodedData['session_id'];
    getPlayer();
    getItems();
    

  }

  Future getPlayer() async{
    final _response = await this._getJsonData('getplayer', '/$playerSearch');
    final _getPlayerResponse = getPlayerReponseFromJson(_response);
    getPlayerResponse = _getPlayerResponse;
    playerId = _getPlayerResponse[0].id;
    getPlayerStatus( playerId);
    getChampionsRank(playerId);
    getQueueStats(playerId, 486);
    getMatchHistory();
    notifyListeners();
    // _getJsonData('getchampionskins','/2092/9');
    // _getJsonData('getbountyitems');
  }
  
  // getChampions() async{
    
  //   final jsonData = await this._getJsonData('getchampions','/1');
  //   final _getChampions = getChampionsResponseFromJson( jsonData );
  //   // for (int i = 0; i < jsonData.length; i++){

  //   //   print('case "${_getChampions[i].nameEnglish}": {  return "${_getChampions[i].championIconUrl}";} ');
  //   //   print("${_getChampions[i].championIconUrl}");
  //   // }
  
  // }

  getPlayerStatus(int playerId) async {
    final jsonData = await this._getJsonData('getplayerstatus','/$playerId');
    final decodedData = json.decode( jsonData ) ;
    int _matchId = ( decodedData[0]['Match']);
    state = ( decodedData[0]['status_string']);
    status = decodedData[0]['status'];
    if( status ==  3) getMatchPlayerDetails(_matchId);
    notifyListeners();
  }

  getChampionsRank(int playerId) async {
    final jsonData = await this._getJsonData('getchampionranks','/$playerId');
    final _getChampionsRank = getChampionsRankResponseFromJson( jsonData );
    championsRank = _getChampionsRank;
    notifyListeners();
  }

  getMatchPlayerDetails(int matchId) async {
    if(matchId == 0) {
      return null;
    }else {
      final jsonData = await this._getJsonData('getmatchplayerdetails','/$matchId');
      final decodedData = getMatchPlayerDetailsFromJson( jsonData );
      matchPlayerDetails = decodedData;
      if(matchPlayerDetails[0].queue != '486'){
        for(int i=0; i< matchPlayerDetails.length - 1; i++){
          _idCasuals = '$_idCasuals${matchPlayerDetails[i].playerId.toString()},';
        }
        _idCasuals= '$_idCasuals${matchPlayerDetails[matchPlayerDetails.length-1].playerId.toString()}';
        final jsonData = await this._getJsonData('getplayerbatch', '$_idCasuals');
        final decodedData = getPlayerReponseFromJson(jsonData);
        getPlayerBatch = decodedData;

        for (int j = 0; j < matchPlayerDetails.length; j++){
          for(int k = 0; k < getPlayerBatch.length; k++){
            if(getPlayerBatch[k].hirezName == matchPlayerDetails[j].playerName){
              matchPlayerDetails[j].tier = getPlayerBatch[k].tierRankedKbm;
            }
          }
        }
      }
    }
    //dataRecolected = matchPlayerDetails[0].championName!;
    notifyListeners();
  }

  getQueueStats(int playerId, int queueId) async {

    final jsonData = await this._getJsonData('getqueuestats','/$playerId/$queueId');
    final _getQueueStats = getQueueStatsResponseFromJson( jsonData );
    getQueueStatsResponse = ( _getQueueStats );
    notifyListeners();
  }

  Future getMatchHistory() async {
    final jsonData = await this._getJsonData('getmatchhistory', '/$playerId');
    final _getMatchHistoryResponse = getMatchHistoryResponseFromJson( jsonData );
    getMatchHistoryResponse = _getMatchHistoryResponse;
    notifyListeners();
  }

  Future <List<GetMatchDetailsResponse>> getMatchDetails(int matchId) async{

    if (getMatchDetailResponse.containsKey(matchId)) return getMatchDetailResponse[matchId]!;
    _idCasuals       = '/';
    print( 'Pidiendo info al server' );
    final jsonData = await this._getJsonData('getmatchdetails','/$matchId');
    final decodedData = getMatchDetailsResponseFromJson( jsonData );

    if (decodedData[0].matchQueueId != 486){
      for(int i=0; i< decodedData.length - 1; i++){
        _idCasuals = '$_idCasuals${decodedData[i].playerId.toString()},';
      }
      _idCasuals= '$_idCasuals${decodedData[decodedData.length-1].playerId.toString()}';
      final _jsonData = await this._getJsonData('getplayerbatch', '$_idCasuals');
      final _decodedData = getPlayerReponseFromJson(_jsonData);
      getPlayerBatch = _decodedData;

      for (int j = 0; j < decodedData.length; j++){
        for(int k = 0; k < getPlayerBatch.length; k++){
          if(getPlayerBatch[k].hirezName == decodedData[j].playerName){
            decodedData[j].leagueTier = getPlayerBatch[k].tierRankedKbm;
          }
        }
      }
    }

    getMatchDetailResponse[matchId] = decodedData;
    return decodedData;
  }

  getItems() async{

    final jsonData = await this._getJsonData('getitems','/1');
    final _getItemsResponse = getItemsResponseFromJson( jsonData );
    getItemsResponse = _getItemsResponse;
    notifyListeners();
  }

  Future <List<SearchPlayerResponse>> searchPlayer(String query) async {
    String _signature = createSignature('searchplayers');
    final url = Uri.https(_endPoint, '/paladinsapi.svc/searchplayers$_responseFormat/$_devId/$_signature/$_sessionId/$_timeStamp/$query');
    
    print('URL (searchplayers) = $url');
    final response = await http.get(url);
    final searchResponse = searchPlayerResponseFromJson(response.body);
    
    return searchResponse;
  }

  void getSuggestionsByQuery( String searchTerm) {
     
    debouncer.value = '';
    debouncer.onValue = ( value ) async {

      final results = await this.searchPlayer( value );
      this._suggestionStreamController.add( results );

    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
     });

    Future.delayed(Duration(milliseconds: 301)).then(( _ ) => timer.cancel());

  }

clearData(String newName){
  
  if( newName != playerSearch){
    playerSearch = newName;
    getPlayerResponse = [];
    getMatchHistoryResponse = [];
    getPlayerBatch = [];
    getPlayer();
  }
  

}


}

