import 'package:flutter/material.dart';
import 'const.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Covid-19 Tracker',
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
                  colors: [
                    Color(0xfffdd835),
                    Color(
                      0xfff57f17,
                    ),
                  ],
                ),
//  color: Colors.yellowAccent.shade200,
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
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
