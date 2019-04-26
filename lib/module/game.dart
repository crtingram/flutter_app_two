import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  State createState() => GameState();
}

class GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 20,
                  child: Text(
                    'HP ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [Colors.red, Colors.red],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(0.5, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
