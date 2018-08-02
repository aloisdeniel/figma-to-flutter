import 'dart:math';

class Position {
  final double left;
  final double top;
  final double right;
  final double bottom;
  final double width;
  final double height;

  double get topFromBottom => height + bottom;

  double get leftFromRight => width + right;

  Position(
      this.left, this.top, this.right, this.bottom, this.width, this.height);

  Position.inside(Rectangle<double> outer, Rectangle<double> inner)
      : this.left = inner.left,
        this.right = (outer.width - inner.right),
        this.top = inner.top,
        this.bottom = (outer.height - inner.bottom),
        this.width = inner.width,
        this.height = inner.height;
}
