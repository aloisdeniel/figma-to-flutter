import 'package:rfw/formats.dart';

BlobNode wrapPadding(
  BlobNode child,
  num? left,
  num? top,
  num? right,
  num? bottom,
) {
  left ??= 0;
  top ??= left;
  right ??= left;
  bottom ??= top;
  if (left == 0 && top == 0 && right == 0 && bottom == 0) {
    return child;
  }

  return ConstructorCall(
    'Padding',
    {
      'padding': [
        left,
        top,
        right,
        bottom,
      ],
      'child': child,
    },
  );
}
