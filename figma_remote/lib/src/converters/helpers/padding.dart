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
