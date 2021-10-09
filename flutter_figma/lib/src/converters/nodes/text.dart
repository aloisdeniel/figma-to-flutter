import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/converters/arguments/color.dart';
import 'package:flutter_figma/src/converters/arguments/text_style.dart';
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:flutter_figma/src/converters/wrappers/opacity.dart';
import 'package:flutter_figma/src/converters/wrappers/transform.dart';
import 'package:rfw/formats.dart';

BlobNode convert(FigmaComponentContext context, figma.Text node) {
  final textAlign = () {
    switch (node.style?.textAlignHorizontal) {
      case figma.TextAlignHorizontal.right:
        return 'right';
      case figma.TextAlignHorizontal.center:
        return 'center';
      case figma.TextAlignHorizontal.justified:
        return 'justify';
      default:
        return 'left';
    }
  }();

  final text = context.data.text.create(
    node.characters ?? '',
    node.name ?? 'text',
  );

  final styleName = context.theme.textStyles.create(
    convertTextStyle(
      context,
      node.name ?? 'text',
      node.style!,
      node.fills?.first,
    ),
    node.name ?? 'style',
  );
  final fill = node.fills?.first;
  final fillColorName = fill == null ||
          fill.type != figma.PaintType.solid ||
          fill.color == null
      ? null
      : context.theme.colors.create(
          convertColor(fill.color!, fill.opacity ?? 1.0), node.name ?? 'text');

  BlobNode result = ConstructorCall(
    'ColoredText',
    {
      'text': StateReference(['data', 'text', text]),
      'textAlign': textAlign,
      if (fill?.type == figma.PaintType.solid && fillColorName != null)
        'color': StateReference(['theme', 'color', fillColorName]),
      if (node.style != null)
        'style': StateReference(['theme', 'textStyles', styleName]),
    },
  );

  result = wrapOpacity(result, node.opacity);
  result = wrapTransform(result, node.relativeTransform);

  return result;
}
