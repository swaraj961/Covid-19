import 'package:flutter/material.dart';
import 'package:covidindia/const.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ❓🙋‍♂️'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ExpansionTile(
          //for faq view
          title: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                DataSource.questionAnswers[index]['question'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )),
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(DataSource.questionAnswers[index]['answer'])),
          ],
        ),
        itemCount: DataSource.questionAnswers.length,
      ),
    );
  }
}
