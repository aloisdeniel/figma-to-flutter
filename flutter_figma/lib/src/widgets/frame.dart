import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/design/node.dart';
import 'package:flutter_figma/src/rendering/decoration.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';
import 'package:flutter_figma/src/rendering/shape.dart';
import 'package:collection/collection.dart';
import 'package:flutter_figma/widgets.dart';

import 'layouts/rotated.dart';

class FigmaFrame extends StatelessWidget {
  final figma.LayoutMode layoutMode;
  final figma.CounterAxisSizingMode? counterAxisSizingMode;
  final bool clipsContent;
  final double? opacity;
  final Size? designSize;
  final Decoration? decoration;
  final List<List<num>>? relativeTransform;
  final List<num> rectangleCornerRadii;
  final List<Widget> children;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? itemSpacing;

  const FigmaFrame({
    Key? key,
    this.clipsContent = false,
    required this.layoutMode,
    this.opacity,
    this.decoration,
    this.relativeTransform,
    this.rectangleCornerRadii = const <num>[0, 0, 0, 0],
    this.counterAxisSizingMode,
    this.designSize,
    this.children = const <Widget>[],
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.itemSpacing = 0,
  }) : super(key: key);

  factory FigmaFrame.api(figma.Frame node, {String? package}) {
    Decoration? decoration;
    final fills = node.fills.toFlutter();
    final strokes = node.strokes.toFlutter();
    final effects = node.effects.toFlutter();
    if (fills.isNotEmpty || strokes.isNotEmpty || effects.isNotEmpty) {
      decoration = FigmaPaintDecoration(
        strokeWeight: (node.strokeWeight ?? 1.0).toDouble(),
        fills: fills,
        strokes: strokes,
        effects: effects,
        shape: FigmaRectangleShape(
          rectangleCornerRadii:
              node.rectangleCornerRadii ?? const <num>[0, 0, 0, 0],
        ),
      );
    }

    final blurEffects = <figma.Effect>[];
    if (node.effects != null) {
      blurEffects.addAll(
        node.effects!.where((x) => x.type == figma.EffectType.backgroundBlur),
      );
    }
    return FigmaFrame(
      key: Key(node.id),
      opacity: node.opacity,
      decoration: decoration,
      relativeTransform: node.relativeTransform,
      rectangleCornerRadii: node.rectangleCornerRadii ??
          const <num>[
            0.0,
            0.0,
            0.0,
            0.0,
          ],
      layoutMode: node.layoutMode ?? figma.LayoutMode.vertical,
      clipsContent: node.clipsContent ?? false,
      designSize: node.designSize(),
      counterAxisSizingMode: node.counterAxisSizingMode,
      horizontalPadding: node.horizontalPadding?.toDouble(),
      verticalPadding: node.verticalPadding?.toDouble(),
      itemSpacing: node.itemSpacing?.toDouble(),
      children: FigmaNode.children(
        node.layoutMode ?? figma.LayoutMode.none,
        node.children?.whereNotNull().toList() ?? const <figma.Node>[],
        package,
      ),
    );
  }

  Widget _layout(BuildContext context) {
    if (layoutMode == figma.LayoutMode.vertical ||
        layoutMode == figma.LayoutMode.horizontal) {
      return FigmaAutoLayout(
        designSize: designSize!,
        children: children,
        counterAxisSizingMode:
            counterAxisSizingMode ?? figma.CounterAxisSizingMode.auto,
        horizontalPadding: horizontalPadding ?? 0.0,
        verticalPadding: verticalPadding ?? 0.0,
        itemSpacing: itemSpacing ?? 0.0,
        layoutMode: layoutMode,
      );
    }

    return FigmaConstrainedLayout(
      designSize: designSize!,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    var child = _layout(context);

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

    if (clipsContent == true) {
      child = ClipRRect(
        borderRadius: rectangleCornerRadii.toBorderRadius(),
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
