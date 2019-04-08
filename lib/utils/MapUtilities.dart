import 'package:flutter/material.dart';
import '../models/GameTile.dart';

/// How do I make top level functions.

Color getColorFromType(GameTileType type) {
  switch (type) {
    case GameTileType.grass:
      return Colors.green;
    case GameTileType.rock:
      return Colors.grey;
    case GameTileType.water:
      return Colors.blueAccent;

    default:
      return Colors.white;
  }
}

IconData getIconFromType(GameTileType type) {
  switch (type) {
    case GameTileType.rock:
      return Icons.change_history;
    case GameTileType.water:
      return Icons.invert_colors;

    default:
      return null;
  }
}

enum DIRECTIONS { NORTH, SOUTH, WEST, EAST }

List<GameTile> generateMap() {
  return <GameTile>[
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.waterTile(),
    GameTile.waterTile(),
    GameTile.rockTile(),
    GameTile.rockTile(),
    GameTile.rockTile(),
    GameTile.rockTile(),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.waterTile(),
    GameTile.waterTile(),
    GameTile.rockTile(),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.waterTile(),
    GameTile.waterTile(),
    GameTile.waterTile(),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.rockTile(),
    GameTile.rockTile(),
    GameTile.waterTile(),
    GameTile.rockTile(),
    GameTile.rockTile(),
    GameTile.rockTile(),
    GameTile.waterTile(),
    GameTile.waterTile(),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.waterTile(),
    GameTile.waterTile(),
    GameTile.waterTile(),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.rockTile(),
    GameTile.rockTile(),
    GameTile.waterTile(),
    GameTile.rockTile(),
    GameTile.rockTile(),
    GameTile.rockTile(),
    GameTile.waterTile(),
    GameTile.waterTile(),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
  ];
}
