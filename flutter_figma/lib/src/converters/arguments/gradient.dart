import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:flutter/rendering.dart';
import 'package:collection/collection.dart';
import 'package:rfw/rfw.dart';

import 'color.dart';

DynamicMap convertGradient(
  FigmaComponentContext context,
  String name,
  figma.Paint paint,
) {
  final begin =
      paint.gradientHandlePositions?[0] ?? figma.Vector2D(x: 0.0, y: 0.0);
  final end =
      paint.gradientHandlePositions?[1] ?? figma.Vector2D(x: 0.0, y: 1.0);
  final beginAlign = Alignment((begin.x - 0.5) * 2.0, (begin.y - 0.5) * 2.0);
  final endAlign = Alignment((end.x - 0.5) * 2.0, (end.y - 0.5) * 2.0);
  final stops = paint.gradientStops?.map((x) => x.position ?? 0.0).toList();
  final colors = paint.gradientStops
          ?.whereNotNull()
          .map(
            (x) {
              final colorName = context.theme.colors
                  .create(convertColor(x.color!, paint.opacity ?? 1.0), name);
              return StateReference(['theme', 'color', colorName]);
            },
          )
          .whereNotNull()
          .toList() ??
      const <figma.Color>[];
  if (paint.type == figma.PaintType.gradientLinear) {
    return {
      'type': 'linear',
      'begin': {'x': beginAlign.x, 'y': beginAlign.y},
      'end': {'x': endAlign.x, 'y': endAlign.y},
      'colors': colors,
      'stops': stops,
    };
  }

  if (paint.type == figma.PaintType.gradientRadial) {
    return {
      'type': 'radial',
      'center': beginAlign,
      'radius': (endAlign.x - beginAlign.x).abs(),
      'end': {'x': endAlign.x, 'y': endAlign.y},
      'colors': colors,
      'stops': stops,
    };
  }
  return {};
}
