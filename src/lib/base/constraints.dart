import 'dart:math';
import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/context.dart';
import 'package:figma_to_flutter/tools/format.dart';
import 'package:figma_to_flutter/tools/positions.dart';

/**
 * A code generator that contains all code logic related to constraints management.
 */
class ConstraintsGenerator {
  void applyScale(
      BuildContext context, dynamic map, dynamic parent, String container) {
    var constraints = map["constraints"];
    var horizontal = constraints["horizontal"];
    var vertical = constraints["vertical"];

    var parentWidth = parent["size"]["x"].toDouble();
    var parentHeight = parent["size"]["y"].toDouble();

    String sx = "1.0";
    String sy = "1.0";

    switch (horizontal) {
      case "SCALE":
        sx = "($container.width) / ${toFixedDouble(parentWidth)}";
        break;
    }

    switch (vertical) {
      case "SCALE":
        sy = "($container.height) / ${toFixedDouble(parentHeight)}";
        break;
    }

    if (sx != "1.0" || sy != "1.0") {
      context.addPaint(["canvas.scale($sx,$sy);"]);
    }
  }

  Code generate(dynamic map, String container, Point orginalContainerSize,
      dynamic relativeTransform, bool withComments) {
    var size = map["size"];
    var vx = relativeTransform[0][2].toDouble();
    var vy = relativeTransform[1][2].toDouble();
    var vw = (size["width"] ?? size["x"]).toDouble();
    var vh = (size["height"] ?? size["y"]).toDouble();

    var inner = Rectangle<double>(vx, vy, vw, vh);
    var outer = Rectangle<double>(
        0.0, 0.0, orginalContainerSize.x, orginalContainerSize.y);

    var constraints = map["constraints"];
    var horizontal = constraints["horizontal"];
    var vertical = constraints["vertical"];

    var position = Position.inside(outer, inner);

    String x, y, w, h;

    switch (horizontal) {
      case "RIGHT":
        x = "($container.width - (${toFixedDouble(position.leftFromRight)}))";
        w = toFixedDouble(vw);
        break;
      case "LEFT_RIGHT":
        var totalMargin = vx + position.right;
        x = toFixedDouble(vx);
        w = "($container.width - (${toFixedDouble(totalMargin)}))";
        break;
      case "CENTER":
        var center = vx + (vw / 2.0);
        var delta = (orginalContainerSize.x / 2.0) - center;
        x = "(($container.width / 2.0) - (${toFixedDouble(delta + vw / 2.0)}))";
        w = toFixedDouble(vw);
        break;
      default:
        x = toFixedDouble(vx);
        w = toFixedDouble(vw);
        break;
    }

    switch (vertical) {
      case "BOTTOM":
        y = "($container.height - (${toFixedDouble(position.topFromBottom)}))";
        h = toFixedDouble(vh);
        break;
      case "TOP_BOTTOM":
        var totalMargin = vy + position.bottom;
        y = toFixedDouble(vy);
        h = "($container.height - (${toFixedDouble(totalMargin)}))";
        break;
      case "CENTER":
        var center = vy + (vh / 2.0);
        var delta = (orginalContainerSize.y / 2.0) - center;
        y = "(($container.height / 2.0) - ${toFixedDouble(delta + vh / 2.0)})";
        h = toFixedDouble(vh);
        break;
      default:
        y = toFixedDouble(vy);
        h = toFixedDouble(vh);
        break;
    }

    var comments =
        " /* H:${horizontal} V:${vertical} F:(l:${position.left},t:${position.top},r:${position
            .right},b:${position.right},w:${position.width},h:${position.height}) */";
    return Code(
        "Rect.fromLTWH($x, $y, $w, $h)" + (withComments ? comments : ""));
  }
}
