import 'package:flutter/rendering.dart';

abstract class FigmaShape {
  const FigmaShape();
}

class FigmaRectangleShape extends FigmaShape {
  final List<num> rectangleCornerRadii;

  const FigmaRectangleShape({
    this.rectangleCornerRadii = const <num>[0, 0, 0, 0],
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaRectangleShape &&
        other.rectangleCornerRadii.length == rectangleCornerRadii.length &&
        other.rectangleCornerRadii
            .asMap()
            .entries
            .every((e) => e.value == rectangleCornerRadii[e.key]);
  }

  @override
  int get hashCode {
    return rectangleCornerRadii.hashCode;
  }
}

class FigmaPathShape extends FigmaShape {
  final List<Path>? fillGeometry;

  const FigmaPathShape({
    required this.fillGeometry,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaPathShape && fillGeometry != other.fillGeometry;
  }

  @override
  int get hashCode {
    return fillGeometry?.hashCode ?? 0;
  }
}
