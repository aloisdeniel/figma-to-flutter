import 'package:rfw/formats.dart';

BlobNode wrapExpanded(BlobNode node, double? layoutGrow) {
  if (layoutGrow == null || layoutGrow < 1) {
    return node;
  }

  return ConstructorCall(
    'Expanded',
    {
      if (layoutGrow > 1) 'flex': layoutGrow,
      'child': node,
    },
  );
}
