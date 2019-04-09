import 'package:flutter/material.dart';
import 'package:flutter_app_two/utils/MapUtilities.dart' as MapUtil;
import 'package:flutter_app_two/models/GameTile.dart';

class GridListWidget extends StatefulWidget {
  static final mapWidth = 9;

  @override
  State createState() => new GridListWidgetState();
}

class GridListWidgetState extends State<GridListWidget> {
  List<GameTile> gameTileData = MapUtil.generateMap();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SafeArea(
                child: GridView.count(
              crossAxisCount: GridListWidget.mapWidth,
              children: gameTileData.map<Widget>((GameTile tile) {
                return MapTile(tile);
              }).toList(),
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

  _movePlayer(MapUtil.DIRECTIONS dir) {}
}

List<MapTile> getMapTiles() {
  List<MapTile> theMapTiles = new List<MapTile>();
  MapUtil.generateMap().forEach((tileData) {
    theMapTiles.add(new MapTile(tileData));
  });
  return theMapTiles;
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
    color: MapUtil.getMaterialColorFromType(gt.type),
    child: Icon(MapUtil.getIconFromType(gt.type)),
  );
}

class MapTile extends StatefulWidget {
  final GameTile gameTile;

  MapTile(this.gameTile);

  @override
  State createState() => new MapTileState();
}

class MapTileState extends State<MapTile> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 5.0,
                color: MapUtil.getColorFromType(widget.gameTile.type))),
        child: Icon(MapUtil.getIconFromType(widget.gameTile.type)),
      ),
    );

//    return Card(
//      color: MapUtil.getColorFromType(widget.gameTile.type),
//      child: Icon(MapUtil.getIconFromType(widget.gameTile.type)),
//    );
  }
}
