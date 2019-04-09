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

  _movePlayer(MapUtil.DIRECTIONS dir) {
    setState(() {
      gameTileData[0].contents.add(GameTileContentType.player);
    });
  }
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
    color: MapUtil.getColorFromType(gt.type),
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
    return Card(
        color: MapUtil.getColorFromType(widget.gameTile.type),
        child: GridView.count(
          crossAxisCount: 2,
          children: createIconFromContents(widget.gameTile),
        ));
  }

  List<Widget> createIconFromContents(GameTile gameTile) {
    List<Widget> icons = new List<Widget>();

    num iconSize = (38 / gameTile.contents.length);

    if (gameTile.type == GameTileType.rock) {
      icons.add(Icon(Icons.change_history, size: iconSize));
      return icons;
    }

    if (gameTile.type == GameTileType.water) {
      icons.add(Icon(Icons.invert_colors, size: iconSize));
      return icons;
    }

    gameTile.contents.forEach((contentType) {
      switch (contentType) {
        case GameTileContentType.chest:
          icons.add(
              Icon(Icons.business_center, size: iconSize, color: Colors.brown));
          break;
        case GameTileContentType.item:
          icons.add(Icon(Icons.edit, size: iconSize, color: Colors.amber));
          break;
        case GameTileContentType.player:
          icons.add(Icon(Icons.face, size: iconSize, color: Colors.black87));
          break;
        case GameTileContentType.enemy:
          icons.add(Icon(
            Icons.merge_type,
            size: iconSize,
            color: Colors.red,
          ));
          break;

        default:
          throw Exception("Content Type does not exist");
      }
    });

    return icons;
  }
}
