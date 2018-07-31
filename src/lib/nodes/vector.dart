
import 'dart:math';

import 'package:figma_to_flutter/base/effect.dart';
import 'package:figma_to_flutter/context.dart';
import 'package:figma_to_flutter/parsing/declaration.dart';
import 'package:figma_to_flutter/tools/format.dart';
import '../base/paint.dart';
import '../base/path.dart';

class VectorGenerator {

  final PaintGenerator _paint; 
  final EffectsGenerator _effects; 
  final PathGenerator _path; 

  VectorGenerator(this._paint, this._effects, this._path);

  Point _toPoint(dynamic map) {
    if(map == null) {
      return Point(0.0,0.0);
    }

    var w = map["width"] ?? map["x"];
    var h = map["height"] ?? map["y"];
    return Point(w.toDouble(), h.toDouble());
  }

  void generate(BuildContext context, dynamic map) {
 
    var declaration = Declaration.parse(map["name"]);
    var propertyName = toVariableName(declaration.name);
    
    var size = _toPoint(map["size"]);
    var sx = "(frame.width / ${toFixedDouble(size.x)})";
    var sy = "(frame.height / ${toFixedDouble(size.y)})";
    var transform = "Float64List.fromList([${sx}, 0.0, 0.0, 0.0, 0.0, ${sy}, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0,0.0, 0.0, 0.0, 1.0])";

    context.addPaint(["var transform = $transform;"]);

    var fillMaps = map["fills"].where((f) => map["visible"] == null || map['visible'] == true);
    var strokeMaps = map["strokes"].where((f) => map["visible"] == null || map['visible'] == true);
    var effectMaps = map["effects"].where((f) => map["visible"] == null || map['visible'] == true);

    var fillGeometry = "[" + map["fillGeometry"].map((f) => this._path.generate(f).toString() + ".transform(transform)").join(", ") + "]";
    context.addPaint(["var fillGeometry = $fillGeometry;"]);

    // Clipping
    if(map["isMask"] ?? false) {
      context.addPaint([
        "var mask = Path();",
        "fillGeometry.forEach((p) => mask.addPath(p, Offset.zero));"
        "canvas.clipPath(mask);"
      ]);
    }

    if(!effectMaps.isEmpty) {
      context.addPaint([
        "fillGeometry.forEach((path) {",
      ]);

      effectMaps.forEach((e) {
        var offset = _toPoint(e["offset"]);
        context.addPaint([ "var effectPaint = " + this._effects.generate(e).toString() + ";",]);
        var hasOffset = offset.x != 0.0 || offset.y != 0.0;

        if(hasOffset) {
          context.addPaint([
            "canvas.save();",
            "canvas.translate(${offset.x}, ${offset.y});"
          ]);
        }
        context.addPaint(["canvas.drawPath(path, effectPaint);"]);
        if(hasOffset) {
          context.addPaint(["canvas.restore();"]);
        }
      });

      context.addPaint([
        "});",
      ]);
    }

    if(!fillMaps.isEmpty) {
      fillMaps.forEach((f) {
        if(f["type"] == "IMAGE") {
          context.addImage(propertyName);
          context.addPaint([
            "fillGeometry.forEach((path) {",
            "if(${propertyName}Provider != null) ${propertyName}Provider.paint(canvas, path.getBounds(), path, ImageConfiguration());"
            "});",
          ]);
        }
        else {
          var paint = this._paint.generate(f);
          context.addPaint([
            "fillGeometry.forEach((path) {",
            "canvas.drawPath(path, $paint);",
            "});",
          ]);
        }
      });
    }

    if(!strokeMaps.isEmpty) {
      var strokes = "[" + strokeMaps.map((f) => this._paint.generate(f)).join(", ") + "]";
      var strokeGeometry = "[" + map["strokeGeometry"].map((f) => this._path.generate(f).toString() + ".transform(transform)").join(", ") + "]";
      context.addPaint([
        "var strokes = $strokes;",
        "var strokeGeometry = $strokeGeometry;",
        "strokes.forEach((paint) {",
        "strokeGeometry.forEach((path) {",
        "canvas.drawPath(path, paint);",
        "});",
        "});",
      ]);
    }
  }
}