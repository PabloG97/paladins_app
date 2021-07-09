import 'package:flutter/cupertino.dart';
//import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;


class PaladinsProvider {

  String _devId          = '3998';
  String _authKey        = '5A0807BD531045C491C067C8CEA3AF87';
  String _endPoint       = 'api.paladins.com/paladinsapi.svc'; //No se coloca https
  String _responseFormat = 'Json';
  DateTime today = new DateTime.now().toUtc();
    

  PaladinsProvider() {

    print('PaladinsProvider init'); 
    this.createSignature('');

  }

  createSignature(String request) async {
    String _timeStamp ="${today.year.toString()}${today.month.toString().padLeft(2,'0')}${today.day.toString().padLeft(2,'0')}${today.hour.toString().padLeft(2,'0')}${today.minute.toString().padLeft(2,'0')}${today.second.toString().padLeft(2,'0')}";
    print(_timeStamp);
    String _signature = _devId+request+_authKey+_timeStamp; //+ currentTime
    //var url = Uri.https('https://api.paladins.com/paladinsapi.svc', '/books/v1/volumes', {'q': '{http}'});
    //var url = Uri.https(_endPoint, '/books/v1/volumes', {'q': '{http}'});
    var _bytes = utf8.encode(_signature);
    var _digest = md5.convert(_bytes);
    
    return _digest;
  }
}