import 'package:flutter/material.dart';
import 'package:flutter_app_two/old/GameTile.dart';

final int mapWidth = 9;
final int mapHeight = 9;

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

enum CONTEXT { search, key, attack }

class Context {
  String description;
  CONTEXT contextType;
  int priority;

  IconData getIconData() {
    return getContextIcon(this.contextType);
  }

  Context({this.description, this.contextType, this.priority});
}

Context searchContext = Context(
    description: 'Search Area', contextType: CONTEXT.search, priority: 30);
Context keyContext =
    Context(description: 'Open Chest', contextType: CONTEXT.key, priority: 50);
Context attackContext =
    Context(description: 'Attack', contextType: CONTEXT.attack, priority: 100);

IconData getContextIcon(CONTEXT context) {
  switch (context) {
    case CONTEXT.search:
      return Icons.search;
      break;
    case CONTEXT.key:
      return Icons.vpn_key;
      break;
    case CONTEXT.attack:
      return Icons.colorize;
      break;

    default:
      return Icons.search;
  }
}

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
    GameTile.grassTile(
        contents: [GameTileContentType.chest, GameTileContentType.enemy]),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: [GameTileContentType.enemy]),
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
    GameTile.grassTile(contents: [GameTileContentType.chest]),
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
    GameTile.grassTile(contents: [GameTileContentType.enemy]),
    GameTile.grassTile(contents: []),
    GameTile.rockTile(),
    GameTile.rockTile(),
    GameTile.rockTile(),
    GameTile.waterTile(),
    GameTile.waterTile(),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: []),
    GameTile.grassTile(contents: [GameTileContentType.enemy]),
    GameTile.grassTile(contents: []),
  ];
}
