import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() => runApp(new Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
       data: (brightness) => ThemeData(
     
       fontFamily: 'Poppins',
          primaryColor: Color(0xff263238),
          brightness: brightness ==  Brightness.light
                ? Brightness.light
                : Brightness.dark,
          scaffoldBackgroundColor:brightness ==Brightness.dark ? Colors.blueGrey[900] : Colors.white,


  
      ),
  
      themedWidgetBuilder: (context,themedata) =>   MaterialApp(
        theme: themedata,
        //  theme: ThemeData(
        //   fontFamily: 'Poppins',
        //   primaryColor: Color(0xff263238),
        
        //   // scaffoldBackgroundColor: Color(0xffffd54f)
        //  // Color(0xfff48fb1) lightpink
        //   //Color(0xffbdbdbd) grey,
        // ),
        home: Homepage(),
      ),
    );
  }
}
