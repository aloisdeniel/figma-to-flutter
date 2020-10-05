import 'package:figma/figma.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/figma.dart';
import 'package:flutter_figma/src/figma.dart';
import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/helpers/api_extensions.dart';
import 'package:flutter_figma/widgets.dart';

class FigmaDesignFile extends StatefulWidget {
  final String fileId;
  final Widget child;

  const FigmaDesignFile({
    @required this.fileId,
    @required this.child,
  });

  static void refresh(BuildContext context) {
    final designState = context.findAncestorStateOfType<_FigmaDesignState>();
    designState.refresh();
  }

  static FileResponse file(BuildContext context) {
    final designState =
        context.dependOnInheritedWidgetOfExactType<_InheritedDesignState>();
    return designState?.file;
  }

  @override
  _FigmaDesignState createState() => _FigmaDesignState();
}

class _FigmaDesignState extends State<FigmaDesignFile> {
  FileResponse file;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      refresh();
    });

    super.initState();
  }

  Future<void> refresh() async {
    final figma = Figma.of(context);
    final newFile = await figma.api.getFile(
      widget.fileId,
      FigmaQuery(geometry: 'paths'),
    );
    setState(() {
      file = newFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedDesignState(
      file: file,
      child: widget.child,
    );
  }
}

class _InheritedDesignState extends InheritedWidget {
  final FileResponse file;
  _InheritedDesignState({
    Key key,
    @required this.file,
    @required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(_InheritedDesignState oldWidget) {
    return oldWidget.file != file;
  }
}

typedef FigmaNodeBuilder = Widget Function(BuildContext context, Node node);

class FigmaDesignNode extends StatelessWidget {
  final String id;
  final String componentName;
  final FigmaNodeBuilder builder;
  const FigmaDesignNode.component({
    @required String name,
    this.builder,
  })  : assert(name != null),
        id = null,
        componentName = name;

  const FigmaDesignNode.node({
    @required String id,
    this.builder,
  })  : assert(id != null),
        id = id,
        componentName = null;

  static FigmaNodeBuilder builderOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_FigmaNodeBuilderProvider>()
        ?.builder;
  }

  @override
  Widget build(BuildContext context) {
    final designState =
        context.dependOnInheritedWidgetOfExactType<_InheritedDesignState>();
    if (designState.file == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    final node = componentName != null
        ? designState.file.findComponentWithName(componentName)
        : designState.file.document.findNodeWithId(id);

    if (builder != null) {
      return builder(context, node);
    }
    return _FigmaNodeBuilderProvider(
      builder: builder,
      child: _FigmaCustomNode(
        node: node,
      ),
    );
  }
}

class _FigmaNodeBuilderProvider extends InheritedWidget {
  final FigmaNodeBuilder builder;
  const _FigmaNodeBuilderProvider({
    Key key,
    @required this.builder,
    Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant _FigmaNodeBuilderProvider oldWidget) {
    return builder != oldWidget.builder;
  }
}

class _FigmaCustomNode extends StatelessWidget {
  final figma.Node node;
  const _FigmaCustomNode({
    Key key,
    @required this.node,
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

class FigmaNode extends StatelessWidget {
  final figma.Node node;
  const FigmaNode({
    Key key,
    @required this.node,
  }) : super(key: key);

  /// Converts the list of [children] nodes to a list of widgets.
  ///
  /// Each widget has a [FigmaConstrained] wrapper when [mode] is `none` or a
  /// [FigmaAuto] wrapper when [mode] is horizontal or vertical auto layout.
  static List<Widget> children(
      figma.LayoutMode mode, List<figma.Node> children) {
    switch (mode) {
      case figma.LayoutMode.vertical:
      case figma.LayoutMode.horizontal:
        return _autoChildren(mode, children);
      default:
        return _constrainedChildren(children);
    }
  }

  static List<Widget> _autoChildren(
      figma.LayoutMode mode, List<figma.Node> children) {
    return children.map(
      (node) {
        final child = _FigmaCustomNode(
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

  static List<Widget> _constrainedChildren(List<figma.Node> children) {
    return children.map(
      (node) {
        final child = _FigmaCustomNode(
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
    if (node is figma.Text) {
      return FigmaText.api(node);
    }
    if (node is figma.Rectangle) {
      return FigmaRectangle.api(node);
    }
    if (node is figma.Frame) {
      return FigmaFrame.api(node);
    }
    if (node is figma.Vector) {
      return FigmaVector.api(node);
    }
    throw Exception('Unsupported figma node : ${node}');
  }
}
