import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:rfw/formats.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';

import 'text.dart' as text;
import 'rectangle.dart' as rectangle;
import 'vector.dart' as vector;
import 'frame.dart' as frame;
import 'instance.dart' as instance;

BlobNode? convertNode(
    FigmaComponentContext context, figma.Node node, bool isRoot) {
  node = node.removeGroups();
  if (node.visible) {
    if (node is figma.Text) {
      return text.convert(context, node);
    }
    if (node is figma.Rectangle) {
      return rectangle.convert(context, node);
    }
    if (node is figma.Vector) {
      return vector.convert(context, node);
    }
    if (node is figma.Instance) {
      return instance.convert(context, node);
    }
    if (node is figma.Frame) {
      return frame.convert(context, node, isRoot);
    }
    if (node is figma.Document) {
      final child = node.children?.first;
      return convertNode(context, child!, isRoot);
    }
    if (node is figma.Canvas) {
      final child = node.children?.first;
      return convertNode(context, child!, isRoot);
    }
  }
  return null;
}
