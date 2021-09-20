import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/arguments/border_radius.dart';

import 'color.dart';

Object? convertFill(figma.Paint node, num? globalCornerRadius,
    List<num>? rectangleCornerRadii) {
  return {
    'type': 'box',
    if (node.color != null) 'color': convertColor(node.color!),
    if (rectangleCornerRadii != null)
      'borderRadius': convertBorderRadius(rectangleCornerRadii),
    if (globalCornerRadius != null)
      'borderRadius': convertBorderRadius([
        globalCornerRadius,
        globalCornerRadius,
        globalCornerRadius,
        globalCornerRadius,
      ])
  };
}

Object? convertStroke(figma.Paint node, double? strokeWeight,
    num? globalCornerRadius, List<num>? rectangleCornerRadii) {
  return {
    'type': 'box',
    if (strokeWeight != null)
      'border': {
        'width': strokeWeight,
        if (node.color != null) 'color': convertColor(node.color!),
      },
    if (rectangleCornerRadii != null)
      'borderRadius': convertBorderRadius(rectangleCornerRadii),
    if (globalCornerRadius != null)
      'borderRadius': convertBorderRadius([
        globalCornerRadius,
        globalCornerRadius,
        globalCornerRadius,
        globalCornerRadius,
      ])
  };
}
