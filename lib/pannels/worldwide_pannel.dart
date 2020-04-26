import 'package:flutter/material.dart';

class WorldwidePannel extends StatelessWidget {
  final Map data;
  WorldwidePannel({this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true, //to avoid grid view to expand all the size
        physics: NeverScrollableScrollPhysics(), //to not let it scroll
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:
                2 //height is double the width a good rectangel here) ,
            ),
        children: <Widget>[
          Statuspannel(
              panneltittle: 'CONFIRMED',
              pannelcolor: Colors.red.shade100,
              textcolor: Colors.red,
              count: data['cases'].toString()),
          Statuspannel(
              panneltittle: 'ACTIVE',
              pannelcolor: Colors.blue.shade100,
              textcolor: Colors.blue.shade900,
              count: data['active'].toString()),
          Statuspannel(
              panneltittle: 'RECOVERED',
              pannelcolor: Colors.green.shade100,
              textcolor: Colors.green,
              count: data['recovered'].toString()),
          Statuspannel(
              panneltittle: 'DEATH',
              pannelcolor: Colors.grey.shade400,
              textcolor: Colors.grey.shade100,
              count: data['deaths'].toString()),
        ],
      ),
    );
  }
}

class Statuspannel extends StatelessWidget {
  final Color pannelcolor;
  final String panneltittle;
  final Color textcolor;
  final String count;
  Statuspannel(
      {this.count, this.pannelcolor, this.panneltittle, this.textcolor});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //getting the device width

    return Container(
      margin: EdgeInsets.all(10), //seperates the containder
      color: pannelcolor,

      height: 80, width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            panneltittle,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'Poppins',
                color: textcolor),
          ),
          Text(
            count,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'Poppins',
                color: textcolor),
          )
        ],
      ),
    );
  }
}
