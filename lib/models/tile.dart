import 'package:flutter_app_two/models/coordinate.dart';
import 'package:flutter_app_two/models/tile-type.dart';
import 'package:flutter_app_two/models/tile-content.dart';

class Tile {
  Coordinate _coordinate;
  TileType _tileType;
  TileContents _tileContent;

  Tile(this._coordinate, this._tileType, [this._tileContent]);
}
