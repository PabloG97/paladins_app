import 'package:flutter/material.dart';
import 'package:paladins_app/providers/paladins_provider.dart';
import 'package:paladins_app/screens/profile_screen.dart';
import 'package:paladins_app/screens/screens.dart';
import 'package:paladins_app/themes/theme.dart';
import 'package:provider/provider.dart';
import 'screens/match_history_screen.dart';

void main() => runApp(AppState());


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => PaladinsProvider(), lazy: false),
      ],
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'tabs',
      routes: {
        'history' : ( _ ) => MatchHistoryScreen(),
        'profile' : ( _ ) => ProfileScreen(),
        'tabs'    : ( _ ) => TabsScreen(),
        'details' : ( _ ) => MatchDetailsScreen(),
      },
      theme: experimentalTheme()
    );
  }
}
