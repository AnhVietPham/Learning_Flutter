import 'package:flutter/material.dart';
import './product_manager.dart';
import 'assignment_1/assignment.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("EasyList"),
          ),
          body: ProductManager()),
    );
  }
}
