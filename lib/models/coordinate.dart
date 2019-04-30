class Coordinate {
  final int x, y;

  const Coordinate(this.x, this.y);

  @override
  bool operator ==(dynamic c) => x == c.x && y == c.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}
