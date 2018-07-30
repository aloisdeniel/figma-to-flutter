import 'color.dart';
import 'package:code_builder/code_builder.dart';

class EffectsGenerator {

  final ColorGenerator _color;

  EffectsGenerator(this._color);

  Code generate(dynamic map) {
    var type = map["type"];

    if(type.startsWith("DROP_SHADOW")) {
      var color = _color.generate(map["color"]);
      var radius = map["radius"].toDouble();

    return new Code("(Paint()\n" +
      "..color = $color\n" +
      "..maskFilter = MaskFilter.blur(BlurStyle.normal, BoxShadow.convertRadiusToSigma($radius))" +
      ")");
    }

    return new Code("Paint()");
  }
}
