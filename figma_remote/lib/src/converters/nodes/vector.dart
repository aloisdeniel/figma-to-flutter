import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/arguments/color.dart';
import 'package:figma_remote/src/converters/context/context.dart';
import 'package:figma_remote/src/converters/helpers/opacity.dart';
import 'package:rfw/formats.dart';

BlobNode? convert(FigmaComponentContext context, figma.Vector node) {
  final fills = node.fills?.where((x) => x.color != null).map(
    (fill) {
      final colorName = fill.color == null
          ? null
          : context.theme.colors
              .create(convertColor(fill.color!), node.name ?? 'fill');
      return DataReference(['theme', 'colors', colorName!]);
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
        'color': DataReference(['theme', 'colors', colorName!]),
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

  return result;
}
