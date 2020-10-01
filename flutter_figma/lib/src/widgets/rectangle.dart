import 'package:figma/figma.dart' as figma;
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/rendering/decoration.dart';

class FigmaRectangle extends StatelessWidget {
  final figma.Rectangle node;
  FigmaRectangle({
    Key key,
    @required this.node,
  }) : super(
          key: key ?? (node.id != null ? Key(node.id) : null),
        );

  @override
  Widget build(BuildContext context) {
    Widget child = SizedBox();

    if (node.fills.isNotEmpty ||
        node.strokes.isNotEmpty ||
        node.effects.isNotEmpty) {
      child = DecoratedBox(
        decoration: FigmaPaintDecoration(
          shape: FigmaBoxPaintShape(
            rectangleCornerRadii:
                node.rectangleCornerRadii ?? const <num>[0, 0, 0, 0],
          ),
          fills: node.fills,
          strokes: node.strokes,
          effects: node.effects,
        ),
      );
    }

    if (node.opacity != null && node.opacity < 1) {
      child = Opacity(
        opacity: node.opacity,
        child: child,
      );
    }

    return child;
  }
}
