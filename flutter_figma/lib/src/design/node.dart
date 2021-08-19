import 'package:flutter/material.dart';
import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/helpers/api_extensions.dart';
import 'package:flutter_figma/widgets.dart';

import 'design.dart';

class FigmaNode extends StatelessWidget {
  final figma.Node node;
  final String? package;
  const FigmaNode({
    Key? key,
    required this.node,
    this.package,
  }) : super(key: key);

  /// Converts the list of [children] nodes to a list of widgets.
  ///
  /// Each widget has a [FigmaConstrained] wrapper when [mode] is `none` or a
  /// [FigmaAuto] wrapper when [mode] is horizontal or vertical auto layout.
  static List<Widget> children(
      figma.LayoutMode mode, List<figma.Node> children, String? package) {
    children = children.where((x) => x.visible).toList();
    switch (mode) {
      case figma.LayoutMode.vertical:
      case figma.LayoutMode.horizontal:
        return _autoChildren(mode, children, package);
      default:
        return _constrainedChildren(children, package);
    }
  }

  static List<Widget> _autoChildren(
      figma.LayoutMode mode, List<figma.Node> children, String? package) {
    return children.map(
      (node) {
        final child = _FigmaCustomNode(
          node: node,
          package: package,
        );
        if (node is figma.Text) {
          return FigmaAuto(
            isMainAxisFixed: false,
            isCrossAxisFixed: false,
            designSize: node.size.toSize(),
            layoutAlign: node.layoutAlign ?? _kDefaultLayoutAlign,
            child: child,
          );
        }
        if (node is figma.Vector) {
          return FigmaAuto(
            isMainAxisFixed: true,
            isCrossAxisFixed: true,
            designSize: node.size.toSize(),
            layoutAlign: node.layoutAlign ?? _kDefaultLayoutAlign,
            child: child,
          );
        }
        if (node is figma.Frame) {
          return FigmaAuto(
            isCrossAxisFixed: node.layoutMode == node.layoutMode &&
                node.counterAxisSizingMode == figma.CounterAxisSizingMode.fixed,
            isMainAxisFixed: node.layoutMode != mode,
            designSize: node.size.toSize(),
            layoutAlign: node.layoutAlign ?? _kDefaultLayoutAlign,
            child: child,
          );
        }
        return child;
      },
    ).toList();
  }

  static const figma.LayoutAlign _kDefaultLayoutAlign = figma.LayoutAlign.min;

  static figma.LayoutConstraint _kDefaultLayoutConstraints =
      figma.LayoutConstraint(
    horizontal: figma.HorizontalConstraint.left,
    vertical: figma.VerticalConstraint.top,
  );

  static List<Widget> _constrainedChildren(
      List<figma.Node> children, String? package) {
    return children.map(
      (node) {
        final child = _FigmaCustomNode(
          node: node,
          package: package,
        );

        if (node is figma.Text) {
          return FigmaConstrained(
            designPosition: node.relativeTransform.position,
            designSize: node.size.toSize(),
            constraints: node.constraints ?? _kDefaultLayoutConstraints,
            child: child,
          );
        }
        if (node is figma.Vector) {
          return FigmaConstrained(
            designPosition: node.relativeTransform.position,
            designSize: node.size.toSize(),
            constraints: node.constraints ?? _kDefaultLayoutConstraints,
            child: child,
          );
        }
        if (node is figma.Frame) {
          return FigmaConstrained(
            designPosition: node.relativeTransform.position,
            designSize: node.size.toSize(),
            constraints: node.constraints ?? _kDefaultLayoutConstraints,
            child: child,
          );
        }
        return child;
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final node = this.node;
    if (!(node.visible)) {
      return SizedBox();
    }
    if (node is figma.Text) {
      return FigmaText.api(node, package: package);
    }
    if (node is figma.Rectangle) {
      return FigmaRectangle.api(node, package: package);
    }
    if (node is figma.Frame) {
      return FigmaFrame.api(node, package: package);
    }
    if (node is figma.Vector) {
      return FigmaVector.api(node, package: package);
    }
    throw Exception('Unsupported figma node : ${node}');
  }
}

class _FigmaCustomNode extends StatelessWidget {
  final figma.Node node;
  final String? package;
  const _FigmaCustomNode({
    Key? key,
    required this.node,
    this.package,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final node = this.node;
    final builder = FigmaDesignNode.builderOf(context);
    final result = builder != null ? builder.call(context, node) : null;
    if (result != null) {
      return result;
    }
    return FigmaNode(
      node: node,
    );
  }
}

typedef FigmaNodeBuilder = Widget Function(
    BuildContext context, figma.Node node);

typedef FigmaNodePreprocessor = figma.Node Function(figma.Node node);

class FigmaDesignNode extends StatelessWidget {
  final String? id;
  final String? componentName;
  final FigmaNodeBuilder? builder;
  final FigmaNodePreprocessor? preprocessor;
  final String? package;
  const FigmaDesignNode.component({
    required String name,
    this.builder,
    this.package,
    this.preprocessor,
  })  : id = null,
        componentName = name;

  const FigmaDesignNode.node({
    required String id,
    this.package,
    this.builder,
    this.preprocessor,
  })  : id = id,
        componentName = null;

  static FigmaNodeBuilder? builderOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_FigmaNodeBuilderProvider>()!
        .builder;
  }

  @override
  Widget build(BuildContext context) {
    final file = FigmaDesignFile.file(context);
    if (file == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    var node = componentName != null
        ? file.findComponentWithName(componentName!)
        : file.document?.findNodeWithId(id!);

    if (node == null) {
      throw Exception(
        componentName != null
            ? 'Figma component with name ${componentName} not found in file ${file.name}'
            : 'Figma node with id ${id} not found in file ${file.name}',
      );
    }

    if (preprocessor != null) {
      node = preprocessor!(node);
    }

    return _FigmaNodeBuilderProvider(
      builder: builder,
      child: _FigmaCustomNode(
        node: node,
        package: package,
      ),
    );
  }
}

class _FigmaNodeBuilderProvider extends InheritedWidget {
  final FigmaNodeBuilder? builder;
  const _FigmaNodeBuilderProvider({
    Key? key,
    required this.builder,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant _FigmaNodeBuilderProvider oldWidget) {
    return builder != oldWidget.builder;
  }
}
