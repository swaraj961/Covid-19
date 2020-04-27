import 'package:flutter/material.dart';
class MosteffectedPannel extends StatelessWidget {
  final List countrydata;
  MosteffectedPannel({this.countrydata});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (context,index) => Container(
          margin: EdgeInsets.symmetric(vertical: 6),
        child: Row( 
          //cause we want to how rowise data of each country
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(countrydata[index]['countryInfo']['flag'],height: 30,),
            SizedBox(width:6),
            Text(countrydata[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
             SizedBox(width:6),
            Text('Deaths:'+countrydata[index]['deaths'].toString(),style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold),),//0.country0.deaths
          ],
        ),
      ),
      ),
    );
  }
}