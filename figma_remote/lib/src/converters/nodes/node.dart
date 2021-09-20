import 'package:figma/figma.dart' as figma;
import 'package:rfw/formats.dart';
import 'package:figma_remote/src/helpers/api_extensions.dart';

import 'text.dart' as text;
import 'rectangle.dart' as rectangle;
import 'frame.dart' as frame;

BlobNode? convertNode(figma.Node node) {
  node = node.removeGroups();
  if (node.visible) {
    if (node is figma.Text) {
      return text.convert(node);
    }
    if (node is figma.Rectangle) {
      return rectangle.convert(node);
    }
    if (node is figma.Frame) {
      return frame.convert(node);
    }
  }
  return null;
}
