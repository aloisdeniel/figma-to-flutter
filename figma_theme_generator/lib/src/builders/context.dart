import 'package:code_builder/code_builder.dart';
import 'package:figma/figma.dart';
import 'package:figma_theme_generator/src/helpers/data_class_builder.dart';
import 'package:meta/meta.dart';

class NodeStyle {
  final StyleTypeKey type;
  final Node node;
  const NodeStyle(
    this.node,
    this.type,
  );
}

class FileBuildContext {
  final String name;
  final LibraryBuilder library;
  final FileResponse response;
  final DataClassBuilder colors;
  final DataClassBuilder text;
  final DataClassBuilder gradients;
  FileBuildContext({
    @required this.name,
    @required this.response,
    @required this.library,
    @required String fallbackConstructorName,
    String colorThemeClassName,
    String textThemeClassName,
    String gradientsThemeClassName,
  })  : this.colors = DataClassBuilder(
          name: colorThemeClassName ?? '${name}ColorThemeData',
          fallbackConstructorName: fallbackConstructorName,
        ),
        this.text = DataClassBuilder(
          name: textThemeClassName ?? '${name}TextThemeData',
          fallbackConstructorName: fallbackConstructorName,
        ),
        this.gradients = DataClassBuilder(
          name: gradientsThemeClassName ?? '${name}GradientsThemeData',
          fallbackConstructorName: fallbackConstructorName,
        );

  NodeStyle findNodeWithStyle(String id) {
    return _findNodeWithStyle(response.document, id);
  }

  NodeStyle _findNodeWithStyle(Node node, String id) {
    if (node is Vector) {
      if (node.styles != null) {
        final found = node.styles.entries.firstWhere(
          (x) => x.value == id,
          orElse: () => null,
        );
        if (found != null) {
          return NodeStyle(node, found.key);
        }
      }
    } else if (node is Canvas) {
      for (var child in node.children) {
        final result = _findNodeWithStyle(child, id);
        if (result != null) return result;
      }
    } else if (node is Document) {
      for (var child in node.children) {
        final result = _findNodeWithStyle(child, id);
        if (result != null) return result;
      }
    } else if (node is Frame) {
      for (var child in node.children) {
        final result = _findNodeWithStyle(child, id);
        if (result != null) return result;
      }
    }
    return null;
  }
}
