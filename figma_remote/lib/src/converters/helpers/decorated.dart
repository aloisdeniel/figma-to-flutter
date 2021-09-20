import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/arguments/decoration.dart';
import 'package:rfw/formats.dart';

BlobNode? wrapDecorated(
  List<figma.Paint>? fills,
  List<figma.Paint>? strokes,
  num? globalCornerRadius,
  List<num>? rectangleCornerRadii,
  num? strokeWeight,
  BlobNode? result,
) {
  if (fills != null) {
    for (var fill in fills) {
      result = _fill(globalCornerRadius, rectangleCornerRadii, fill, result);
    }
  }

  if (strokes != null) {
    for (var stroke in strokes) {
      result = _stroke(globalCornerRadius, rectangleCornerRadii, strokeWeight,
          stroke, result);
    }
  }

  return result;
}

BlobNode _fill(
  num? globalCornerRadius,
  List<num>? rectangleCornerRadii,
  figma.Paint fill,
  Object? child,
) {
  return ConstructorCall(
    'Container',
    {
      'decoration': convertFill(fill, globalCornerRadius, rectangleCornerRadii),
      if (child != null) 'child': child,
    },
  );
}

BlobNode _stroke(
  num? globalCornerRadius,
  List<num>? rectangleCornerRadii,
  num? strokeWeight,
  figma.Paint fill,
  Object? child,
) {
  return ConstructorCall(
    'Container',
    {
      'decoration': convertStroke(
        fill,
        strokeWeight?.toDouble(),
        globalCornerRadius,
        rectangleCornerRadii,
      ),
      if (child != null) 'child': child,
    },
  );
}
