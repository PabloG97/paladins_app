import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Paladins-app'),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            )
          ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Paladins mobile app')
          ],
        ),
      ),
    );
  }
}