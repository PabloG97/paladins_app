import 'package:flutter/material.dart';
import 'package:paladins_app/screens/current_match_screen.dart';
import 'package:paladins_app/screens/screens.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}


class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual= i,
      type: BottomNavigationBarType.fixed,
      items: [
        //BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined),title: 'add'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart),label: 'Analysis'),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt),label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.headset),label: 'Current match'),

      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      //physics: BouncingScrollPhysics(),
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [

        // Navigator.pushNamed(context, 'profile', arguments: 'Gêno'),

        ProfileScreen(),

        AnalysisScreen(),

        MatchHistoryScreen(),

        CurrentMatchScreen()
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier{
  int _paginaActual = 0;
  PageController _pageController = new PageController(initialPage: 0);

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor){
    this._paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;

}