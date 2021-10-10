import 'package:flutter/material.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma/src/helpers/deep_copy.dart';
import 'package:flutter_figma/src/rfw/widgets.dart';
import 'package:rfw/rfw.dart' as rfw;
import 'package:rfw/rfw.dart';
import 'package:collection/collection.dart';

import 'remote.dart';

enum DynamicRenderingMode {
  /// Uses local implementation as soon as distant version is lower than or equal to local version.
  auto,
  local,
  remote,
}

abstract class RemoteWidget extends StatelessWidget {
  const RemoteWidget({
    Key? key,
    this.renderingMode = DynamicRenderingMode.auto,
  }) : super(key: key);

  String get remoteIdentifier;
  String get remoteWidgetName;
  int get version;
  final DynamicRenderingMode renderingMode;

  /// Translate local properties, to a remote state.
  @protected
  DynamicMap get remoteData => {};

  @protected
  void onRemoteEvent(String name, DynamicMap arguments) {}

  @protected
  Widget buildLocal(BuildContext context);

  @protected
  Widget renderComponent(
    Widget Function() render,
    String name,
    Map<String, String> variants,
    String instanceName,
  ) =>
      render();

  @override
  Widget build(BuildContext context) {
    if (renderingMode == DynamicRenderingMode.local) {
      return buildLocal(context);
    }

    final distantVersion = InheritedRemote.versionOf(context, remoteIdentifier);
    if (distantVersion == null || distantVersion <= version) {
      return buildLocal(context);
    }

    return RemoteWidgetPreview(
      remoteIdentifier: remoteIdentifier,
      remoteWidgetName: remoteWidgetName,
      data: remoteData,
      renderer: renderComponent,
      onRemoteEvent: onRemoteEvent,
      fallbackBuilder: buildLocal,
    );
  }
}

class RemoteWidgetPreview extends StatefulWidget {
  const RemoteWidgetPreview({
    Key? key,
    required this.remoteIdentifier,
    required this.remoteWidgetName,
    required this.data,
    required this.fallbackBuilder,
    this.onRemoteEvent,
    this.renderer,
  }) : super(key: key);

  final String remoteIdentifier;
  final String remoteWidgetName;
  final Map<String, Object?> data;
  final WidgetBuilder fallbackBuilder;
  final RemoteEventHandler? onRemoteEvent;
  final InstanceRenderer? renderer;

  @override
  _RemoteState createState() => _RemoteState();
}

class _RemoteState extends State<RemoteWidgetPreview> {
  static const libName = LibraryName(['main']);
  late final DynamicContent data = DynamicContent(widget.data);
  Runtime? runtime;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var library = InheritedRemote.libraryOf(
      context,
      widget.remoteIdentifier,
    );
    if (library != null) {
      final declaration =
          library.widgets.firstWhere((x) => x.name == widget.remoteWidgetName);

      final updatedStateDeclaration = WidgetDeclaration(
        declaration.name,
        resolveStateReferences(
          deepMergeMap(
                declaration.initialState ?? const <String, dynamic>{},
                {
                  'data': widget.data,
                },
              ) ??
              const <String, dynamic>{},
        ),
        declaration.root,
      );
      library = RemoteWidgetLibrary(library.imports, [
        ...library.widgets.where((x) => x.name != widget.remoteWidgetName),
        updatedStateDeclaration,
      ]);
      final runtime = Runtime();
      runtime.update(
        const LibraryName(<String>['core', 'widgets']),
        createCoreWidgets(),
      );
      runtime.update(
        const LibraryName(<String>['flutter_figma']),
        createFlutterFigmaWidgets(
          widget.renderer ?? (render, name, variants, instanceName) => render(),
        ),
      );
      runtime.update(libName, library);
      this.runtime = runtime;
    }
  }

  @override
  void didUpdateWidget(covariant RemoteWidgetPreview oldWidget) {
    if (!const MapEquality().equals(widget.data, oldWidget.data)) {
      data.updateAll({
        'data': widget.data,
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (runtime != null) {
        return rfw.RemoteWidget(
          runtime: runtime!,
          data: data,
          widget: FullyQualifiedWidgetName(
            libName,
            widget.remoteWidgetName,
          ),
          onEvent: widget.onRemoteEvent,
        );
      }

      return widget.fallbackBuilder(context);
    } catch (e) {
      return widget.fallbackBuilder(context);
    }
  }
}

Map<String, Object?> resolveStateReferences(Map<String, dynamic> state) {
  return _resolveStateReferences(state, state);
}

Map<String, Object?> _resolveStateReferences(
  Map<String, dynamic> state,
  Map<String, dynamic> node,
) {
  final result = <String, Object?>{};
  for (var entry in node.entries) {
    final value = entry.value;
    if (value is StateReference) {
      result[entry.key] = _resolveReference(state, value.parts);
    } else if (value is Map<String, dynamic>) {
      result[entry.key] = _resolveStateReferences(state, value);
    } else {
      result[entry.key] = entry.value;
    }
  }

  return result;
}

dynamic _resolveReference(Map<String, dynamic> state, List<Object> path) {
  final res = state[path.first];

  if (path.length == 1) {
    return res;
  }
  if (res is Map<String, dynamic>) {
    return _resolveReference(
      res,
      path.skip(1).toList(),
    );
  }

  return null;
}