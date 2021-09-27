import 'dart:io';
import 'dart:math';

import 'package:rfw/rfw.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart' as path;

import 'client.dart';

class StorageClient extends LibraryClient {
  StorageClient({
    required this.directory,
  });

  final Directory directory;

  Future<void>? _initialized;

  final Map<String, int> _versions = {};

  Future<void> _initialize() async {
    var dir = directory;
    if (!directory.existsSync()) {
      await directory.create();
    }

    // Read last versions of libs
    await for (var item in dir.list()) {
      if (item is Directory) {
        final lastVersion = await _lastVersionInDir(item);
        if (lastVersion != null) {
          _versions[path.basename(item.path)] = lastVersion;
        }
      }
    }
  }

  Future<Directory> libraryDirectory(String identifier) async {
    _initialized ??= _initialize();
    await _initialized!;
    var dir = Directory(
      path.joinAll([
        directory.path,
        identifier,
      ]),
    );
    if (!dir.existsSync()) {
      dir = await dir.create();
    }
    return dir;
  }

  Future<void> saveLibrary(
    String identifier,
    int version,
    RemoteWidgetLibrary library,
  ) async {
    // Update local version in memory
    final previousVersion = _versions[identifier];
    _versions[identifier] =
        previousVersion != null ? max(previousVersion, version) : version;

    final dir = await libraryDirectory(identifier);
    final filePath = path.joinAll([
      dir.path,
      '$version.lib',
    ]);

    final file = File(filePath);
    final bytes = encodeLibraryBlob(library);
    await file.writeAsBytes(bytes);
  }

  @override
  Future<RemoteWidgetLibrary> getLibrary(Library library) async {
    final dir = await libraryDirectory(library.identifier);
    final filePath = path.joinAll([
      dir.path,
      '${library.version}.lib',
    ]);
    final file = File(filePath);
    final bytes = await file.readAsBytes();
    return decodeLibraryBlob(bytes);
  }

  Future<int?> _lastVersionInDir(Directory dir) async {
    final files = await dir.list().toList();
    if (files.isEmpty) {
      return null;
    }
    final versions = files
        .map((x) => int.tryParse(path.basenameWithoutExtension(x.path)))
        .whereNotNull();
    if (versions.isEmpty) {
      return null;
    }
    return versions
        .skip(1)
        .fold<int>(versions.first, (last, v) => max(last, v));
  }

  @override
  Future<List<Library>> getLibraries() {
    return Future.value(
        _versions.entries.map((e) => Library(e.key, e.value)).toList());
  }
}
