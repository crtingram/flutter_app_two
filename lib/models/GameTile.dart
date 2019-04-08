class GameTile {
  GameTileType type;
  List<GameTileContentType> contents;

  GameTile({this.type, this.contents}) : assert(contents.length < 4);

  GameTile.grassTile({List<GameTileContentType> contents})
      : this(type: GameTileType.grass, contents: contents);

  GameTile.grassTileEmpty()
      : this(type: GameTileType.grass, contents: [GameTileContentType.empty]);

  GameTile.waterTile()
      : this(type: GameTileType.water, contents: [GameTileContentType.water]);

  GameTile.rockTile()
      : this(type: GameTileType.rock, contents: [GameTileContentType.rock]);
}

enum GameTileType { grass, rock, water }

enum GameTileContentType { enemy, chest, empty, item, rock, water }
