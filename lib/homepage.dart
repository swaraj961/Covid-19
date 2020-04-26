import 'dart:convert';

import 'package:flutter/material.dart';
import 'const.dart';
import 'package:covidindia/pannels/worldwide_pannel.dart';
import 'package:http/http.dart' as http;
const String apiurl = 'https://corona.lmao.ninja/v2/all';
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
Map worldData;
Future<dynamic> getWorldwideData() async{
try{
 http.Response response =  await http.get('$apiurl');
  setState(() {
     worldData = jsonDecode(response.body);
  });
} catch (e)
{
  print('cant fetch data');
}
 
 
}
@override
  void initState() {
    
    super.initState();
    getWorldwideData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Covid-19 Tracker',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xfffdd835),
                    Color(
                      0xfff57f17,
                    ),
                  ],
                ),

                image: DecorationImage(
                    image: AssetImage('images/022-coronavirus.png'),
                    colorFilter: ColorFilter.mode(
                        Colors.yellow.withOpacity(0.50), BlendMode.dstOut),
                    fit: BoxFit.fitHeight),
              ),
              width: double.infinity,
              alignment: Alignment.center,
              height: 120,
              padding: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  DataSource.qoute,
                  style: TextStyle(
                      color: Color(0xff37474f),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      ),
                      
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text(
              'Wordwide ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
          worldData == null ?CircularProgressIndicator(): WorldwidePannel(data: worldData,),
          ],
        ),
      ),
    );
  }
}
