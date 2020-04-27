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
              count: data['cases'].toString(),
               backimage: DecorationImage(image: AssetImage('images/022-coronavirus.png'),
              colorFilter: ColorFilter.mode(Colors.red.withOpacity(0.40), BlendMode.dstATop) ,fit: BoxFit.fitWidth,
              ),
              ),
          Statuspannel(
              panneltittle: 'ACTIVE',
              pannelcolor: Colors.blue.shade100,
              textcolor: Colors.blue.shade900,
              count: data['active'].toString(),
              backimage: DecorationImage(image: AssetImage('images/recovered.png'),
              colorFilter: ColorFilter.mode(Colors.blue.withOpacity(0.20), BlendMode.dstATop) ,fit: BoxFit.fitWidth,
              ),),
          Statuspannel(
              panneltittle: 'RECOVERED',
              pannelcolor: Colors.green.shade100,
              textcolor: Colors.green,
              count: data['recovered'].toString(),
              backimage: DecorationImage(image: AssetImage('images/patient.png'),
              colorFilter: ColorFilter.mode(Colors.green.withOpacity(0.20), BlendMode.dstATop) ,fit: BoxFit.fitWidth,
              ),
              ),
              
          Statuspannel(
              panneltittle: 'DEATH',
              pannelcolor: Colors.grey.shade400,
              textcolor: Colors.grey.shade100,
              count: data['deaths'].toString(),
               backimage: DecorationImage(image: AssetImage('images/dead.png'),
              colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.20), BlendMode.dstATop) ,fit: BoxFit.fitWidth,
              ),
              ),
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
  final DecorationImage backimage;
  
 
  Statuspannel(
      {this.count, this.pannelcolor, this.panneltittle, this.textcolor,this.backimage});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //getting the device width

    return Container(
     decoration:  BoxDecoration(borderRadius: BorderRadius.circular(25),color: pannelcolor,
     image: backimage,),
      margin: EdgeInsets.all(10),
       //seperates the containder
      

      height: 100, width: width / 2,
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
