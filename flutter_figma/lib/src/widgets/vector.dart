import 'package:figma/figma.dart' as figma;
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/rendering/decoration.dart';
import 'package:path_drawing/path_drawing.dart';

class FigmaVector extends StatelessWidget {
  final figma.Vector node;
  FigmaVector({
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
          strokeWeight: node.strokeWeight,
          shape: FigmaPathPaintShape(
            fillGeometry: node.fillGeometry
                .map(
                  (x) => parseSvgPathData(x['path']),
                )
                .toList(),
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
