import 'package:flutter/material.dart';
class Infopannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical:5,horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            height: 40,
            color: Color(0xff263238),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
                Text('FAQ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
             Icon(Icons.arrow_forward,color: Colors.white ,size: 25,),
             ],
           ),
          ),
          //2

           Container(
            padding: EdgeInsets.symmetric(vertical:5,horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            height: 40,
            color: Color(0xff263238),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
                Text('DONATE',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
             Icon(Icons.arrow_forward,color: Colors.white ,size: 25,),
             ],
           ),
          ),
          //3
           Container(
            padding: EdgeInsets.symmetric(vertical:5,horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
            height: 40,
            color: Color(0xff263238),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
                Text('MYTH BUSTERS',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
             Icon(Icons.arrow_forward,color: Colors.white ,size: 25,),
             ],
           ),
          ),
        ],
      ),
    );
  }
}