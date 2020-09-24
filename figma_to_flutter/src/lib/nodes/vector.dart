import 'package:figma_to_flutter/base/base.dart';
import 'package:figma_to_flutter/base/effect.dart';
import 'package:figma_to_flutter/context.dart';
import 'package:figma_to_flutter/parsing/declaration.dart';
import 'package:figma_to_flutter/tools/format.dart';
import '../base/paint.dart';
import '../base/path.dart';

/**
 * A code generator that translates Figma vector nodes into
 * Flutter equivalents.
 */
class VectorGenerator {
  final PaintGenerator _paint;
  final EffectsGenerator _effects;
  final PathGenerator _path;

  VectorGenerator(this._paint, this._effects, this._path);

  void generateClip(BuildContext context, dynamic map) {
    var isMask = map["isMask"] ?? false;

    // Clipping
    if (isMask) {
      print("Creating mask");

      var size = toPoint(map["size"]);
      var sx = "(frame.width / ${toFixedDouble(size.x)})";
      var sy = "(frame.height / ${toFixedDouble(size.y)})";
      var transform =
          "Float64List.fromList([${sx}, 0.0, 0.0, 0.0, 0.0, ${sy}, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0,0.0, 0.0, 0.0, 1.0])";
      var clipGeometry = _createGeometry(map, "clipTransform");

      context.addPaint([
        "var mask = Path();",
        "var clipTransform = $transform;",
        "var clipGeometry = $clipGeometry;",
        "clipGeometry.forEach((p) => mask.addPath(p, Offset.zero));",
        "canvas.clipPath(mask);"
      ]);
    }
  }

  /**
   * Indicates whether this generator supports the given node (based on its type).
   */
  bool isSupported(dynamic map) {
    const supported = [
      'RECT',
      'VECTOR',
      'ELLIPSE',
      'RECTANGLE',
      'REGULAR_POLYGON',
      'BOOLEAN_OPERATION',
      'STAR'
    ];
    return supported.contains(map["type"]);
  }

  String _createGeometry(dynamic map, String transform) {
    // For rectangles, a custom geometry is created to keep
    // consistenc corner radius while stretching
    if (map["type"] == "RECTANGLE") {
      var radius = map["cornerRadius"]?.toDouble() ?? 0.0;
      var rect = "Rect.fromLTWH(0.0,0.0,frame.width, frame.height)";

      if (radius <= 0.0) {
        return "[(Path()..addRect($rect))]";
      }

      return "[" +
          "Path()..addRRect(RRect.fromRectAndRadius($rect, Radius.circular($radius)))" +
          "]";
    }
    return "[" +
        map["fillGeometry"]
            .map((f) =>
                this._path.generate(f).toString() + ".transform($transform)")
            .join(", ") +
        "]";
  }

  void generate(BuildContext context, dynamic map) {
    var declaration = Declaration.parse(map["name"]);
    var propertyName = toVariableName(declaration.name);

    String geometry = _createGeometry(map, "transform");

    var size = toPoint(map["size"]);
    var sx = "(frame.width / ${toFixedDouble(size.x)})";
    var sy = "(frame.height / ${toFixedDouble(size.y)})";
    var transform =
        "Float64List.fromList([${sx}, 0.0, 0.0, 0.0, 0.0, ${sy}, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0,0.0, 0.0, 0.0, 1.0])";

    context.addPaint(["var transform = $transform;"]);

    var fillMaps = map["fills"]
        .where((f) => map["visible"] == null || map['visible'] == true);
    var strokeMaps = map["strokes"]
        .where((f) => map["visible"] == null || map['visible'] == true);
    var effectMaps = map["effects"]
        .where((f) => map["visible"] == null || map['visible'] == true);

    if (!fillMaps.isEmpty || !effectMaps.isEmpty) {
      context.addPaint(["var fillGeometry = $geometry;"]);

      if (!effectMaps.isEmpty) {
        context.addPaint([
          "fillGeometry.forEach((path) {",
        ]);

        effectMaps.forEach((e) {
          var offset = toPoint(e["offset"]);
          context.addPaint([
            "var effectPaint = " + this._effects.generate(e).toString() + ";",
          ]);
          var hasOffset = offset.x != 0.0 || offset.y != 0.0;

          if (hasOffset) {
            context.addPaint([
              "canvas.save();",
              "canvas.translate(${toFixedDouble(offset.x)}, ${toFixedDouble(
                  offset.y)});"
            ]);
          }
          context.addPaint(["canvas.drawPath(path, effectPaint);"]);
          if (hasOffset) {
            context.addPaint(["canvas.restore();"]);
          }
        });

        context.addPaint([
          "});",
        ]);
      }

      if (!fillMaps.isEmpty) {
        fillMaps.forEach((f) {
          if (f["type"] == "IMAGE") {
            context.addImage(propertyName, f);
            context.addPaint([
              "fillGeometry.forEach((path) {",
              "if(${propertyName}Provider != null) {",
              "${propertyName}Provider.paint(canvas, path.getBounds(), path, ImageConfiguration());"
                  "}",
              "});",
            ]);
          } else {
            var paint = this._paint.generate(f);
            context.addPaint([
              "fillGeometry.forEach((path) {",
              "canvas.drawPath(path, $paint);",
              "});",
            ]);
          }
        });
      }
    }

    if (!strokeMaps.isEmpty) {
      var strokes =
          "[" + strokeMaps.map((f) => this._paint.generate(f)).join(", ") + "]";
      var strokeGeometry = "[" +
          map["strokeGeometry"]
              .map((f) =>
                  this._path.generate(f).toString() + ".transform(transform)")
              .join(", ") +
          "]";
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
