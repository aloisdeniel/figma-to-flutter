import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/converters/arguments/color.dart';
import 'package:flutter_figma/src/converters/arguments/decoration.dart';
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:flutter_figma/src/converters/wrappers/opacity.dart';
import 'package:flutter_figma/src/converters/wrappers/transform.dart';
import 'package:rfw/formats.dart';

BlobNode? convert(FigmaComponentContext context, figma.Vector node) {
  final fills = node.fills?.where((x) => x.color != null).map(
    (fill) {
      return convertPaint(
        context,
        node.name ?? 'fill',
        fill,
        null,
        null,
        null,
        null,
        null,
        null,
      );
    },
  );
  final strokes = node.strokes?.where((x) => x.color != null).map(
    (stroke) {
      final colorName = stroke.color == null
          ? null
          : context.theme.colors
              .create(convertColor(stroke.color!), node.name ?? 'stroke');
      return {
        'width': node.strokeWeight,
        'color': StateReference(['theme', 'color', colorName!]),
      };
    },
  );
  final geometry = node.fillGeometry?.map((x) => {
        'path': x['path'],
        'windingRule': x['windingRule'],
      });

  BlobNode? result = ConstructorCall(
    'PathView',
    {
      if (geometry != null)
        'geometry': [
          ...geometry,
        ],
      if (fills != null) 'fills': [...fills],
      if (strokes != null) 'strokes': [...strokes],
    },
  );

  result = wrapOpacity(result, node.opacity);
  result = wrapTransform(result, node.relativeTransform);

  return result;
}
