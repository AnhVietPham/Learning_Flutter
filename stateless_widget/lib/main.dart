import 'package:flutter/material.dart';
import 'package:statelesswidget/my_card.dart';

void main() => runApp(
  MaterialApp(
    home: StatelessApp(),
    theme: ThemeData(primaryColor: Colors.green),
  )
);

class StatelessApp extends StatelessWidget{
  static final double myTextSize = 30.0;
  static final double myIconSize = 40.0;
  static final TextStyle myTextStyle =
  TextStyle(color: Colors.blue, fontSize: myTextSize);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 30.0),
        child: Center(
          child: SingleChildScrollView(child: createColumn(),),
        ),
      ),
    );
  }

  Widget createColumn(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        MyCard(
          title: Text('Anh Viet Pham',
            style: myTextStyle,
          ),
          icon: Icon(Icons.favorite, size: myIconSize, color: Colors.red,),
        ),
        MyCard(
          title: Text('Dennis Pham',
            style: myTextStyle,
          ),
          icon: Icon(Icons.add_alarm, size: myIconSize, color: Colors.green,),
        ),
        MyCard(
          title: Text('All Here',
            style: myTextStyle,
          ),
          icon: Icon(Icons.headset, size: myIconSize, color: Colors.red,),
        ),
        MyCard(
          title: Text('This is All Here',
            style: myTextStyle,
          ),
          icon: Icon(Icons.email, size: myIconSize, color: Colors.red,),
        )
      ],

    );
  }
}