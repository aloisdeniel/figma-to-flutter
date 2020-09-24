import 'package:figma_to_flutter/context.dart';
import '../base/color.dart';
import 'node.dart';

/**
 * A code generator that translates Figma frame nodes into
 * Flutter equivalents.
 */
class FrameGenerator {
  final ColorGenerator _color;
  final NodeGenerator _node;

  FrameGenerator(this._color, this._node);

  /**
  * Indicates whether this generator supports the given node (based on its type).
  */
  bool isSupported(dynamic map) {
    const supported = [
      'FRAME',
      'COMPONENT',
      'INSTANCE',
    ];
    return supported.contains(map["type"]);
  }

  void generate(BuildContext context, dynamic map) {
    // Draw background
    var color = _color.generate(map["backgroundColor"]);
    var paint = "(Paint()..color = $color)";
    context.addPaint(["canvas.drawRect(Offset.zero & frame.size, $paint);"]);

    // Draw children
    map["children"].forEach((child) {
      this._node.generate(context, child, map, child["relativeTransform"]);
    });
  }
}
