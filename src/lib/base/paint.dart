import 'dart:math';

import 'color.dart';
import 'package:code_builder/code_builder.dart';

class PaintGenerator {

  final ColorGenerator _color;

  PaintGenerator(this._color);

  Point _toPoint(dynamic map) {
    var x = map["x"].toDouble();
    var y = map["y"].toDouble();
    return new Point(x, y);
  }

  Code _generateAlignment(Point point) {
    return Code("Alignment(${point.x}, ${point.y})");
  }

  Code generate(dynamic map) {
    var type = map["type"];
    var opacity = map["opacity"]?.toDouble() ?? 1.0;

    if(type == "SOLID") {
      var color = _color.generate(map["color"], opacity: opacity);
      return new Code("(Paint()..color = $color)");
    }
    else if(type.startsWith("GRADIENT_")) {
      var local = (frame) => frame.toString();
      // Handles
      var gradientHandlePositions = map["gradientHandlePositions"];
      var begin = _toPoint(gradientHandlePositions[0]);
      var end = _toPoint(gradientHandlePositions[1]);
      begin = new Point((begin.x - 0.5) * 2.0, (begin.y - 0.5) * 2.0);
      end = new Point((end.x - 0.5) * 2.0, (end.y - 0.5) * 2.0);
      var beginAlignment = _generateAlignment(begin);
      var endAlignment = _generateAlignment(end);

      // Stops
      var gradientStops = map["gradientStops"];
      var stopValues = gradientStops.map((x)  => x["position"].toDouble()).toList().cast<double>();
      var stops = "[" + stopValues.join(", ") + "]";

      // Colors
      var colorValues = gradientStops.map((x)  => _color.generate(x["color"], opacity: opacity)).toList();
      var colors = "[" + colorValues.join(", ") + "]";
      var gradient = null;

      if(type == "GRADIENT_LINEAR") {
        gradient = new Code("LinearGradient(" +
        "begin: $beginAlignment, " + 
        "end: $endAlignment, " + 
        "stops: $stops, " + 
        "colors: $colors, " +
        "tileMode: TileMode.clamp" +
        ")");
      }
      else if(type == "GRADIENT_RADIAL") {
        var radius = (end.x - begin.x).abs();
        gradient = new Code("RadialGradient(" +
        "center: $beginAlignment, " + 
        "radius: $radius, " + 
        "stops: $stops, " + 
        "colors: $colors, " +
        "tileMode: TileMode.clamp" +
        ")");
      }

      if(gradient != null) {
        return new Code("(Paint()..shader = $gradient.createShader(Offset.zero & frame.size))");
      }
    }

    return new Code("Paint()");
}
}

