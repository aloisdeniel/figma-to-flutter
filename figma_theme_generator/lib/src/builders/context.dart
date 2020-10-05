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
  final DataClassBuilder shadows;
  final DataClassBuilder borders;
  final DataClassBuilder radius;
  FileBuildContext({
    @required this.name,
    @required this.response,
    @required this.library,
    @required String fallbackConstructorName,
    String colorThemeClassName,
    String textThemeClassName,
    String gradientsThemeClassName,
    String shadowsThemeClassName,
    String bordersThemeClassName,
    String radiusThemeClassName,
  })  : this.colors = DataClassBuilder(
          name: colorThemeClassName ?? '${name}ColorsData',
          fallbackConstructorName: fallbackConstructorName,
        ),
        this.text = DataClassBuilder(
          name: textThemeClassName ?? '${name}TextData',
          fallbackConstructorName: fallbackConstructorName,
        ),
        this.gradients = DataClassBuilder(
          name: gradientsThemeClassName ?? '${name}GradientsData',
          fallbackConstructorName: fallbackConstructorName,
        ),
        this.shadows = DataClassBuilder(
          name: shadowsThemeClassName ?? '${name}ShadowsData',
          fallbackConstructorName: fallbackConstructorName,
        ),
        this.borders = DataClassBuilder(
          name: bordersThemeClassName ?? '${name}BordersData',
          fallbackConstructorName: fallbackConstructorName,
        ),
        this.radius = DataClassBuilder(
          name: radiusThemeClassName ?? '${name}RadiiData',
          fallbackConstructorName: fallbackConstructorName,
        );

  List<NodeStyle> findNodeWithStyle(String id) {
    return _findNodeWithStyle(response.document, id);
  }

  List<NodeStyle> _findNodeWithStyle(Node node, String id) {
    if (node is Vector) {
      if (node.styles != null) {
        return node.styles.entries
            .where(
              (x) => x.value == id,
            )
            .map((e) => NodeStyle(node, e.key))
            .toList();
      }
    } else if (node is Canvas) {
      for (var child in node.children) {
        final result = _findNodeWithStyle(child, id);
        if (result.isNotEmpty) return result;
      }
    } else if (node is Document) {
      for (var child in node.children) {
        final result = _findNodeWithStyle(child, id);
        if (result.isNotEmpty) return result;
      }
    } else if (node is Frame) {
      for (var child in node.children) {
        final result = _findNodeWithStyle(child, id);
        if (result.isNotEmpty) return result;
      }
    }
    return const <NodeStyle>[];
  }
}
