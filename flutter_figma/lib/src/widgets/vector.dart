import 'package:figma/figma.dart' as figma;
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/rendering/decoration.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';
import 'package:flutter_figma/src/rendering/shape.dart';

import 'layouts/rotated.dart';

class FigmaVector extends StatelessWidget {
  const FigmaVector({
    Key? key,
    this.opacity,
    this.decoration,
    this.relativeTransform,
  }) : super(
          key: key,
        );

  final double? opacity;
  final Decoration? decoration;
  final List<List<num>>? relativeTransform;

  factory FigmaVector.api(figma.Vector node, {String? package}) {
    Decoration? decoration;
    final fillGeometry = (node.fillGeometry ?? node.strokeGeometry).toPaths();
    final fills = node.fills.toFlutter();
    final strokes = node.strokes.toFlutter();
    final effects = node.effects.toFlutter();
    if (fillGeometry.isNotEmpty &&
        (fills.isNotEmpty || strokes.isNotEmpty || effects.isNotEmpty)) {
      decoration = FigmaPaintDecoration(
        strokeWeight: node.strokeWeight ?? 1,
        fills: fills,
        strokes: strokes,
        effects: effects,
        shape: FigmaPathShape(
          fillGeometry: fillGeometry,
        ),
      );
    }

    return FigmaVector(
      key: Key(node.id),
      decoration: decoration,
      opacity: node.opacity ?? 1.0,
      relativeTransform: node.relativeTransform,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = SizedBox();

    final decoration = this.decoration;
    final opacity = this.opacity;
    final relativeTransform = this.relativeTransform;

    if (decoration != null) {
      child = DecoratedBox(
        decoration: decoration,
      );
    }
    if (opacity != null && opacity < 1) {
      child = Opacity(
        opacity: opacity,
        child: child,
      );
    }

    if (relativeTransform != null && relativeTransform.isRotated) {
      child = FigmaRotated(
        transform: relativeTransform,
        child: child,
      );
    }

    return child;
  }
}
