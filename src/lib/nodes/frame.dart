
import 'package:code_builder/code_builder.dart';
import '../base/color.dart';
import 'node.dart';

class FrameGenerator {

  final ColorGenerator _color; 
  final NodeGenerator _node; 

  FrameGenerator(this._color, this._node);

  List<Code> generate(dynamic map) {
    var result = List<Code>();

    // Draw background
    var color = _color.generate(map["backgroundColor"]);
    var paint = "(Paint()..color = $color)";
    result.add(Code("canvas.drawRect(Offset.zero & frame.size, $paint);"));

    // Draw children
    map["children"].forEach((x) {
       var code = this._node.generate(x,map);
       result.addAll(code);
    });

    return result;
  }
}