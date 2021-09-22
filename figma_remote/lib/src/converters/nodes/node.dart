import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/context/context.dart';
import 'package:rfw/formats.dart';
import 'package:figma_remote/src/helpers/api_extensions.dart';

import 'text.dart' as text;
import 'rectangle.dart' as rectangle;
import 'vector.dart' as vector;
import 'frame.dart' as frame;
import 'instance.dart' as instance;

BlobNode? convertNode(FigmaComponentContext context, figma.Node node) {
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
      return frame.convert(context, node);
    }
  }
  return null;
}
