import 'dart:async';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageURL;

  ProductPage(this.title, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button presses!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
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
                  color: Theme.of(context).accentColor,
                  child: Text('DELETE'),
                  onPressed: () => Navigator.pop(context, true),
                ))
          ],
        ),
      ),
    );
  }
}
