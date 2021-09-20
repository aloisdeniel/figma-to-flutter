import 'package:figma_remote/src/converters/library/library.dart';
import 'package:figma_remote/src/rfw_addons/widgets.dart';
import 'package:figma_remote/src/widgets/remote.dart';
import 'package:flutter/widgets.dart';
import 'package:rfw/rfw.dart';

class RemoteFigmaComponent extends StatefulWidget {
  const RemoteFigmaComponent({
    Key? key,
    required this.componentName,
  }) : super(key: key);

  final String componentName;

  @override
  _RemoteFigmaComponentState createState() => _RemoteFigmaComponentState();
}

class _RemoteFigmaComponentState extends State<RemoteFigmaComponent> {
  final Runtime _runtime = Runtime();
  final DynamicContent _data = DynamicContent();
  late Future<void> future;

  @override
  void initState() {
    super.initState();
    _runtime.update(
      const LibraryName(<String>['core', 'widgets']),
      createCoreWidgets(),
    );
    _runtime.update(
      const LibraryName(<String>['addons', 'widgets']),
      createCoreAddonsWidgets(),
    );
  }

  @override
  void didChangeDependencies() {
    reloadFigmaLibrary();
    super.didChangeDependencies();
  }

  void reloadFigmaLibrary() {
    final file = RemoteFigma.fileOf(context);
    final figmaLibrary = buildFigmaLibrary(
      file: file!,
    );
    _runtime.update(
      const LibraryName(<String>['figma']),
      figmaLibrary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RemoteWidget(
      runtime: _runtime,
      data: _data,
      widget: FullyQualifiedWidgetName(
        const LibraryName(<String>['figma']),
        widget.componentName,
      ),
      onEvent: (String name, DynamicMap arguments) {
        debugPrint('user triggered event "$name" with data: $arguments');
      },
    );
  }
}
