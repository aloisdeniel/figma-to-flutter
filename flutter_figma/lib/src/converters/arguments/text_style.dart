import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/converters/arguments/color.dart';
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:rfw/rfw.dart';

DynamicMap convertTextStyle(FigmaComponentContext context, String name,
    figma.TypeStyle style, figma.Paint? fill) {
  final decoration = style.textDecoration == figma.TextDecoration.underline
      ? 'underline'
      : 'none';
  final fontWeight = (style.fontWeight?.toInt() ?? 400);
  final lineHeight = () {
    switch (style.lineHeightUnit) {
      case figma.LineHeightUnit.fontSizePercent:
        if (style.lineHeightPercent == null) return null;
        return (style.lineHeightPercent! * 2) / 100.0;
      case figma.LineHeightUnit.intrinsicPercent:
        if (style.lineHeightPercentFontSize == null) return null;
        return style.lineHeightPercentFontSize! / 100.0;
      case null:
      case figma.LineHeightUnit.pixels:
        if (style.fontSize == null || style.lineHeightPx == null) return null;
        return style.lineHeightPx! / style.fontSize!;
    }
  }();
  return {
    'decoration': decoration,
    'fontWeight': 'w$fontWeight',
    'fontFamily': style.fontFamily,
    if (lineHeight != null) 'height': lineHeight,
    if (style.fontSize != null) 'fontSize': style.fontSize,
  };
}
