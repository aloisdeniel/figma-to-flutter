import 'package:figma/figma.dart';
import 'package:flutter_figma_generator/src/code_builders/resources/resources.dart';

class GeneratorContext {
  GeneratorContext(this.document);
  final Resources resources = Resources();

  /// File document (top-level node)
  final Document document;

  List<NodeStyle> findNodeWithStyle(String id) {
    return _findNodeWithStyle(document, id);
  }

  List<NodeStyle> _findNodeWithStyle(Node node, String id) {
    if (node is Vector) {
      final styles = node.styles;
      if (styles != null) {
        return styles.entries
            .where(
              (x) => x.value == id,
            )
            .map((e) => NodeStyle(node, e.key))
            .toList();
      }
    } else if (node is Canvas) {
      final children = node.children;
      if (children != null)
        for (var child in children) {
          if (child != null) {
            final result = _findNodeWithStyle(child, id);
            if (result.isNotEmpty) return result;
          }
        }
    } else if (node is Document) {
      final children = node.children;
      if (children != null)
        for (var child in children) {
          if (child != null) {
            final result = _findNodeWithStyle(child, id);
            if (result.isNotEmpty) return result;
          }
        }
    } else if (node is Frame) {
      final children = node.children;
      if (children != null)
        for (var child in children) {
          if (child != null) {
            final result = _findNodeWithStyle(child, id);
            if (result.isNotEmpty) return result;
          }
        }
    }
    return const <NodeStyle>[];
  }
}

class NodeStyle {
  final StyleTypeKey type;
  final Node node;
  const NodeStyle(
    this.node,
    this.type,
  );
}
