import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/context/context.dart';
import 'package:figma_remote/src/converters/helpers/blurred.dart';
import 'package:figma_remote/src/converters/helpers/decorated.dart';
import 'package:figma_remote/src/converters/helpers/expanded.dart';
import 'package:figma_remote/src/converters/helpers/opacity.dart';
import 'package:figma_remote/src/converters/helpers/padding.dart';
import 'package:figma_remote/src/helpers/api_extensions.dart';
import 'package:rfw/formats.dart';
import 'package:collection/collection.dart';

import 'node.dart';

part 'frame.absolute.dart';
part 'frame.auto.dart';

BlobNode convert(FigmaComponentContext context, figma.Frame node) {
  var result = () {
    switch (node.layoutMode) {
      case figma.LayoutMode.vertical:
      case figma.LayoutMode.horizontal:
        return _autoLayout(context, node);
      default:
        return _absoluteLayout(context, node);
    }
  }();

  result = wrapBackgroundBlurred(
    result,
    node.effects,
    node.rectangleCornerRadii,
    0.0, //TODO
  );

  result = wrapDecorated(
    context,
    node.name ?? 'frame',
    node.fills,
    node.strokes,
    node.cornerRadius,
    node.rectangleCornerRadii,
    0.0, //TODO
    node.strokeWeight,
    node.strokeAlign,
    result,
  )!;

  result = wrapOpacity(result, node.opacity);

  return result;
}

typedef ChildModifier = BlobNode Function(figma.Node node, BlobNode result);

List<BlobNode> _children(
    FigmaComponentContext context, List<figma.Node?> children,
    [ChildModifier? modifier]) {
  return [
    ...children.whereNotNull().map(
      (x) {
        final blob = convertNode(context, x);
        return modifier != null && blob != null ? modifier(x, blob) : blob;
      },
    ).whereNotNull()
  ];
}
