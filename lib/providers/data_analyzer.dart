

import 'package:paladins_app/models/models.dart';

class DataAnalyzer {

  static mainRoleRanked(List<GetQueueStatsResponse> championList){
    int _supportMatches = 0, _frontlineMatches = 0, _flankMatches = 0, _damageMatches = 0;

    for( int i = 0; i < championList.length; i++ ){
      if(championList[i].champion == 'Ash' || championList[i].champion == 'Atlas' || championList[i].champion == 'Barik' || championList[i].champion == 'Fernando' || championList[i].champion == 'Inara' || championList[i].champion == 'Khan' || championList[i].champion == 'Makoa' || championList[i].champion == 'Raum' || championList[i].champion == 'Ruckus' || championList[i].champion == 'Terminus' || championList[i].champion == 'Terminus' || championList[i].champion == 'Torvald' ||  championList[i].champion == 'Yagorath'){
        _frontlineMatches += championList[i].matches;
      }else if(championList[i].champion == 'Corvus' || championList[i].champion == 'Furia' || championList[i].champion == 'Grohk' || championList[i].champion == 'Grover' || championList[i].champion == 'Io' || championList[i].champion == 'Jenos' || championList[i].champion == "Mal'Damba" || championList[i].champion == 'Pip' || championList[i].champion == 'Rei' || championList[i].champion == 'Seris' || championList[i].champion == 'Seris' || championList[i].champion == 'Ying'){
        _supportMatches += championList[i].matches;
      }else if(championList[i].champion == 'Androxus' || championList[i].champion == 'Buck' || championList[i].champion == 'Evie' || championList[i].champion == 'Koga' || championList[i].champion == 'Lex' || championList[i].champion == 'Maeve' || championList[i].champion == "Moji" || championList[i].champion == 'Skye' || championList[i].champion == 'Talus' || championList[i].champion == 'Vatu' || championList[i].champion == 'Vora' || championList[i].champion == 'Zhin'){
        _flankMatches += championList[i].matches;
      }else if(championList[i].champion == 'Bomb King' || championList[i].champion == 'Cassie' || championList[i].champion == 'Dredge' || championList[i].champion == 'Drogoz' || championList[i].champion == 'Imani' || championList[i].champion == 'Kinessa' || championList[i].champion == "Lian" || championList[i].champion == 'Octavia' || championList[i].champion == 'Sha Lin' || championList[i].champion == 'Strix' || championList[i].champion == 'Tiberius' || championList[i].champion == 'Tyra' || championList[i].champion == 'Viktor' || championList[i].champion == 'Vivian' || championList[i].champion == 'Willo'){
        _damageMatches += championList[i].matches;
      }
    }
    
    if(_frontlineMatches > _supportMatches && _frontlineMatches > _flankMatches && _frontlineMatches > _damageMatches) return 'Front Line';
    if( _supportMatches > _flankMatches && _supportMatches > _damageMatches) return 'Support';
    if( _flankMatches > _damageMatches) return 'Flanker';
    else return 'Damage';
  }



  static getImageRole( String champion){
    
      if(champion == 'Ash' || champion == 'Atlas' || champion == 'Barik' || champion == 'Fernando' || champion == 'Inara' || champion == 'Khan' || champion == 'Makoa' || champion == 'Raum' || champion == 'Ruckus' || champion == 'Terminus' || champion == 'Terminus' || champion == 'Torvald' ||  champion == 'Yagorath'){
        
        return 'assets/img/Frontline_Icon.png';
      
      }else if(champion == 'Corvus' || champion == 'Furia' || champion == 'Grohk' || champion == 'Grover' || champion == 'Io' || champion == 'Jenos' || champion == "Mal'Damba" || champion == 'Pip' || champion == 'Rei' || champion == 'Seris' || champion == 'Seris' || champion == 'Ying'){
        
        return 'assets/img/Support_Icon.png';
      
      }else if(champion == 'Androxus' || champion == 'Buck' || champion == 'Evie' || champion == 'Koga' || champion == 'Lex' || champion == 'Maeve' || champion == "Moji" || champion == 'Skye' || champion == 'Talus' || champion == 'Vatu' || champion == 'Vora' || champion == 'Zhin'){
        
        return 'assets/img/Flank_Icon.png';
     
      }else if(champion == 'Bomb King' || champion == 'Cassie' || champion == 'Dredge' || champion == 'Drogoz' || champion == 'Imani' || champion == 'Kinessa' || champion == "Lian" || champion == 'Octavia' || champion == 'Sha Lin' || champion == 'Strix' || champion == 'Tiberius' || champion == 'Tyra' || champion == 'Viktor' || champion == 'Vivian' || champion == 'Willo'){
        
        return 'assets/img/Damage_Icon.png';
      
      }
  }
}


