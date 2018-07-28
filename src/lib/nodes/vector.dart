
import 'dart:math';

import 'package:code_builder/code_builder.dart';
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

  List<Code> generate(dynamic map) {
 
    var result = List<Code>();

    var size = _toPoint(map["size"]);
    var sx = "(frame.width / ${size.x})";
    var sy = "(frame.height / ${size.y})";
    var transform = "Float64List.fromList([$sx, 0.0, 0.0, 0.0, 0.0, $sy, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0,0.0, 0.0, 0.0, 1.0])";

    result.add(new Code("var transform = $transform;"));

    var fillMaps = map["fills"].where((f) => map["visible"] == null || map['visible'] == true);
    var strokeMaps = map["strokes"].where((f) => map["visible"] == null || map['visible'] == true);

    if(!fillMaps.isEmpty) {
      var fills = "[" + fillMaps.map((f) => this._paint.generate(f)).join(", ") + "]";
      var fillGeometry = "[" + map["fillGeometry"].map((f) => this._path.generate(f).toString() + ".transform(transform)").join(", ") + "]";
      result.addAll([
        new Code("var fills = $fills;"),
        new Code("var fillGeometry = $fillGeometry;"),
        new Code("fills.forEach((paint) {"),
        new Code("fillGeometry.forEach((path) {"),
        new Code("canvas.drawPath(path, paint);"),
        new Code("});"),
        new Code("});"),
      ]);
    }

    if(!strokeMaps.isEmpty) {
      var strokes = "[" + strokeMaps.map((f) => this._paint.generate(f)).join(", ") + "]";
      var strokeGeometry = "[" + map["strokeGeometry"].map((f) => this._path.generate(f).toString() + ".transform(transform)").join(", ") + "]";
      result.addAll([
        new Code("var strokes = $strokes;"),
        new Code("var strokeGeometry = $strokeGeometry;"),
        new Code("strokes.forEach((paint) {"),
        new Code("strokeGeometry.forEach((path) {"),
        new Code("canvas.drawPath(path, paint);"),
        new Code("});"),
        new Code("});"),
      ]);
    }

    return result;
  }
}