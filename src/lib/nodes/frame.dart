
import 'package:figma_to_flutter/context.dart';
import '../base/color.dart';
import 'node.dart';

class FrameGenerator {

  final ColorGenerator _color; 
  final NodeGenerator _node; 

  FrameGenerator(this._color, this._node);

  void generate(BuildContext context,dynamic map) {
    // Draw background
    var color = _color.generate(map["backgroundColor"]);
    var paint = "(Paint()..color = $color)";
    context.addPaint(["canvas.drawRect(Offset.zero & frame.size, $paint);"]);

    // Draw children
    map["children"].forEach((x) {
      this._node.generate(context,x,map);
    });
  }
}