import 'package:flutter/material.dart';

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
    );
  }
}

class DungeonTileWidget extends StatefulWidget {
  @override
  State createState() => DungeonTileState();
}

class DungeonTileState extends State<DungeonTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
    );
  }
}

List<DungeonTileWidget> generateDungeon() {
  List<DungeonTileWidget> theTiles = new List<DungeonTileWidget>();
  int width = GridListWidget.mapWidth;
  for (int i = 0; i < width * width; i++) {
    theTiles.add(new DungeonTileWidget());
  }
  return theTiles;
}

class DungeonTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Icon(Icons.crop_free),
    );
  }
}
