import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:rfw/dart/model.dart';

import 'services/client.dart';

class Remote extends StatefulWidget {
  const Remote({
    Key? key,
    required this.client,
    required this.child,
  }) : super(key: key);

  final LibraryClient client;
  final Widget child;

  @override
  State<Remote> createState() => _RemoteState();
}

class _RemoteState extends State<Remote> {
  Map<String, RemoteWidgetLibrary>? libraries;
  Map<String, int>? versions;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    final index = await widget.client.getLibraries();
    setState(() {
      versions =
          Map.fromEntries(index.map((e) => MapEntry(e.identifier, e.version)));
    });

    await Future.wait([
      for (var lib in index)
        widget.client.getLibrary(lib).then((value) {
          if (value != null) {
            setState(() {
              libraries = {
                if (libraries != null) ...libraries!,
                lib.identifier: value,
              };
            });
          }
        })
    ]);
  }

  @override
  Widget build(BuildContext context) {
    if (versions == null || libraries == null) {
      return widget.child;
    }
    return InheritedRemote(
      versions: versions!,
      libraries: libraries!,
      child: widget.child,
    );
  }
}

class InheritedRemote extends InheritedWidget {
  const InheritedRemote({
    Key? key,
    required Widget child,
    required this.libraries,
    required this.versions,
  }) : super(
          key: key,
          child: child,
        );
  final Map<String, RemoteWidgetLibrary> libraries;
  final Map<String, int> versions;

  static RemoteWidgetLibrary? libraryOf(
      BuildContext context, String identifier) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<InheritedRemote>();
    return inherited?.libraries[identifier];
  }

  static int? versionOf(BuildContext context, String identifier) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedRemote>()
        ?.versions[identifier];
  }

  @override
  bool updateShouldNotify(covariant InheritedRemote oldWidget) {
    return !const MapEquality().equals(libraries, oldWidget.libraries) ||
        !const MapEquality().equals(versions, oldWidget.versions);
  }
}
