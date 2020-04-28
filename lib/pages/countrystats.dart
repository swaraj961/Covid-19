import 'package:covidindia/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


const String apiurl = 'https://disease.sh/v2';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countrydata;
  Future<dynamic> getmostAffectedcountries() async {
    try {
      http.Response response =
          await http.get('$apiurl/countries?yesterday=false&sort=cases');
      setState(() {
        countrydata = jsonDecode(response.body);
      });
    } catch (e) {
      print('cant fetch data');
    }
  }
@override
  void initState() {
    getmostAffectedcountries();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
   

          IconButton(icon: Icon(Icons.search),color: Colors.white,
          disabledColor: Colors.white, onPressed: (){
            countrydata == null ? CircularProgressIndicator(semanticsLabel: 'Please wait',):
            showSearch(context: context, delegate:Search(countrylist: countrydata),);
          }),
   
        ],
        title: Text(
          '\tCountry Stats\t🌏'
          ,
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          
        ),
        centerTitle: true,
      ),
      body: countrydata==null ? Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount: countrydata == null? 0 :countrydata.length,
        itemBuilder: (context, index) => Container(
        
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      height: 140,
      decoration: Theme.of(context).brightness==Brightness.light ? BoxDecoration( 
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color:Colors.grey[300],blurRadius: 2,offset:Offset(0, 15),),],

      ):BoxDecoration( 
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color:Colors.grey[900],blurRadius: 2,offset:Offset(0, 15),),],

      ) ,
      child: Row(
        children: <Widget>[
          Container( //container1
            margin: EdgeInsets.symmetric(vertical:10,horizontal:25),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(countrydata[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height:10),
                Image.network((countrydata[index]['countryInfo']['flag']),height: 50,width: 60,)
              ],
            ),
          ),
          Expanded(child: Container( //container2
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('CONFIRMED :'+countrydata[index]['cases'].toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),),
               Text('ACTIVE :'+countrydata[index]['active'].toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15)),
                Text('RECOVERED :'+countrydata[index]['recovered'].toString(),style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 15)),
                 Text('CRITICAL :'+countrydata[index]['critical'].toString(),style: TextStyle(color: Colors.orangeAccent.shade700,fontWeight: FontWeight.bold,fontSize: 15)), //0.critical
                  Text('DEATH :'+countrydata[index]['deaths'].toString(),style: Theme.of(context).brightness==Brightness.light ?TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.bold,fontSize: 15):TextStyle(color: Colors.grey.shade100,fontWeight: FontWeight.bold,fontSize: 15)),
            ],
            ),
          ))
        ], 
      ),
        ),
      ),
    );
  }
}
