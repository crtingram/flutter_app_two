import 'package:flutter/material.dart';
import './module/grid-list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dungeon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GridListWidget(),
    );
  }
}
