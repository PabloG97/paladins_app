import 'package:flutter/material.dart';

final miTema = ThemeData.light().copyWith(
  accentColor: Colors.lightBlueAccent,
  appBarTheme: AppBarTheme(
    color: Color.fromRGBO(94, 182, 202, 0.85),
  ),
  
  
);


ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline5: base.headline5?.copyWith(
          fontFamily: 'Roboto',
          fontSize: 22.0,
          color: Colors.black,
        ),
        headline6: base.headline6?.copyWith(
          fontFamily: 'Merriweather',
          fontSize: 15.0,
          color: Colors.green
        ),
        headline4: base.headline4?.copyWith(
          fontFamily: 'Roboto',
          fontSize: 24.0,
          color: Colors.white,
        ),
        headline3: base.headline3?.copyWith(
          fontFamily: 'Merriweather',
          fontSize: 22.0,
          color: Colors.grey,
        ),
        caption: base.caption?.copyWith(
          color: Color(0xFFCCC5AF),
        ),
        bodyText2: base.bodyText2?.copyWith(color: Color(0xFF807A6B)));
  }
  final ThemeData base = ThemeData.light();
  
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      //textTheme: Typography().white,
      primaryColor: Color(0xffce107c),
      //primaryColor: Color(0xff4829b2),
      indicatorColor: Color(0xFF807A6B),
      scaffoldBackgroundColor: Color(0xFFF5F5F5),
      accentColor: Color(0xFFFFF8E1),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 20.0,
      ),
      buttonColor: Colors.white,
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xffce107c),
        unselectedLabelColor: Colors.grey,
      ));
}


ThemeData experimentalTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
        headline1: base.headline1?.copyWith(
          //fontFamily: 'play',
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black87
        ),
        headline2: base.headline2?.copyWith(
          // fontFamily: 'HackNerdFont',
          fontSize: 18,
          //letterSpacing: 0,
          color: Colors.black
        ),
        headline3: base.headline3?.copyWith(
          fontFamily: 'play',
          fontSize: 20.0,
          color: Colors.black,
          // fontWeight: FontWeight.bold,
        ),
        headline4: base.headline4?.copyWith(
          fontFamily: 'play',
          fontSize: 21.0,
          color: Colors.white,
        ),
        headline5: base.headline5?.copyWith(
         fontFamily: 'play',
          fontSize: 19.0,
          color: Colors.white,
        ),
        headline6: base.headline6?.copyWith(
          fontFamily: 'play',
          fontSize: 20.35,
          color: Colors.black54,
          fontWeight: FontWeight.w600
        ),
        bodyText1: base.bodyText1?.copyWith(
          fontSize: 17,
          color: Colors.black
        ),
        bodyText2: base.bodyText2?.copyWith(
          fontSize: 15,
          color: Colors.black
        ),
        
        
        caption: base.caption?.copyWith(
          //color: Color(0xFFCCC5AF),
          color: Colors.brown
        ),
    );
    
  }


  final ThemeData base = ThemeData.light();
  
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      //textTheme: Typography().white,
      primaryColor: Color(0xff2a3e54),
      //primaryColor: Color(0xff4829b2),
      indicatorColor: Color(0xFF807A6B),
      scaffoldBackgroundColor: Color(0xFFF5F5F5),
      accentColor: Color(0xFF000000),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 20.0,
      ),
      buttonColor: Colors.white,
      backgroundColor: Colors.white,
      tabBarTheme: base.tabBarTheme.copyWith(
        labelColor: Color(0xffce107c),
        unselectedLabelColor: Colors.grey,
      ));
}