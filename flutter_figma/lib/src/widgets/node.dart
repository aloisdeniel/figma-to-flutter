import 'package:figma/figma.dart' as figma;
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/widgets/layouts/constrained_layout.dart';
import 'package:flutter_figma/src/widgets/rectangle.dart';
import 'package:flutter_figma/src/widgets/vector.dart';
import 'package:flutter_figma/widgets.dart';

import '../helpers/api_extensions.dart';
import 'layouts/auto_layout.dart';

class FigmaNode extends StatelessWidget {
  final figma.Node node;
  const FigmaNode({
    Key key,
    @required this.node,
  }) : super(key: key);

  List<Widget> _children(figma.LayoutMode mode, List<figma.Node> children) {
    switch (mode) {
      case figma.LayoutMode.vertical:
      case figma.LayoutMode.horizontal:
        return _autoChildren(mode, children);
      default:
        return _constrainedChildren(children);
    }
  }

  List<Widget> _autoChildren(figma.LayoutMode mode, List<figma.Node> children) {
    return children.map(
      (node) {
        final child = FigmaNode(
          node: node,
        );
        if (node is figma.Text) {
          return FigmaAuto(
            isMainAxisFixed: false,
            isCrossAxisFixed: false,
            designSize: Size(node.size.x, node.size.y),
            layoutAlign: node.layoutAlign,
            child: child,
          );
        }
        if (node is figma.Vector) {
          return FigmaAuto(
            isMainAxisFixed: true,
            isCrossAxisFixed: true,
            designSize: Size(node.size.x, node.size.y),
            layoutAlign: node.layoutAlign,
            child: child,
          );
        }
        if (node is figma.Frame) {
          return FigmaAuto(
            isCrossAxisFixed: node.layoutMode == node.layoutMode &&
                node.counterAxisSizingMode == figma.CounterAxisSizingMode.fixed,
            isMainAxisFixed: node.layoutMode != mode,
            designSize: Size(node.size.x, node.size.y),
            layoutAlign: node.layoutAlign,
            child: child,
          );
        }
        return child;
      },
    ).toList();
  }

  List<Widget> _constrainedChildren(List<figma.Node> children) {
    return children.map(
      (node) {
        final child = FigmaNode(
          node: node,
        );

        if (node is figma.Text) {
          return FigmaConstrained(
            designPosition: node.relativeTransform.position,
            designSize: Size(node.size.x, node.size.y),
            constraints: node.constraints,
            child: child,
          );
        }
        if (node is figma.Vector) {
          return FigmaConstrained(
            designPosition: node.relativeTransform.position,
            designSize: Size(node.size.x, node.size.y),
            constraints: node.constraints,
            child: child,
          );
        }
        if (node is figma.Frame) {
          return FigmaConstrained(
            designPosition: node.relativeTransform.position,
            designSize: Size(node.size.x, node.size.y),
            constraints: node.constraints,
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
    if (node is figma.Text) {
      return FigmaText(
        node: node,
      );
    }
    if (node is figma.Rectangle) {
      return FigmaRectangle(
        node: node,
      );
    }
    if (node is figma.Frame) {
      return FigmaFrame(
        node: node,
        children: _children(node.layoutMode, node.children),
      );
    }
    if (node is figma.Vector) {
      return FigmaVector(
        node: node,
      );
    }
    throw Exception('Unsupported figma node : ${node}');
  }
}
