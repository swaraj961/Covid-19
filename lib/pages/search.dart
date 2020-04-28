import 'package:flutter/material.dart';

class Search extends SearchDelegate{  
  final List countrylist ;
  Search({this.countrylist});
  @override
  List<Widget> buildActions(BuildContext context) {
   //action like app bar search  return list of widget after you search 
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () => query='',) //query is already present inside the delegate
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading item you want 
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=> Navigator.pop(context));  
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
@override
  ThemeData appBarTheme(BuildContext context) {
    
    return  ThemeData(
      primaryColor: Color(0xffe53935),// for search page theme of app bar
      //Color(0xff263238),
     
      brightness: Theme.of(context).brightness == Brightness.light ? Brightness.light:Brightness.dark
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    final List  suggestionlist = query.isEmpty ? countrylist : countrylist.where((element)=>element['country'].toString().toLowerCase().startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionlist.length,
      itemBuilder: (context,index)=> Container(
        
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
            margin: EdgeInsets.symmetric(vertical:10,horizontal:15),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: <Widget>[
                Text(suggestionlist[index]['country'],style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height:10),
                Image.network((suggestionlist[index]['countryInfo']['flag']),height: 50,width: 60,)
              ],
            ),
          ),
          Expanded(child: Container( 
           //container2
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              Text('CONFIRMED :'+suggestionlist[index]['cases'].toString(),style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15),),
               Text('ACTIVE :'+suggestionlist[index]['active'].toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 15)),
                Text('RECOVERED :'+suggestionlist[index]['recovered'].toString(),style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 15)),
                 Text('CRITICAL :'+suggestionlist[index]['critical'].toString(),style: TextStyle(color: Colors.orangeAccent.shade700,fontWeight: FontWeight.bold,fontSize: 15)), //0.critical
                  Text('DEATH :'+suggestionlist[index]['deaths'].toString(),style: Theme.of(context).brightness==Brightness.light ?TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.bold,fontSize: 15):TextStyle(color: Colors.grey.shade100,fontWeight: FontWeight.bold,fontSize: 15)),
            ],
            ),
          ))
        ], 
      ),
        ),
    );
  }
  
}