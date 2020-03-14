import 'package:flutter/material.dart';

import './text_output.dart';
class TextControl extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TextControl();
  }
}

class _TextControl extends State<TextControl>{
  String mainText = 'This is First Assignment!';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          onPressed: () {
            setState(() {
              mainText = 'This changed';
            });
          },
          child: Text('Change Text'),
        ),
        TextOutput(mainText)
      ],
    );
  }
}