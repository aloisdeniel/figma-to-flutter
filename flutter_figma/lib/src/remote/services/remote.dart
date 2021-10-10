import 'package:collection/collection.dart';
import 'package:flutter_figma/src/remote/services/storage.dart';
import 'package:rfw/rfw.dart';

import 'client.dart';

class RemoteLibraryClient extends LibraryClient {
  RemoteLibraryClient({
    required this.client,
    required this.storage,
  });

  final LibraryClient client;
  final StorageClient storage;

  Future<void> updateLibraries() async {
    final libraries = await getLibraries();
    await Future.wait([
      for (var lib in libraries) _updateLibrary(lib),
    ]);
  }

  Future<RemoteWidgetLibrary?> _updateLibrary(Library library) async {
    final libraries = await storage.getLibraries();
    final local = libraries.firstWhereOrNull(
      (x) => x.identifier == library.identifier,
    );

    if (local == null || local.version < library.version) {
      try {
        final newLibrary = await client.getLibrary(library);
        if (newLibrary != null) {
          await storage.saveLibrary(
              library.identifier, library.version, newLibrary);
        }
        return newLibrary;
      } catch (e) {
        return null;
      }
    }

    return null;
  }

  @override
  Future<RemoteWidgetLibrary?> getLibrary(
    Library library, {
    List<String>? componentsId,
  }) async {
    final lib = await _updateLibrary(library);
    return lib ?? await storage.getLibrary(library);
  }

  @override
  Future<List<Library>> getLibraries() async {
    try {
      return await client.getLibraries();
    } catch (e) {
      return await storage.getLibraries();
    }
  }

  @override
  Future<List<LibraryComponent>> getComponents(Library library) {
    throw UnimplementedError();
  }
}
