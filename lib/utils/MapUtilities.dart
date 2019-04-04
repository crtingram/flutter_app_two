import 'package:flutter/material.dart';
import '../models/GameTile.dart';

/// How do I make top level functions.

getColorFromType<Color>(GameTileType type) {
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

List<GameTile> generateMap() {
  return <GameTile>[
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.waterTile(),
    GameTile.rockTile(),
  ];
}
