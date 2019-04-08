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
      appBar: AppBar(
        title: const Text('Appo Bar'),
        actions: <Widget>[],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SafeArea(
                child: GridView.count(
                    crossAxisCount: GridListWidget.mapWidth,
                    children: generateDungeon())),
          )
        ],
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton(
          onPressed: _movePlayer(MapUtil.DIRECTIONS.NORTH),
          textColor: Colors.tealAccent,
          child: Icon(Icons.arrow_upward),
        ),
        RaisedButton(
          onPressed: _movePlayer(MapUtil.DIRECTIONS.SOUTH),
          textColor: Colors.tealAccent,
          child: Icon(Icons.arrow_downward),
        ),
        RaisedButton(
          onPressed: _movePlayer(MapUtil.DIRECTIONS.WEST),
          textColor: Colors.tealAccent,
          child: Icon(Icons.arrow_back),
        ),
        RaisedButton(
          onPressed: _movePlayer(MapUtil.DIRECTIONS.EAST),
          textColor: Colors.tealAccent,
          child: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}

_movePlayer(MapUtil.DIRECTIONS dir) {
  print(dir);
}

class DungeonTileWidget extends StatefulWidget {
  @override
  State createState() => DungeonTileState();
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

class DungeonTileState extends State<DungeonTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
    );
  }
}

class DungeonTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Icon(Icons.crop_free),
    );
  }
}
