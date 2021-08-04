class MapProvider{
  static nameMap(String map){
    switch(map) { 
      //Siege
      case "Frog"        : {  return "assets/maps/Siege/Frog_Isle.jpg";}  
      case "Jaguar"      : {  return "assets/maps/Siege/Jaguar_Falls.png";}  
      case "Serpent"     : {  return "assets/maps/Siege/Serpent_Beach.png";}  
      case "Frozen"      : {  return "assets/maps/Siege/Frozen_Guard.png";}  
      case "Ice"         : {  return "assets/maps/Siege/Ices_Mines.png";}  
      case "Fish"        : {  return "assets/maps/Siege/Fish_Market.png";}  
      case "Timber"      : {  return "assets/maps/Siege/Timber_Mill.png";}  
      case "Stone"       : {  return "assets/maps/Siege/Stone_Keep.png";}  
      case "Brightmarsh" : {  return "assets/maps/Siege/Brightmarsh.jpg";}  
      case "Splitstone"  : {  return "assets/maps/Siege/Splitstone_Quarry.png";}  
      case "Ascension"   : {  return "assets/maps/Siege/Ascension_Peak.jpg";}  
      case "Warder's"    : {  return "assets/maps/Siege/Warders_Gate.jpg";}  
      case "Shattered"   : {  return "assets/maps/Siege/Shattered_Desert.png";}  
      case "Bazaar"      : {  return "assets/maps/Siege/Bazaar.png";}  
      //Others

      case "Primal"      : {  return "assets/maps/Others/Tropical_Arena.png";}  
      case "Foreman's"   : {  return "assets/maps/Others/Quarry_Onslaught.png";}  
      case "Magistrate's": {  return "assets/maps/Others/Archives.png";}  
      case "Marauder's"  : {  return "assets/maps/Others/Marauder.jpg";}  
      case "Snowfall"    : {  return "assets/maps/Others/IceArena_tdm.png";}  
      case "Trade"       : {  return "assets/maps/Others/Trade_District.png";}  
      case "Abyss"       : {  return "assets/maps/Others/Abyss.png";}  
      case "Throne"      : {  return "assets/maps/Others/Throne.png";}  
      case "Dragon"      : {  return "assets/maps/Others/Dragons_Arena.png";}  
      default            : {  return "assets/maps/Others/Default.png"; }
          
    }
  }
}