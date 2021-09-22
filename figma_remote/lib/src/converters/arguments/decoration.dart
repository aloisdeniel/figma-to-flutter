import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/arguments/border_radius.dart';
import 'package:figma_remote/src/converters/arguments/gradient.dart';
import 'package:figma_remote/src/converters/context/context.dart';
import 'package:rfw/rfw.dart';

import 'color.dart';

Object? convertPaint(
  FigmaComponentContext context,
  String name,
  figma.Paint? fill,
  figma.Paint? stroke,
  num? strokeWeight,
  figma.StrokeAlign? strokeAlign,
  num? globalCornerRadius,
  List<num>? rectangleCornerRadii,
  num? cornerSmoothing,
) {
  final strokeColorName = stroke == null ||
          stroke.type != figma.PaintType.solid ||
          stroke.color == null
      ? null
      : context.theme.colors
          .create(convertColor(stroke.color!, stroke.opacity ?? 1.0), name);
  final fillColorName =
      fill == null || fill.type != figma.PaintType.solid || fill.color == null
          ? null
          : context.theme.colors
              .create(convertColor(fill.color!, fill.opacity ?? 1.0), name);

  return {
    if (fill != null &&
        fill.type == figma.PaintType.solid &&
        fillColorName != null)
      'color': DataReference(['theme', 'colors', fillColorName]),
    if (fill != null && fill.type != figma.PaintType.solid)
      'gradient': convertGradient(context, name, fill),
    'shape': {
      if (rectangleCornerRadii != null)
        'borderRadius':
            convertBorderRadius(rectangleCornerRadii, cornerSmoothing),
      if (globalCornerRadius != null)
        'borderRadius': convertBorderRadius(
          [
            globalCornerRadius,
            globalCornerRadius,
            globalCornerRadius,
            globalCornerRadius,
          ],
          cornerSmoothing,
        ),
      if (strokeAlign != null)
        'borderAlign': () {
          switch (strokeAlign) {
            case figma.StrokeAlign.inside:
              return 'inside';
            case figma.StrokeAlign.outside:
              return 'outside';
            case figma.StrokeAlign.center:
              return 'center';
          }
        }(),
      if (stroke != null && strokeWeight != null)
        'side': {
          'width': strokeWeight,
          if (stroke.type == figma.PaintType.solid && strokeColorName != null)
            'color': DataReference(['theme', 'colors', strokeColorName]),
          if (stroke.type !=
              figma.PaintType.solid) // TODO custom gradient borders
            'color': DataReference(
              [
                'theme',
                'colors',
                context.theme.colors.create(
                  convertColor(stroke.gradientStops!.first.color!),
                  name,
                ),
              ],
            ),
        },
    },
  };
}
