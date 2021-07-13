
class RankProvider{
  static urlRank(int tier){
    switch(tier) { 
        //Bronze 
        case 1: {  return 'https://static.wikia.nocookie.net/paladins_gamepedia/images/d/d0/RankIcon_Bronze_5.png/revision/latest/scale-to-width-down/128?cb=20170810053228 ';} 
        case 2: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/d/d2/RankIcon_Bronze_4.png/revision/latest/scale-to-width-down/128?cb=20170810053222"); } 
        case 3: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/5/55/RankIcon_Bronze_3.png/revision/latest/scale-to-width-down/128?cb=20170810053216"); } 
        case 4: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/5/5b/RankIcon_Bronze_2.png/revision/latest/scale-to-width-down/128?cb=20170810053210"); } 
        case 5: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/6/6e/RankIcon_Bronze_1.png/revision/latest/scale-to-width-down/128?cb=20170810053205"); } 
        
        //Silver
        case 6: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/1/1c/RankIcon_Silver_5.png/revision/latest/scale-to-width-down/128?cb=20170810053445"); } 
        case 7: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/1/13/RankIcon_Silver_4.png/revision/latest/scale-to-width-down/128?cb=20170810053440"); } 
        case 8: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/9/95/RankIcon_Silver_3.png/revision/latest/scale-to-width-down/128?cb=20170810053435"); } 
        case 9: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/7/77/RankIcon_Silver_2.png/revision/latest/scale-to-width-down/128?cb=20170810053429"); } 
        case 10: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/1/17/RankIcon_Silver_1.png/revision/latest/scale-to-width-down/128?cb=20170810053423"); } 

        //gold
        case 11: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/4/48/RankIcon_Gold_5.png/revision/latest/scale-to-width-down/128?cb=20170810053328"); } 
        case 12: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/6/6d/RankIcon_Gold_4.png/revision/latest/scale-to-width-down/128?cb=20170810053322"); } 
        case 13: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/1/12/RankIcon_Gold_3.png/revision/latest/scale-to-width-down/128?cb=20170810053316"); } 
        case 14: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/2/21/RankIcon_Gold_2.png/revision/latest/scale-to-width-down/128?cb=20170810053310"); } 
        case 15: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/e/ed/RankIcon_Gold_1.png/revision/latest/scale-to-width-down/128?cb=20170810053305"); } 
        
        //platinum
        case 16: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/0/05/RankIcon_Platinum_5.png/revision/latest/scale-to-width-down/128?cb=20170810053411"); } 
        case 17: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/e/e1/RankIcon_Platinum_4.png/revision/latest/scale-to-width-down/128?cb=20170810053405"); } 
        case 18: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/3/3c/RankIcon_Platinum_3.png/revision/latest/scale-to-width-down/128?cb=20170810053359"); } 
        case 19: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/9/9a/RankIcon_Platinum_2.png/revision/latest/scale-to-width-down/128?cb=20170810053352"); } 
        case 20: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/c/c3/RankIcon_Platinum_1.png/revision/latest/scale-to-width-down/128?cb=20170810053347"); } 
        
        //diamond
        case 21: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/0/03/RankIcon_Diamond_5.png/revision/latest/scale-to-width-down/128?cb=20170810053259"); } 
        case 22: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/8/8a/RankIcon_Diamond_4.png/revision/latest/scale-to-width-down/128?cb=20170810053253"); } 
        case 23: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/8/84/RankIcon_Diamond_3.png/revision/latest/scale-to-width-down/128?cb=20170810053247"); } 
        case 24: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/4/4d/RankIcon_Diamond_2.png/revision/latest/scale-to-width-down/128?cb=20170810053240"); } 
        case 25: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/f/f1/RankIcon_Diamond_1.png/revision/latest/scale-to-width-down/128?cb=20170810053234"); } 
        
        //master
        case 26: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/9/9c/RankIcon_Master.png/revision/latest/scale-to-width-down/128?cb=20170810053340"); } 
        //grandmaster
        case 27: {  return("https://static.wikia.nocookie.net/paladins_gamepedia/images/8/86/RankIcon_Grandmaster.png/revision/latest/scale-to-width-down/128?cb=20170810053334"); } 
        
      
        default: { return("https://static.wikia.nocookie.net/paladins_gamepedia/images/8/8e/RankIcon_Qualifying.png/revision/latest/scale-to-width-down/128?cb=20170810053417"); } 
    } 
  }
}