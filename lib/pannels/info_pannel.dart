import 'package:covidindia/pages/faq.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
const String donateURL ='https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate';
const String mythsURL ='https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters';
class Infopannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> FaqPage(),),);
            },
                      child: Container(
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
          ),
          //2

           GestureDetector(
             onTap: (){
               launch(donateURL);
             },
                        child: Container(
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
           ),
          //3
           GestureDetector(
             onTap: (){
               launch(mythsURL);
             },
                        child: Container(
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
           ),
        ],
      ),
    );
  }
}