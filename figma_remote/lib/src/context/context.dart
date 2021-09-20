import 'package:figma/figma.dart';

class NodeStyle {
  final StyleTypeKey type;
  final Node node;
  const NodeStyle(
    this.node,
    this.type,
  );
}

class FigmaContext {
  final FileResponse response;
  FigmaContext({
    required this.response,
  });

  List<NodeStyle> findNodeWithStyle(String id) {
    if (response.document == null) return const <NodeStyle>[];
    return _findNodeWithStyle(response.document!, id);
  }

  List<NodeStyle> _findNodeWithStyle(Node node, String id) {
    if (node is Vector) {
      if (node.styles != null) {
        return (node.styles ?? const <StyleTypeKey, String>{})
            .entries
            .where(
              (x) => x.value == id,
            )
            .map((e) => NodeStyle(node, e.key))
            .toList();
      }
    } else if (node is Canvas && node.children != null) {
      for (var child in node.children!) {
        if (child != null) {
          final result = _findNodeWithStyle(child, id);
          if (result.isNotEmpty) return result;
        }
      }
    } else if (node is Document && node.children != null) {
      for (var child in node.children!) {
        if (child != null) {
          final result = _findNodeWithStyle(child, id);
          if (result.isNotEmpty) return result;
        }
      }
    } else if (node is Frame && node.children != null) {
      for (var child in node.children!) {
        if (child != null) {
          final result = _findNodeWithStyle(child, id);
          if (result.isNotEmpty) return result;
        }
      }
    }
    return const <NodeStyle>[];
  }
}
