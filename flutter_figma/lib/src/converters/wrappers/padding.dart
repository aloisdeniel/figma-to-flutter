import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:rfw/formats.dart';

BlobNode wrapPadding(
  FigmaComponentContext context,
  String name,
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

  final leftName = context.theme.spacing.create(left, name);
  final topName = context.theme.spacing.create(top, name);
  final rightName = context.theme.spacing.create(right, name);
  final bottomName = context.theme.spacing.create(bottom, name);

  return ConstructorCall(
    'Padding',
    {
      'padding': [
        leftName,
        topName,
        rightName,
        bottomName,
      ].map((e) => StateReference(['theme', 'spacing', e])).toList(),
      'child': child,
    },
  );
}
