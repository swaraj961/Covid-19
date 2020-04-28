import 'dart:convert';
import 'package:covidindia/pannels/most_effected_pannel.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'const.dart';
import 'package:covidindia/pannels/worldwide_pannel.dart';
import 'package:http/http.dart' as http;
import 'package:covidindia/pannels/info_pannel.dart';
import 'package:covidindia/pages/countrystats.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:url_launcher/url_launcher.dart';

const String apiurl = 'https://corona.lmao.ninja/v2';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Map worldData;
  Future<dynamic> getWorldwideData() async {
    try {
      http.Response response = await http.get('$apiurl/all');
      setState(() {
        worldData = jsonDecode(response.body);
      });
    } catch (e) {
      print('cant fetch data');
    }
  }

  List countrydata;
  Future<dynamic> getmostAffectedcountries() async {
    try {
      http.Response response =
          await http.get('$apiurl/countries?yesterday=false&sort=deaths');
      setState(() {
        countrydata = jsonDecode(response.body);
      });
    } catch (e) {
      print('cant fetch data');
    }
  }

//comibe above two functions
  Future<dynamic> combineFuncationAlldata() async {
    getWorldwideData();
    getmostAffectedcountries();
  }

  @override
  void initState() {
    super.initState();
    // getWorldwideData();
    // getmostAffectedcountries();
    combineFuncationAlldata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.light
                  ? Icons.lightbulb_outline
                  : Icons.highlight,
              color: Colors.white,
            ),
            onPressed: () {
              DynamicTheme.of(context).setBrightness(
                  Theme.of(context).brightness == Brightness.light
                      ? Brightness.dark
                      : Brightness.light);
            },
          )
        ],
        title: Text(
          'Covid-19 Tracker 😷',
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
       
        onRefresh: combineFuncationAlldata,
        child:SingleChildScrollView(
          child: Column(
            children: <Widget>[
               Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
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
                            Colors.yellow.withOpacity(0.35), BlendMode.dstOut),
                        fit: BoxFit.fitHeight),
                  ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 120,
                  padding: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical:5,horizontal: 10),
                    child: Text(
                      DataSource.qoute,
                      style: TextStyle(
                        color: Color(0xff37474f),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(

                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Wordwide Covid-19 ',
                      
                      style: kTextdecoration,
                    ),
                    
                    
                  ],
                ),
              ),
              SizedBox(height:5),
              worldData == null
                  ? CircularProgressIndicator()
                  : WorldwidePannel(
                      data: worldData,
                    ),
              SizedBox(height: 10),
              Text(
                'Most Effected Countries ',
                style: kTextdecoration,
              ),
              SizedBox(height: 10),
              Material(
                      elevation: 10,
                      color: Colors.red.shade600,
                      //Color(0xff263238),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: MaterialButton(
                        
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CountryPage(),
                            ),
                          );
                        },
                        child: Text(
                          '🔎 Regional',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    SizedBox(height:15),
              countrydata == null
                  ? Container()
                  : MosteffectedPannel(
                      countrydata: countrydata,
                    ),
              Padding(
                padding: EdgeInsets.all(20),
                child: worldData==null ?Container(): PieChart(dataMap: {
                  'Confirmed': worldData['cases'].toDouble(),
                  'Active': worldData['active'].toDouble(),
                  'Recovered': worldData['recovered'].toDouble(),
                  'Death': worldData['deaths'].toDouble(),
                },
                colorList: [
                  Color(0xffff7675),
                  Color(0xff74b9ff),
                  Color(0xff55efc4),
                  Color(0xffb7b7b7),
                ]

                
                ),
              ),
              Container( 
               
               //last updated 
                height: 45,
                width: 140,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(14)
                ),
                child: Padding(padding: EdgeInsets.all(2),
                  child: Text('Last Updated ${ DateTime.now()},',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,),
                  ),
              
              ),
              SizedBox(height: 30),
              Infopannel(), //info pannel
              SizedBox(height: 20),
              Text(
                '💉\tTogether We Can Win\t🏥',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 60),
              GestureDetector(
                onTap: (){
                  try{
launch('https://www.linkedin.com/in/swaraj961');
                  } catch (e){
                    print(e);
                  }

                },
                              child: Text(
                  'Made with ❤ swaraj',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: Colors.grey
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
