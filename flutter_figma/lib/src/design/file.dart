import 'package:figma/figma.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';

import 'storage.dart';

enum FigmaDesignCacheMode {
  never,
  useCacheAlwaysWhenAvailable,
  useCacheRefreshFailed,
}

class FigmaDesignFile extends StatefulWidget {
  final String fileId;
  final Widget child;
  final FigmaDesignCacheMode cacheMode;
  final FigmaDesignStorage cacheStorage;

  const FigmaDesignFile({
    required this.fileId,
    required this.child,
    this.cacheMode = FigmaDesignCacheMode.never,
    this.cacheStorage = const FileFigmaDesignStorage(),
  });

  static void refresh(BuildContext context) {
    final designState = context.findAncestorStateOfType<_FigmaDesignState>();
    designState?.refresh();
  }

  static FileResponse? file(BuildContext context) {
    final designState =
        context.dependOnInheritedWidgetOfExactType<_InheritedDesignFile>();
    return designState!.file;
  }

  @override
  _FigmaDesignState createState() => _FigmaDesignState();
}

class _FigmaDesignState extends State<FigmaDesignFile> {
  FileResponse? file;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _init();
    });

    super.initState();
  }

  Future<void> _init() async {
    /// Always starting by loading the local cache if
    /// enabled.
    if (widget.cacheMode != FigmaDesignCacheMode.never) {
      try {
        if (await widget.cacheStorage.exists(widget.fileId)) {
          final json = await widget.cacheStorage.load(widget.fileId);
          setState(() {
            file = json == null ? null : FileResponse.fromJson(json);
          });
        }
      } catch (e) {
        print('[flutter_figma] Failed to load cached file ${widget.fileId}');
      }
    }

    if (widget.cacheMode != FigmaDesignCacheMode.useCacheAlwaysWhenAvailable ||
        file == null) {
      try {
        final json = await refresh();

        if (widget.cacheMode != FigmaDesignCacheMode.never) {
          await widget.cacheStorage.save(widget.fileId, json);
        }
      } catch (e) {
        if (file != null) {
          print(
              '[flutter_figma] Loading from file failed but using the cached file ${widget.fileId}');
          print('[flutter_figma] Error: $e');
        } else {
          rethrow;
        }
      }
    }
  }

  Future<Map<String, dynamic>?> refresh() async {
    final figma = FlutterFigma.of(context);
    if (figma != null) {
      final uri = Uri.https(
        base,
        '${figma.api.apiVersion}/files/${widget.fileId}',
        FigmaQuery(geometry: 'paths').params,
      );
      final json = await figma.api.authenticatedGet(uri.toString());

      setState(() {
        file = FileResponse.fromJson(json);
      });
      return json;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedDesignFile(
      file: file,
      child: widget.child,
    );
  }
}

class _InheritedDesignFile extends InheritedWidget {
  final FileResponse? file;
  _InheritedDesignFile({
    Key? key,
    required this.file,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(_InheritedDesignFile oldWidget) {
    return oldWidget.file != file;
  }
}
