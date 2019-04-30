import 'package:flutter_app_two/models/tile.dart';

class Map {

  final num width = 9;
  final num height = 9;

  List<Tile> tiles;

  Map() {
    tiles = new List<Tile>();
  }

}
