import 'package:flutter/material.dart';

class MyCard extends StatelessWidget{
  final Widget icon;
  final Widget title;

  MyCard({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              this.title,
              this.icon
            ],
          ),
        ),
      ),
    );
  }
}