import '../utils/MapUtilities.dart' as MapUtil;

class Point {
  int x, y;

  Point(this.x, this.y);
}

class Entity {
  Point point;

  // assert that point exists and is inside of the map;
  Entity(this.point)
      : assert(point != null &&
            point.x >= 0 &&
            point.y >= 0 &&
            point.x < MapUtil.mapWidth - 1 &&
            point.y < MapUtil.mapHeight - 1);
}

class Item extends Entity {
  String description;

  ItemType type;

  Item({Point point, this.description, this.type}) : super(point);
}

class Player extends Entity {
  int hp = 10;
  int maxHP = 10;
  int attackPwr = 5;

  MapUtil.Context playerContext = MapUtil.searchContext;

  List<Item> items;

  Player(Point point) : super(point);

  void incrementHp(int hp) {
    this.hp += hp;
    if (this.hp > maxHP) {
      this.hp = maxHP;
    }
  }

  void decrementHp(int hp) {
    this.hp -= hp;
  }
}

class Enemy extends Entity {
  int hp;

  Enemy(Point point, {this.hp = 1}) : super(point);

  void decrementHp(int hp) {
    this.hp -= hp;
  }
}

enum ItemType { potion }
