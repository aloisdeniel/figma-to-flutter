import 'package:rfw/rfw.dart';

abstract class LibraryClient {
  const LibraryClient();
  Future<List<Library>> getLibraries();
  Future<List<LibraryComponent>> getComponents(Library library);
  Future<RemoteWidgetLibrary?> getLibrary(
    Library library, {
    List<String>? componentsId,
  });
}

class Library {
  const Library(
    this.identifier,
    this.version,
  );
  final String identifier;
  final int version;
}

class LibraryComponent {
  const LibraryComponent(
    this.id,
    this.name, {
    this.children = const <LibraryComponent>[],
  });
  final String id;
  final String name;
  final List<LibraryComponent> children;
}
