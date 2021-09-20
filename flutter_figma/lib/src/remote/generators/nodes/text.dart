import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/remote/generators/helpers/opacity.dart';
import 'package:rfw/formats.dart';

BlobNode convert(figma.Text node) {
  BlobNode result = ConstructorCall(
    'Text',
    {
      'text': '${node.characters}',
    },
  );

  result = wrapOpacity(result, node.opacity);

  return result;
}
