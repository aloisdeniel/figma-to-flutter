
import 'dart:math';

import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/context.dart';
import '../base/paint.dart';
import '../base/path.dart';

class VectorGenerator {

  final PaintGenerator _paint; 
  final PathGenerator _path; 

  VectorGenerator(this._paint, this._path);

  Point _toPoint(dynamic map) {
    var w = map["width"] ?? map["x"];
    var h = map["height"] ?? map["y"];
    return Point(w.toDouble(), h.toDouble());
  }

  void generate(BuildContext context, dynamic map) {
 
    var size = _toPoint(map["size"]);
    var sx = "(frame.width / ${size.x})";
    var sy = "(frame.height / ${size.y})";
    var transform = "Float64List.fromList([$sx, 0.0, 0.0, 0.0, 0.0, $sy, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0,0.0, 0.0, 0.0, 1.0])";

    context.addPaint(["var transform = $transform;"]);

    var fillMaps = map["fills"].where((f) => map["visible"] == null || map['visible'] == true);
    var strokeMaps = map["strokes"].where((f) => map["visible"] == null || map['visible'] == true);

    if(!fillMaps.isEmpty) {
      var fills = "[" + fillMaps.map((f) => this._paint.generate(f)).join(", ") + "]";
      var fillGeometry = "[" + map["fillGeometry"].map((f) => this._path.generate(f).toString() + ".transform(transform)").join(", ") + "]";
      context.addPaint([
        "var fills = $fills;",
        "var fillGeometry = $fillGeometry;",
        "fills.forEach((paint) {",
        "fillGeometry.forEach((path) {",
        "canvas.drawPath(path, paint);",
        "});",
        "});",
      ]);
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