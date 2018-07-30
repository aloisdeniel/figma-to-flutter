
import 'dart:math';

import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/base/effect.dart';
import 'package:figma_to_flutter/context.dart';
import 'package:figma_to_flutter/nodes/directive.dart';
import 'package:figma_to_flutter/parsing/declaration.dart';
import 'package:figma_to_flutter/tools/format.dart';
import 'frame.dart';
import 'vector.dart';
import 'group.dart';
import 'text.dart';
import '../base/color.dart';
import '../base/paint.dart';
import '../base/path.dart';
import '../base/text_styles.dart';

class NodeGenerator {

  FrameGenerator _frame;
  VectorGenerator _vector;
  GroupGenerator _group;
  TextGenerator _text;
  final DirectiveGenerator _directive;

  NodeGenerator(this._directive, ColorGenerator color, PaintGenerator paint, EffectsGenerator effects, PathGenerator path, TextStyleGenerator textStyle, ParagraphStyleGenerator paragraphStyle) {
    _group = GroupGenerator(this);
    _frame = FrameGenerator(color, this);
    _vector = VectorGenerator(paint, effects, path);
    _text = TextGenerator(color, textStyle, paragraphStyle);
  }

  Code _createTransform(dynamic map) {
    var transform = map["relativeTransform"];
    var row0 = transform[0];
    var row1 = transform[1];

    var a = row0[0].toDouble();
    var b = row0[1].toDouble();
    var d = row1[0].toDouble();
    var e = row1[1].toDouble();

    var values = [
      a.toString(), d.toString() , "0.0", "0.0",
      b.toString(), e.toString(), "0.0", "0.0",
      "0.0" , "0.0" , "1.0" , "0.0",
      "frame.left" , "frame.top" , "0.0" , "1.0",
    ];

    return new Code("Float64List.fromList([" + values.join(", ") + "])");
  }

  Point _toPoint(dynamic map) {
    var w = map["width"] ?? map["x"];
    var h = map["height"] ?? map["y"];
    return Point(w.toDouble(), h.toDouble());
  }

  Code _createFrame(map, Point orginalContainerSize) {

    var size = _toPoint(map["size"]);
    var relativeTransform = map["relativeTransform"];

    var vx = relativeTransform[0][2].toDouble();
    var vy = relativeTransform[1][2].toDouble();
    var vw = size.x;
    var vh = size.y;

    var constraints = map["constraints"];
    var horizontal = constraints["horizontal"];
    var vertical = constraints["vertical"];

    var x = "$vx";
    var y = "$vy";
    var w = "$vw";
    var h = "$vh";

    switch(horizontal) {
      case "RIGHT":
        var fromRight = orginalContainerSize.x - vx;
        x = "(container.width - (${fromRight}))";
        break;
      case "LEFT_RIGHT":
        var right = orginalContainerSize.x - vx - vw;
        var totalMargin = vx + right;
        w = "(container.width - ($totalMargin))";
        break;
      case "CENTER":
        var center = vx + (vw / 2.0);
        var delta = (orginalContainerSize.x / 2.0) - center;
        x = "((container.width / 2.0) - $delta - ${vw / 2.0})";
        break;
    }
    
    switch(vertical) {
      case "BOTTOM":
        var fromBottom = orginalContainerSize.y - vy;
        y = "(container.height - (${fromBottom}))";
        break;
      case "TOP_BOTTOM":
        var bottom = orginalContainerSize.y - vy - vh;
        var totalMargin = vy + bottom;
        h = "(container.height - ($totalMargin))";
        break;
      case "CENTER":
        var center = vy + (vh / 2.0);
        var delta = (orginalContainerSize.y / 2.0) - center;
        y = "((container.height / 2.0) - $delta - ${vh / 2.0})";
        break;
    }

    return Code("Rect.fromLTWH($x, $y, $w, $h)");
  }

  void _generateData(BuildContext context, dynamic map) {
      var declaration = Declaration.parse(map["name"]);
      context.addData(declaration.name, map["type"]);
  }

  void generate(BuildContext context, dynamic map, dynamic parent) {
    var declaration = Declaration.parse(map["name"]);
    var varName = toVariableName(declaration.name);

    // ignoring directives 
    if(declaration is DirectiveItem) {
      if(_directive.generate(context, map))
        return;
    }

    if(declaration is DynamicItem) {
      _generateData(context, map);
      var defaultIsVisible = (map["visible"] == null || map["visible"] == true).toString();
      context.addPaint(["if(this.data?.$varName?.isVisible ?? $defaultIsVisible) {"]);
    }

   context.addPaint(["", "// ${map["name"]}"]);

    var methodName = "draw_" + map["id"].replaceAll(":", "_").replaceAll(";","__");
    print(methodName);
   context.addPaint(["var $methodName = (Canvas canvas, Rect container) {"]);

    // Transform

    var container = _toPoint(parent["size"]);
    var frame = _createFrame(map, container);
    var relativeTransform = _createTransform(map);
    context.addPaint(["var frame = ${frame};"]);

    context.addPaint([
      "canvas.save();",
      "canvas.transform(${relativeTransform});"
    ]);

    switch(map["type"] as String)
    {
        case 'RECT':
        case 'VECTOR':
        case 'ELLIPSE':
        case 'RECTANGLE':
        case 'REGULAR_POLYGON':
        case 'BOOLEAN_OPERATION':
        case 'STAR':
          _vector.generate(context, map);
          break;

        case 'GROUP':
          _group.generate(context, map);
          break;

        case 'FRAME':
        case 'COMPONENT':
        case 'INSTANCE':
          _frame.generate(context, map);
          break;

        case 'TEXT':
          _text.generate(context, map);
          break;
      }
      context.addPaint([
        "canvas.restore();",
        "};",
        "$methodName(canvas,frame);",
      ]);
    
    if(declaration is DynamicItem) {
      context.addPaint(["}"]);
    }
  }
}