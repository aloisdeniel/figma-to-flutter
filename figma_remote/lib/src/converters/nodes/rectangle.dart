import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/helpers/decorated.dart';
import 'package:figma_remote/src/converters/helpers/opacity.dart';
import 'package:rfw/formats.dart';

BlobNode? convert(figma.Rectangle node) {
  BlobNode? result = wrapDecorated(
    node.fills,
    node.strokes,
    node.cornerRadius,
    node.rectangleCornerRadii,
    node.strokeWeight,
    null,
  );

  if (result != null) {
    result = wrapOpacity(result, node.opacity);
  }

  return result;
}
