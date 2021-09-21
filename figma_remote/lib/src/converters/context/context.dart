import 'package:figma/figma.dart';

import 'data.dart';
import 'theme.dart';

class NodeStyle {
  final StyleTypeKey type;
  final Node node;
  const NodeStyle(
    this.node,
    this.type,
  );
}

class FigmaComponentContext {
  FigmaComponentContext({
    required this.response,
  }) {
    theme = FigmaComponentTheme(this);
    data = FigmaComponentData(this);
  }

  final FileResponse response;
  late final FigmaComponentTheme theme;
  late final FigmaComponentData data;

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
