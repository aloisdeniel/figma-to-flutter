
import 'package:code_builder/code_builder.dart';

// TODO improve with a map of for caching identical colors as variables
class ColorGenerator {
  Code generate(dynamic map, {double opacity = 1.0}) {
    var r = map["r"].toDouble();
    var g = map["g"].toDouble();
    var b = map["b"].toDouble();
    var a = map["a"].toDouble();

    var ir = (r * 255).toInt();
    var ig = (g * 255).toInt();
    var ib = (b * 255).toInt();
    var ia = (a * opacity * 255).toInt();

    return new Code("Color.fromARGB($ia, $ir, $ig, $ib)");
  }
}