import 'package:figma_to_flutter/base/base.dart';
import 'package:figma_to_flutter/base/constraints.dart';
import 'package:figma_to_flutter/base/effect.dart';
import 'package:figma_to_flutter/base/transform.dart';
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

/**
 * A code generator that translates Figma node into its
 * Flutter equivalent.
 * 
 * It basically applies transform to canvas (if needed), 
 * manages visibility, directives and select a sub-generator 
 * (based on node type).
 * 
 * A method is created for each node to keep a local scope.
 */
class NodeGenerator {
  FrameGenerator _frame;
  VectorGenerator _vector;
  GroupGenerator _group;
  TextGenerator _text;
  final DirectiveGenerator _directive;
  final TransformGenerator _transform;
  final ConstraintsGenerator _constraints;

  NodeGenerator(
      this._directive,
      this._transform,
      this._constraints,
      ColorGenerator color,
      PaintGenerator paint,
      EffectsGenerator effects,
      PathGenerator path,
      TextStyleGenerator textStyle,
      ParagraphStyleGenerator paragraphStyle) {
    _group = GroupGenerator(this);
    _frame = FrameGenerator(color, this);
    _vector = VectorGenerator(paint, effects, path);
    _text = TextGenerator(color, textStyle, paragraphStyle);
  }

  void _generateData(BuildContext context, dynamic map) {
    var declaration = Declaration.parse(map["name"]);
    context.addData(declaration.name, map["type"]);
  }

  void generate(
      BuildContext context, dynamic map, dynamic parent, dynamic transform) {
    var declaration = Declaration.parse(map["name"]);
    var varName = toVariableName(declaration.name);

    // ignoring directives
    if (declaration is DirectiveItem) {
      if (_directive.generate(context, map)) return;
    }

    if (declaration is DynamicItem) {
      _generateData(context, map);
      var defaultIsVisible =
          (map["visible"] == null || map["visible"] == true).toString();
      context.addPaint(["if(this.$varName?.isVisible ?? $defaultIsVisible) {"]);
    }

    if (context.withComments) {
      context
          .addPaint(["", "// ${map["id"]} : ${map["name"]} (${map["type"]})"]);
    }

    var isVector = _vector.isSupported(map);
    var isGroup = _group.isSupported(map);

    if (isVector) {
      _vector.generateClip(context, map);
    }

    var methodName =
        "draw_" + map["id"].replaceAll(":", "_").replaceAll(";", "__");
    print(methodName);
    context.addPaint(["var $methodName = (Canvas canvas, Rect container) {"]);

    // Transform

    if (!isGroup) {
      var container = toPoint(parent["size"]);
      var frame = _constraints.generate(
          map, "container", container, transform, context.withComments);
      context.addPaint(["var frame = ${frame};"]);

      context.addPaint([
        "canvas.save();",
      ]);

      _constraints.applyScale(context, map, parent, "container");

      var relativeTransform = _transform.generate(transform);
      context.addPaint(["canvas.transform($relativeTransform);"]);

      if (isVector) {
        _vector.generate(context, map);
      } else if (_frame.isSupported(map)) {
        _frame.generate(context, map);
      } else if (_text.isSupported(map)) {
        _text.generate(context, map);
      }

      context.addPaint([
        "canvas.restore();",
      ]);
    } else {
      _group.generate(context, map, parent, transform);
    }

    context.addPaint([
      "};",
      "$methodName(canvas,frame);",
    ]);

    if (declaration is DynamicItem) {
      context.addPaint(["}"]);
    }
  }
}
