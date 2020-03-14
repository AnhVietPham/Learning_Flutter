import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(BullsEyeApp());

class BullsEyeApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StartUp Name Generator',
      home: RandomWords(),
    );
  }
}

class BullsEyeState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _biggestFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i){
          if (i.isOdd){
            return Divider();
          }

          final index = i ~/ 2;
          if (index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(19));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggestFont,
      ),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  BullsEyeState createState() => BullsEyeState();
}



