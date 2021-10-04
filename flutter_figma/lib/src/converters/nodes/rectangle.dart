import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:flutter_figma/src/converters/wrappers/effect.dart';
import 'package:flutter_figma/src/converters/wrappers/decorated.dart';
import 'package:flutter_figma/src/converters/wrappers/opacity.dart';
import 'package:flutter_figma/src/converters/wrappers/transform.dart';
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
    result = wrapBackgroundBlurred(
      context,
      node.name ?? 'rectangle',
      result,
      node.effects,
      node.rectangleCornerRadii,
      0.0, //TODO
    );
    result = wrapOpacity(
      result,
      node.opacity,
    );
    result = wrapTransform(result, node.relativeTransform);
  }

  return result;
}
