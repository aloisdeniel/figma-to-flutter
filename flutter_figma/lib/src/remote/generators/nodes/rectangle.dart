import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/remote/generators/helpers/opacity.dart';
import 'package:rfw/formats.dart';

BlobNode convert(figma.Rectangle node) {
  BlobNode result = ConstructorCall(
    'DecoratedBox',
    {},
  );

  result = wrapOpacity(result, node.opacity);

  return result;
}
