import 'package:flutter/material.dart';

class MapInfo extends StatelessWidget {
  @override


  Widget build(BuildContext context) {

   final size = MediaQuery.of(context).size;
   return Container(
      alignment: Alignment(0,0),
      width: size.width * .50,
      height: 375,
      color: Colors.blue,
      //margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.only(left: 15, top: 10),
            child: Text('Current match:', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),  overflow: TextOverflow.ellipsis, maxLines: 2)
          ),
          Container(
            //width: 800,
            child: Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: ( _ , int index){
                  return _NameChampAndRank();
                }
              ),
            ),
          ) 
        ],
      ),
    );
  }
}


class _NameChampAndRank extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 75,
      color: Colors.lightBlueAccent,
      margin: EdgeInsets.all(5),
    );
  }
}