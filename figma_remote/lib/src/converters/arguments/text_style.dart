import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/arguments/color.dart';
import 'package:rfw/rfw.dart';

DynamicMap convertTextStyle(figma.TypeStyle style, figma.Paint? fill) {
  final decoration = style.textDecoration == figma.TextDecoration.underline
      ? 'underline'
      : 'none';
  final fontWeight = (style.fontWeight?.toInt() ?? 400);
  return {
    'decoration': decoration,
    'fontWeight': 'w$fontWeight',
    'fontFamily': style.fontFamily,
    if (fill?.color != null) 'color': convertColor(fill!.color!),
    if (style.fontSize != null) 'fontSize': style.fontSize,
  };
}
/*
final color = fills
        ?.firstWhere(
          (x) => x.color != null,
          orElse: () => defaultPaint,
        )
        .color
        ?.toFlutterColor();
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      package: package,
      fontSize: fontSize?.toDouble(),
      decoration: textDecoration == figma.TextDecoration.underline
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: color,
      decorationStyle: textDecoration == figma.TextDecoration.underline
          ? TextDecorationStyle.solid
          : null,
      decorationThickness:
          textDecoration == figma.TextDecoration.underline ? 1 : null,
      fontWeight: FontWeight.values.firstWhere(
        (x) => x.index == ((fontWeight?.toInt() ?? 400) / 100) - 1,
        orElse: () => FontWeight.w400,
      ),
    );

    */