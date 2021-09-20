import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/arguments/text_style.dart';
import 'package:figma_remote/src/converters/helpers/opacity.dart';
import 'package:rfw/formats.dart';

BlobNode convert(figma.Text node) {
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

  BlobNode result = ConstructorCall(
    'Text',
    {
      'text': '${node.characters}',
      'textAlign': textAlign,
      if (node.style != null)
        'style': convertTextStyle(node.style!, node.fills?.first),
    },
  );

  result = wrapOpacity(result, node.opacity);

  return result;
}
