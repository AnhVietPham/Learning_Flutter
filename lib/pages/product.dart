import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {

  final String title;
  final String imageURL;

  ProductPage(this.title, this.imageURL)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(imageURL),
          Container(padding: EdgeInsets.all(10.0), child: Text('Details!')),
          Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme
                    .of(context)
                    .accentColor,
                child: Text(title),
                onPressed: () => Navigator.pop(context),
              ))
        ],
      ),
    );
  }
}
