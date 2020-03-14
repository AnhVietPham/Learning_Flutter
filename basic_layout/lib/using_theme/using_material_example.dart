import 'package:flutter/material.dart';

//class MyAppBar extends StatelessWidget{
//  MyAppBar({this.title});
//  final Widget title;
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 56.0,
//      padding: const EdgeInsets.symmetric(horizontal: 8.0),
//      decoration: BoxDecoration(color: Colors.blue[500]),
//      child: Row(
//        children: <Widget>[
//          IconButton(
//            icon: Icon(Icons.menu),
//            tooltip: 'Navigation Menu',
//            onPressed: null,
//          ),
//          Expanded(
//            child: title,
//          ),
//          IconButton(
//            icon: Icon(Icons.search),
//            tooltip: 'Search',
//            onPressed: null,
//          )
//        ],
//      ),
//    );
//  }
//}
//
//class MyScaffold extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return Material(
//      child: Column(
//        children: <Widget>[
//          MyAppBar(
//            title: Text(
//              'Hello Title',
//              style: Theme.of(context).primaryTextTheme.headline,
//            ),
//          ),
//          Expanded(
//            child: Center(
//              child: Text(
//                'Hello Flutter!'
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}

class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation Menu',
          onPressed: null,
        ),
        title: Text('Flutter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
      body: Center(
        child: Text('Hello Flutter'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}


