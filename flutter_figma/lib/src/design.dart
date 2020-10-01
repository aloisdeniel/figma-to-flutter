import 'package:figma/figma.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/src/figma.dart';
import 'package:flutter_figma/src/widgets/node.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';

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

class FigmaDesignNode extends StatelessWidget {
  final String name;
  final String componentName;
  const FigmaDesignNode.component({
    @required String name,
  })  : assert(name != null),
        name = null,
        componentName = name;

  const FigmaDesignNode.node({
    @required String name,
  })  : assert(name != null),
        name = name,
        componentName = null;

  @override
  Widget build(BuildContext context) {
    final designState =
        context.dependOnInheritedWidgetOfExactType<_InheritedDesignState>();
    if (designState.file == null) return CircularProgressIndicator();
    final node = componentName != null
        ? designState.file.findComponentWithName(componentName)
        : designState.file.document.findNodeWithName(name);
    return FigmaNode(
      node: node,
    );
  }
}
