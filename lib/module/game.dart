import 'package:flutter/material.dart';
import 'package:flutter_app_two/utils/MapUtilities.dart' as MapUtil;
import 'package:flutter_app_two/models/GameTile.dart';

class Game extends StatefulWidget {
  @override
  State createState() => GameState();
}

class GameState extends State<Game> with SingleTickerProviderStateMixin {
  List<GameTile> gameTileData;

  GameState() {
    gameTileData = MapUtil.generateMap();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

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
                    ' HP ',
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
              flex: 2,
              child: GridView.extent(
                maxCrossAxisExtent: screenWidth / 9,
                children: gameTileData.map<Widget>((GameTile tile) {
                  return GridTile(
                    child: Container(
                      color: Colors.green,
                      child: Text('ASDF'),
                    ),
                  );
                }).toList(),
              ),
            ),
            Flexible(
              child: ListView(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: ListTile(
                      title: Text('title'),
                      subtitle: Text('Subtitle'),
                      contentPadding: EdgeInsets.all(0.0),
                      dense: true,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: () => print('test'),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                RaisedButton(
//                onPressed: () => _movePlayer(MapUtil.DIRECTIONS.NORTH),
                  child: Icon(
                    Icons.arrow_upward,
                    color: Colors.black,
                  ),
                ),
                RaisedButton(
//                onPressed: () => _movePlayer(MapUtil.DIRECTIONS.SOUTH),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.black,
                  ),
                ),
                RaisedButton(
//                onPressed: () => _movePlayer(MapUtil.DIRECTIONS.EAST),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: RaisedButton(
//                onPressed: _contextButton,
                    child: Icon(
                      Icons.face,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
