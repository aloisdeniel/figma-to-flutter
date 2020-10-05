import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/rendering/decoration.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';
import 'package:flutter_figma/src/widgets/layouts/auto_layout.dart';
import 'package:flutter_figma/src/widgets/layouts/constrained_layout.dart';

import '../design.dart';
import 'layouts/rotated.dart';

class FigmaFrame extends StatelessWidget {
  final figma.LayoutMode layoutMode;
  final figma.CounterAxisSizingMode counterAxisSizingMode;
  final bool clipsContent;
  final double opacity;
  final Size designSize;
  final Decoration decoration;
  final List<List<num>> relativeTransform;
  final List<num> rectangleCornerRadii;
  final List<Widget> children;
  final double horizontalPadding;
  final double verticalPadding;
  final double itemSpacing;

  const FigmaFrame({
    Key key,
    @required this.clipsContent,
    @required this.layoutMode,
    @required this.opacity,
    @required this.decoration,
    @required this.relativeTransform,
    @required this.rectangleCornerRadii,
    this.counterAxisSizingMode,
    this.designSize,
    this.children = const <Widget>[],
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.itemSpacing = 0,
  }) : super(key: key);

  factory FigmaFrame.api(figma.Frame node) {
    final effects = node.effects.map((x) => FigmaEffect.api(x)).toList();
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
        fills: node.fills.map((x) => FigmaPaint.api(x)).toList(),
        strokes: node.strokes.map((x) => FigmaPaint.api(x)).toList(),
        effects: effects,
      );
    }

    final blurEffects = <figma.Effect>[];
    if (node.effects != null) {
      blurEffects.addAll(
        node.effects.where((x) => x.type == figma.EffectType.backgroundBlur),
      );
    }
    return FigmaFrame(
      key: node.id != null ? Key(node.id) : null,
      opacity: node.opacity ?? 1.0,
      decoration: decoration,
      relativeTransform: node.relativeTransform,
      rectangleCornerRadii: node.rectangleCornerRadii,
      layoutMode: node.layoutMode,
      clipsContent: node.clipsContent ?? false,
      designSize: node.designSize(),
      counterAxisSizingMode: node.counterAxisSizingMode,
      horizontalPadding: node.horizontalPadding ?? 0.0,
      verticalPadding: node.verticalPadding ?? 0.0,
      itemSpacing: node.itemSpacing ?? 0.0,
      children: FigmaNode.children(node.layoutMode, node.children),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = layoutMode != null && layoutMode != figma.LayoutMode.none
        ? FigmaAutoLayout(
            counterAxisSizingMode: counterAxisSizingMode,
            horizontalPadding: horizontalPadding,
            verticalPadding: verticalPadding,
            itemSpacing: itemSpacing,
            layoutMode: layoutMode,
            designSize: designSize,
            children: children,
          )
        : FigmaConstrainedLayout(
            children: children,
            designSize: designSize,
          );

    if (decoration != null) {
      child = DecoratedBox(
        decoration: decoration,
        child: child,
      );
    }

    if (opacity < 1) {
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
