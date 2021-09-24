import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/converters/arguments/decoration.dart';
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:rfw/formats.dart';

BlobNode? wrapDecorated(
  FigmaComponentContext context,
  String name,
  List<figma.Paint>? fills,
  List<figma.Paint>? strokes,
  num? globalCornerRadius,
  List<num>? rectangleCornerRadii,
  num? cornerSmoothing,
  num? strokeWeight,
  figma.StrokeAlign? strokeAlign,
  BlobNode? result,
) {
  if (fills != null &&
      fills.length == 1 &&
      strokes != null &&
      strokes.length == 1) {
    result = _paint(
      context,
      name,
      globalCornerRadius,
      rectangleCornerRadii,
      cornerSmoothing,
      strokeWeight,
      strokeAlign,
      fills.first,
      strokes.first,
      result,
    );
  } else {
    if (fills != null) {
      for (var fill in fills.reversed.where((x) => x.visible)) {
        result = _paint(
          context,
          name,
          globalCornerRadius,
          rectangleCornerRadii,
          cornerSmoothing,
          null,
          null,
          fill,
          null,
          result,
        );
      }
    }

    if (strokes != null) {
      for (var stroke in strokes.reversed.where((x) => x.visible)) {
        result = _paint(
          context,
          name,
          globalCornerRadius,
          rectangleCornerRadii,
          cornerSmoothing,
          strokeWeight,
          strokeAlign,
          null,
          stroke,
          result,
        );
      }
    }
  }

  return result;
}

BlobNode _paint(
  FigmaComponentContext context,
  String name,
  num? globalCornerRadius,
  List<num>? rectangleCornerRadii,
  num? cornerSmoothing,
  num? strokeWeight,
  figma.StrokeAlign? strokeAlign,
  figma.Paint? fill,
  figma.Paint? stroke,
  Object? child,
) {
  return ConstructorCall(
    'SmoothContainer',
    {
      'decoration': convertPaint(
        context,
        name,
        fill,
        stroke,
        strokeWeight,
        strokeAlign,
        globalCornerRadius,
        rectangleCornerRadii,
        cornerSmoothing,
      ),
      if (child != null) 'child': child,
    },
  );
}
