import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/arguments/border_radius.dart';
import 'package:figma_remote/src/converters/context/context.dart';
import 'package:rfw/rfw.dart';

import 'color.dart';

Object? convertFill(
  FigmaComponentContext context,
  String name,
  figma.Paint node,
  num? globalCornerRadius,
  List<num>? rectangleCornerRadii,
) {
  final colorName = node.color == null
      ? null
      : context.theme.colors.create(convertColor(node.color!), name);
  return {
    'type': 'box',
    if (colorName != null)
      'color': DataReference(['theme', 'colors', colorName]),
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

Object? convertStroke(
  FigmaComponentContext context,
  String name,
  figma.Paint? fill,
  figma.Paint node,
  double? strokeWeight,
  num? globalCornerRadius,
  List<num>? rectangleCornerRadii,
) {
  final fillValue = fill == null
      ? null
      : convertFill(
          context,
          name,
          fill,
          globalCornerRadius,
          rectangleCornerRadii,
        );
  final colorName = node.color == null
      ? null
      : context.theme.colors.create(convertColor(node.color!), name);
  return {
    if (fillValue != null) ...fillValue as DynamicMap,
    'type': 'box',
    if (strokeWeight != null)
      'border': [
        {
          'width': strokeWeight,
          if (colorName != null)
            'color': DataReference(['theme', 'colors', colorName]),
        },
      ],
    if (rectangleCornerRadii != null)
      'borderRadius': convertBorderRadius(rectangleCornerRadii),
    if (globalCornerRadius != null)
      'borderRadius': convertBorderRadius(
        [
          globalCornerRadius,
          globalCornerRadius,
          globalCornerRadius,
          globalCornerRadius,
        ],
      )
  };
}
