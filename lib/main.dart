import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(new Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff263238),
        // scaffoldBackgroundColor: Color(0xffffd54f)
       // Color(0xfff48fb1) lightpink
        //Color(0xffbdbdbd) grey,
      ),
      home: Homepage(),
    );
  }
}
