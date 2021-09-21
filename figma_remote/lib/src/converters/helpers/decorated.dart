import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/arguments/decoration.dart';
import 'package:figma_remote/src/converters/context/context.dart';
import 'package:rfw/formats.dart';

BlobNode? wrapDecorated(
  FigmaComponentContext context,
  String name,
  List<figma.Paint>? fills,
  List<figma.Paint>? strokes,
  num? globalCornerRadius,
  List<num>? rectangleCornerRadii,
  num? strokeWeight,
  BlobNode? result,
) {
  if (fills != null &&
      fills.length == 1 &&
      strokes != null &&
      strokes.length == 1) {
    result = _stroke(
      context,
      name,
      globalCornerRadius,
      rectangleCornerRadii,
      strokeWeight,
      fills.first,
      strokes.first,
      result,
    );
  } else {
    if (fills != null) {
      for (var fill in fills) {
        result = _fill(
          context,
          name,
          globalCornerRadius,
          rectangleCornerRadii,
          fill,
          result,
        );
      }
    }

    if (strokes != null) {
      for (var stroke in strokes) {
        result = _stroke(
          context,
          name,
          globalCornerRadius,
          rectangleCornerRadii,
          strokeWeight,
          null,
          stroke,
          result,
        );
      }
    }
  }

  return result;
}

BlobNode _fill(
  FigmaComponentContext context,
  String name,
  num? globalCornerRadius,
  List<num>? rectangleCornerRadii,
  figma.Paint fill,
  Object? child,
) {
  return ConstructorCall(
    'Container',
    {
      'decoration': convertFill(
        context,
        name,
        fill,
        globalCornerRadius,
        rectangleCornerRadii,
      ),
      if (child != null) 'child': child,
    },
  );
}

BlobNode _stroke(
  FigmaComponentContext context,
  String name,
  num? globalCornerRadius,
  List<num>? rectangleCornerRadii,
  num? strokeWeight,
  figma.Paint? fill,
  figma.Paint stroke,
  Object? child,
) {
  return ConstructorCall(
    'DecoratedBorder',
    {
      'decoration': convertStroke(
        context,
        name,
        fill,
        stroke,
        strokeWeight?.toDouble(),
        globalCornerRadius,
        rectangleCornerRadii,
      ),
      if (child != null) 'child': child,
    },
  );
}
