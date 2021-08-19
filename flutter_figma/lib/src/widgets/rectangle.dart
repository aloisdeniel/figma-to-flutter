import 'package:figma/figma.dart' as figma;
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/rendering/decoration.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';
import 'package:flutter_figma/src/rendering/effect.dart';
import 'package:flutter_figma/src/rendering/shape.dart';
import 'package:flutter_figma/src/widgets/blurred.dart';
import 'package:flutter_figma/src/widgets/layouts/rotated.dart';

class FigmaRectangle extends StatelessWidget {
  final double? opacity;
  final Decoration? decoration;
  final List<FigmaBackgroundBlurEffect> blurEffects;
  final List<List<num>>? relativeTransform;
  final List<num>? rectangleCornerRadii;

  const FigmaRectangle({
    Key? key,
    this.opacity,
    this.decoration,
    this.blurEffects = const <FigmaBackgroundBlurEffect>[],
    this.relativeTransform,
    this.rectangleCornerRadii,
  }) : super(
          key: key,
        );

  factory FigmaRectangle.api(figma.Rectangle node, {String? package}) {
    final fills = node.fills.toFlutter();
    final strokes = node.strokes.toFlutter();
    final effects = node.effects.toFlutter();
    Decoration? decoration;
    if (fills.isNotEmpty || strokes.isNotEmpty || effects.isNotEmpty) {
      decoration = FigmaPaintDecoration(
        strokeWeight: node.strokeWeight ?? 0,
        shape: FigmaRectangleShape(
          rectangleCornerRadii:
              node.rectangleCornerRadii ?? const <num>[0, 0, 0, 0],
        ),
        fills: fills,
        strokes: strokes,
        effects: effects,
      );
    }

    return FigmaRectangle(
      key: Key(node.id),
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

    final decoration = this.decoration;
    final opacity = this.opacity;
    final relativeTransform = this.relativeTransform;

    if (decoration != null) {
      child = DecoratedBox(
        decoration: decoration,
      );
    }

    if (blurEffects.isNotEmpty) {
      child = FigmaBlurred(
        cornerRadii: rectangleCornerRadii ?? const <num>[0, 0, 0, 0],
        effects: blurEffects,
        child: child,
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
