import 'package:flutter/material.dart';

class GridListWidget extends StatefulWidget {
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
                    crossAxisCount: 16,
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    padding: EdgeInsets.all(4.0),
                    children: generateDungeon())),
          )
        ],
      ),
    );
  }
}

List<DungeonTile> generateDungeon() {
  List<DungeonTile> theTiles = new List<DungeonTile>();
  const int width = 16;
  for (int i = 0; i < width * width; i++) {
    theTiles.add(new DungeonTile());
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
