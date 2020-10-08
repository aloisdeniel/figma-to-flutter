import 'package:figma/figma.dart' as figma;
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/rendering/decoration.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';
import 'package:flutter_figma/src/widgets/blurred.dart';
import 'package:flutter_figma/src/widgets/layouts/rotated.dart';

class FigmaRectangle extends StatelessWidget {
  final double opacity;
  final Decoration decoration;
  final List<FigmaBackgroundBlurEffect> blurEffects;
  final List<List<num>> relativeTransform;
  final List<num> rectangleCornerRadii;

  const FigmaRectangle({
    Key key,
    @required this.opacity,
    @required this.decoration,
    @required this.blurEffects,
    @required this.relativeTransform,
    @required this.rectangleCornerRadii,
  }) : super(
          key: key,
        );

  factory FigmaRectangle.api(figma.Rectangle node, {String package}) {
    final effects = node.effects
        .where((x) => x.visible ?? true)
        .map((x) => FigmaEffect.api(x))
        .toList();
    Decoration decoration;
    if (node.fills.isNotEmpty ||
        node.strokes.isNotEmpty ||
        node.effects.isNotEmpty) {
      decoration = FigmaPaintDecoration(
        strokeWeight: node.strokeWeight,
        shape: FigmaRectangleShape(
          rectangleCornerRadii:
              node.rectangleCornerRadii ?? const <num>[0, 0, 0, 0],
        ),
        fills: node.fills
            .where((x) => x.visible ?? true)
            .map((x) => FigmaPaint.api(x))
            .toList(),
        strokes: node.strokes
            .where((x) => x.visible ?? true)
            .map((x) => FigmaPaint.api(x))
            .toList(),
        effects: effects,
      );
    }

    return FigmaRectangle(
      key: node.id != null ? Key(node.id) : null,
      opacity: node.opacity ?? 1.0,
      blurEffects: effects.whereType<FigmaBackgroundBlurEffect>().toList(),
      decoration: decoration,
      relativeTransform: node.relativeTransform,
      rectangleCornerRadii: node.rectangleCornerRadii,
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

    if (blurEffects.isNotEmpty) {
      child = FigmaBlurred(
        cornerRadii: rectangleCornerRadii,
        effects: blurEffects,
        child: child,
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
