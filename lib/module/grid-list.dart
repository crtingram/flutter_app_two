import 'package:flutter/material.dart';
import 'package:flutter_app_two/utils/MapUtilities.dart' as MapUtil;
import 'package:flutter_app_two/models/GameTile.dart';

class GridListWidget extends StatefulWidget {
  static final mapWidth = 9;

  @override
  State createState() => new GridListWidgetState();
}

class GridListWidgetState extends State<GridListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SafeArea(
                child: Card(
              color: Colors.green,
            )),
          )
        ],
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton(
          onPressed: () => _movePlayer(MapUtil.DIRECTIONS.WEST),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        RaisedButton(
          onPressed: () => _movePlayer(MapUtil.DIRECTIONS.NORTH),
          child: Icon(
            Icons.arrow_upward,
            color: Colors.black,
          ),
        ),
        RaisedButton(
          onPressed: () => _movePlayer(MapUtil.DIRECTIONS.SOUTH),
          child: Icon(
            Icons.arrow_downward,
            color: Colors.black,
          ),
        ),
        RaisedButton(
          onPressed: () => _movePlayer(MapUtil.DIRECTIONS.EAST),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

_movePlayer(MapUtil.DIRECTIONS dir) {
  print(dir);
}

List<Widget> generateDungeon() {
  List<Widget> theTiles = new List<Widget>();
  for (var value in MapUtil.generateMap()) {
    theTiles.add(getTileCard(value));
  }
  return theTiles;
}

Widget getTileCard(GameTile gt) {
  return Card(
    color: MapUtil.getColorFromType(gt.type),
    child: Icon(MapUtil.getIconFromType(gt.type)),
  );
}
