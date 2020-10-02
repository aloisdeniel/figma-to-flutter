import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/rendering/decoration.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';
import 'package:flutter_figma/src/widgets/layouts/auto_layout.dart';
import 'package:flutter_figma/src/widgets/layouts/constrained_layout.dart';

import 'layouts/rotated.dart';

class FigmaFrame extends StatelessWidget {
  final figma.Frame node;
  final List<Widget> children;

  FigmaFrame({
    Key key,
    @required this.node,
    this.children = const <Widget>[],
  }) : super(
          key: key ?? (node.id != null ? Key(node.id) : null),
        );

  @override
  Widget build(BuildContext context) {
    Widget child =
        node.layoutMode != null && node.layoutMode != figma.LayoutMode.none
            ? FigmaAutoLayout(
                counterAxisSizingMode: node.counterAxisSizingMode,
                horizontalPadding: node.horizontalPadding,
                verticalPadding: node.verticalPadding,
                itemSpacing: node.itemSpacing,
                layoutMode: node.layoutMode,
                children: children,
              )
            : FigmaConstrainedLayout(
                children: children,
                designSize: node.designSize(),
              );

    if (node.fills.isNotEmpty ||
        node.strokes.isNotEmpty ||
        node.effects.isNotEmpty) {
      child = DecoratedBox(
        decoration: FigmaPaintDecoration(
          fills: node.fills,
          strokes: node.strokes,
          effects: node.effects,
        ),
        child: child,
      );
    }

    if (node.opacity != null && node.opacity < 1) {
      child = Opacity(
        opacity: node.opacity,
        child: child,
      );
    }

    if (node.clipsContent == true) {
      child = ClipRRect(
        borderRadius: node.rectangleCornerRadii.toBorderRadius(),
        child: child,
      );
    }

    if (node.relativeTransform != null && node.relativeTransform.isRotated) {
      child = FigmaRotated(
        transform: node.relativeTransform,
        child: child,
      );
    }

    return child;
  }
}
