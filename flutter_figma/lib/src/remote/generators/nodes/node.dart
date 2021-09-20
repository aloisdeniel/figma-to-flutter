import 'package:figma/figma.dart' as figma;
import 'package:rfw/formats.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';

import 'text.dart' as text;

BlobNode convertNode(figma.Node node) {
  node = node.removeGroups();
  if (!(node.visible)) {
    return const ConstructorCall(
      'SizedBox',
      {},
    );
  }

  if (node is figma.Text) {
    return text.convert(node);
  }
  if (node is figma.Rectangle) {
    return FigmaRectangle.api(
      node,
      package: package,
    );
  }
  if (node is figma.Frame) {
    return FigmaFrame.api(
      node,
      package: package,
    );
  }
  if (node is figma.Vector) {
    return FigmaVector.api(
      node,
      package: package,
    );
  }
}

BlobNode _text() {}
