import 'package:figma/figma.dart' as figma;
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/rendering/decoration.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';

import 'layouts/rotated.dart';

class FigmaVector extends StatelessWidget {
  final double opacity;
  final Decoration decoration;
  final List<List<num>> relativeTransform;
  const FigmaVector({
    Key key,
    @required this.opacity,
    @required this.decoration,
    @required this.relativeTransform,
  }) : super(
          key: key,
        );

  factory FigmaVector.api(figma.Vector node, {String package}) {
    Decoration decoration;
    if ((node.fillGeometry != null || node.strokeGeometry != null) &&
        (node.fills.isNotEmpty ||
            node.strokes.isNotEmpty ||
            node.effects.isNotEmpty)) {
      decoration = FigmaPaintDecoration(
        strokeWeight: node.strokeWeight,
        fills: node.fills
            .where((x) => x.visible ?? true)
            .map((x) => FigmaPaint.api(x))
            .toList(),
        strokes: node.strokes
            .where((x) => x.visible ?? true)
            .map((x) => FigmaPaint.api(x))
            .toList(),
        effects: node.effects
            .where((x) => x.visible ?? true)
            .map((x) => FigmaEffect.api(x))
            .toList(),
        shape: FigmaPathShape(
          fillGeometry: (node.fillGeometry ?? node.strokeGeometry)
              .map(
                (x) => parseSvgPathData(x['path']),
              )
              .toList(),
        ),
      );
    }

    return FigmaVector(
      key: node.id != null ? Key(node.id) : null,
      decoration: decoration,
      opacity: node.opacity ?? 1.0,
      relativeTransform: node.relativeTransform,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = SizedBox();

    if (decoration != null) {
      child = DecoratedBox(
        decoration: decoration,
      );
    }

    if (opacity < 1) {
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
