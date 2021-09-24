import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:flutter_figma/src/converters/helpers/decorated.dart';
import 'package:flutter_figma/src/converters/helpers/opacity.dart';
import 'package:rfw/formats.dart';

BlobNode? convert(FigmaComponentContext context, figma.Rectangle node) {
  BlobNode? result = wrapDecorated(
    context,
    node.name ?? 'rectangle',
    node.fills,
    node.strokes,
    node.cornerRadius,
    node.rectangleCornerRadii,
    0.0, //TODO
    node.strokeWeight,
    node.strokeAlign,
    null,
  );

  if (result != null) {
    result = wrapOpacity(result, node.opacity);
  }

  return result;
}
