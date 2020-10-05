import 'package:figma/figma.dart';
import 'package:meta/meta.dart';

extension NodeExtensions on Node {
  List<Paint> extractFills() {
    final $this = this;
    if ($this is Vector) {
      return $this.fills;
    }
    if ($this is Frame) {
      return $this.fills;
    }
    if ($this is Group) {
      return $this.fills;
    }

    return const <Paint>[];
  }

  List<StrokeDefinition> extractStrokes() {
    final $this = this;
    if ($this is Rectangle) {
      return $this.strokes
          .map(
            (p) => StrokeDefinition(
              paint: p,
              strokeWeight: $this.strokeWeight,
              rectangleCornerRadii: $this.rectangleCornerRadii,
            ),
          )
          .toList();
    }
    if ($this is Vector) {
      return $this.strokes
          .map(
            (p) => StrokeDefinition(
              paint: p,
              strokeWeight: $this.strokeWeight,
            ),
          )
          .toList();
    }
    if ($this is Frame) {
      return $this.strokes
          .map(
            (p) => StrokeDefinition(
              paint: p,
              strokeWeight: $this.strokeWeight,
            ),
          )
          .toList();
    }
    if ($this is Group) {
      return $this.strokes
          .map(
            (p) => StrokeDefinition(
              paint: p,
              strokeWeight: $this.strokeWeight,
            ),
          )
          .toList();
    }

    return const <StrokeDefinition>[];
  }

  List<Effect> extractEffects() {
    final $this = this;
    if ($this is Vector) {
      return $this.effects;
    }
    if ($this is Frame) {
      return $this.effects;
    }
    if ($this is Group) {
      return $this.effects;
    }

    return const <Effect>[];
  }
}

class StrokeDefinition {
  final double strokeWeight;
  final Paint paint;
  final List<num> rectangleCornerRadii;
  const StrokeDefinition({
    @required this.strokeWeight,
    @required this.paint,
    this.rectangleCornerRadii = const <num>[],
  });
}
