import 'package:flutter/material.dart';
import 'package:flutter_app_two/utils/MapUtilities.dart' as MapUtil;
import 'package:flutter_app_two/models/GameTile.dart';
import 'package:flutter_app_two/models/Actors.dart';

class GridListWidget extends StatefulWidget {
  static final mapWidth = 9;
  static final mapHeight = 9;

  @override
  State createState() => new GridListWidgetState();
}

class GridListWidgetState extends State<GridListWidget> {
  List<GameTile> gameTileData;
  Player player;

  GridListWidgetState() {
    gameTileData = MapUtil.generateMap();
    player = Player(Point(0, 0));
    updatePlayerIcon(convertTwoDimToOne(player.point));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = _updateScreenWidth();

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 20,
                width: screenWidth,
                child: Text(
                  'HP ' + player.hp.toString(),
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
          Expanded(
            child: GridView.count(
              crossAxisCount: GridListWidget.mapWidth,
              children: gameTileData.map<Widget>((GameTile tile) {
                return MapTile(tile);
              }).toList(),
            ),
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
    ));
  }

  _movePlayer(MapUtil.DIRECTIONS dir) {
    setState(() {
      Point oldPoint = player.point;
      int oldTileIndex = convertTwoDimToOne(oldPoint);

      Point newPoint = createNewPoint(oldPoint, dir);

      if (checkIfValidPoints(newPoint)) {
        print("Illegal Move");
        return;
      }

      int newTileIndex = convertTwoDimToOne(newPoint);
      GameTile newTile = getTile(newTileIndex);

      if (!canMoveOverTile(newTile)) {
        print("Cannot move over tile.");
        return;
      }

      player.point = newPoint;

      removePlayerIcon(oldTileIndex);
      updatePlayerIcon(newTileIndex);
    });
  }

  double _updateScreenWidth() {
    double newWidth;

    if (player.hp > 0) {
      newWidth = MediaQuery.of(context).size.width * (player.hp / player.maxHP);
    } else {
      newWidth = 40.0;
    }
    return newWidth;
  }

  GameTile getTile(int index) {
    return gameTileData[index];
  }

  void removePlayerIcon(int index) {
    gameTileData[index].contents.remove(GameTileContentType.player);
  }

  void updatePlayerIcon(int index) {
    gameTileData[index].contents.add(GameTileContentType.player);
  }

  bool canMoveOverTile(GameTile tile) {
    bool canMove = true;

    tile.contents.forEach((tileType) {
      if (tileType == GameTileContentType.rock ||
          tileType == GameTileContentType.water) {
        canMove = false;
      }
    });

    return canMove;
  }

  bool checkIfValidPoints(Point point) {
    return point.x < 0 ||
        point.y < 0 ||
        point.x > (GridListWidget.mapWidth - 1) ||
        point.y > (GridListWidget.mapHeight - 1);
  }
}

int convertTwoDimToOne(Point point) {
  // i = x + width*y;
  return point.x + GridListWidget.mapWidth * point.y;
}

Point convertOneDimTwo(int i) {
  // x = i % width;
  // y = i / width;
  int x = i % GridListWidget.mapWidth;
  int y = (i / GridListWidget.mapWidth).floor();

  return Point(x, y);
}

createNewPoint(Point oldPoint, MapUtil.DIRECTIONS direction) {
  Point newPoint = Point(oldPoint.x, oldPoint.y);

  switch (direction) {
    case MapUtil.DIRECTIONS.WEST:
      newPoint.x -= 1;
      break;
    case MapUtil.DIRECTIONS.NORTH:
      newPoint.y -= 1;
      break;
    case MapUtil.DIRECTIONS.SOUTH:
      newPoint.y += 1;
      break;
    case MapUtil.DIRECTIONS.EAST:
      newPoint.x += 1;
      break;
  }

  return newPoint;
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
