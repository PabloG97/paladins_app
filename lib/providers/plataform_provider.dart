class PlataformProvider{
  static urlPlataform(String plataformId){
    switch(plataformId) { 
        //Andro 
        case '1': {  return "https://unity.com/sites/default/files/styles/medium/public/2020-10/Hi-Res-Studios-Logo.png?itok=4VCYhDwt";}
        case '5': {  return "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/steam-square-512.png";}
        case '9': {  return "https://cdn4.iconfinder.com/data/icons/miu-black-social-2/60/playstation-512.png";}
        case '10': {  return "https://cdn1.iconfinder.com/data/icons/social-black-buttons/512/xbox-512.png";}
        case '22': {  return "https://cdn4.iconfinder.com/data/icons/logos-and-brands-1/512/232_Nintendo_Switch_logo-512.png";}
        case '25': {  return "https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/discord-512.png";}
        case '28': {  return "https://cdn.icon-icons.com/icons2/2428/PNG/512/epic_games_black_logo_icon_147139.png";}
        default: { return("https://static.thenounproject.com/png/1554486-200.png"); } 
    } 
  }
}