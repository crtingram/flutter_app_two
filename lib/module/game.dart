import 'package:flutter/material.dart';
import 'package:flutter_app_two/utils/MapUtilities.dart' as MapUtil;
import 'package:flutter_app_two/models/GameTile.dart';

class Game extends StatefulWidget {
  @override
  State createState() => GameState();
}

class GameState extends State<Game> {
  List<GameTile> gameTileData;

  GameState() {
    gameTileData = MapUtil.generateMap();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width,
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
            ),
            Flexible(
                child: GridView.extent(
              maxCrossAxisExtent: screenWidth / 9,
              children: gameTileData.map<Widget>((GameTile tile) {
                return GridTile(
                  child: Container(
                    color: Colors.green,
                    child: Text(''),
                  ),
                );
              }).toList(),
            ))
          ],
        ),
      ),
    );
  }
}
