import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/converters/arguments/text_style.dart';
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:flutter_figma/src/converters/helpers/opacity.dart';
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
    convertTextStyle(node.style!, node.fills?.first),
    node.name ?? 'style',
  );

  BlobNode result = ConstructorCall(
    'Text',
    {
      'text': DataReference(['data', 'text', text]),
      'textAlign': textAlign,
      if (node.style != null)
        'style': DataReference(['theme', 'textStyles', styleName]),
    },
  );

  result = wrapOpacity(result, node.opacity);

  return result;
}
