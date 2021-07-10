import 'package:flutter/cupertino.dart';
//import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:paladins_app/models/models.dart';


class PaladinsProvider extends ChangeNotifier {

  String _devId          = '3998';
  String _authKey        = '5A0807BD531045C491C067C8CEA3AF87';
  String _endPoint       = 'api.paladins.com'; //No se coloca https
  String _responseFormat = 'Json';
  String _sessionId      = '';
  DateTime today         = new DateTime.now().toUtc();
  String _timeStamp      = '';
  List<dynamic> _profile = [];
    

  PaladinsProvider() {

    print('PaladinsProvider init');
    _timeStamp = getTimeStamp(today);
    String _signature = this.createSignature('createsession');
    createSession(_signature);
    
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
    var url = Uri.https(_endPoint, '/paladinsapi.svc/createsession$_responseFormat/$_devId/$signature/$_timeStamp');

    final response = await http.get(url);
    final Map<String, dynamic>decodedData = json.decode(response.body);
    _sessionId =  decodedData['session_id'];
    String _signature = this.createSignature('getplayer');
    getPlayer(_signature);
  }

  getPlayer(String signature) async{
    String _timeStamp = getTimeStamp(today);
    var url = Uri.https(_endPoint, '/paladinsapi.svc/getplayer$_responseFormat/$_devId/$signature/$_sessionId/$_timeStamp/Gêno');
    print('URL (getplayer): $url');
    final response = await http.get(url);
    final getPlayerResponse = getPlayerReponseFromJson(response.body);
    //print( getPlayerResponse[0].rankedKbm.rank  );
  }
}