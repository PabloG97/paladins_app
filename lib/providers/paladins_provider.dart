import 'package:flutter/cupertino.dart';
//import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:paladins_app/models/get_match_player_details_response.dart';
import 'package:paladins_app/models/models.dart';


class PaladinsProvider extends ChangeNotifier {

  String _devId          = '3998';
  String _authKey        = '5A0807BD531045C491C067C8CEA3AF87';
  String _endPoint       = 'api.paladins.com'; //No se coloca https
  String _responseFormat = 'Json';
  String _sessionId      = '';
  String _timeStamp      = '';
  DateTime today         = new DateTime.now().toUtc();
  String  dataRecolected = '';
  String state           = '';
  String idCasuals       = '/';
  
  List<GetPlayer> playerData = [];
  List<GetPlayer> getPlayerBatch = [];
  List<MatchPlayerDetails> matchPlayerDetails = [];
  //List<dynamic> _profile = [];
    

  PaladinsProvider()  {

    print('PaladinsProvider init');
    _timeStamp = getTimeStamp(today);
    String _signature =  this.createSignature('createsession');
    createSession(_signature);
    
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

  createSession(String signature) async {
    final url = Uri.https(_endPoint, '/paladinsapi.svc/createsession$_responseFormat/$_devId/$signature/$_timeStamp');
    final response = await http.get(url);
    final Map<String, dynamic>decodedData = json.decode(response.body);
    _sessionId =  decodedData['session_id'];
    getPlayer();

  }

  Future getPlayer() async{
    final _response = await this._getJsonData('getplayer', '/Gêno');
    final _getPlayerResponse = getPlayerReponseFromJson(_response);
    //getData(_getPlayerResponse);
    playerData = _getPlayerResponse;
    
    getPlayerStatus( _getPlayerResponse[0].id);
    notifyListeners();
  }
  
  getPlayerStatus(int playerId) async {
    final jsonData = await this._getJsonData('getplayerstatus','/$playerId');
    final decodedData = json.decode( jsonData ) ;
    int _matchId = ( decodedData[0]['Match']);
    state = ( decodedData[0]['status_string']);
    //dataRecolected = state;
    notifyListeners();
    getMatchPlayerDetails(_matchId);
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
          idCasuals = '$idCasuals${matchPlayerDetails[i].playerId.toString()},';
        }
        idCasuals= '$idCasuals${matchPlayerDetails[matchPlayerDetails.length-1].playerId.toString()}';
        final jsonData = await this._getJsonData('getplayerbatch', '$idCasuals');
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
    dataRecolected = matchPlayerDetails[0].championName!;
    notifyListeners();
  }


}