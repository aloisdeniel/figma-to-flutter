import 'package:figma/figma.dart' as figma;
import 'package:rfw/formats.dart';

BlobNode wrapOpacity(BlobNode node, double? opacity) {
  if (opacity == null || opacity == 1.0) {
    return node;
  }

  return ConstructorCall(
    'Opacity',
    {
      'opacity': opacity,
      'child': node,
    },
  );
}
