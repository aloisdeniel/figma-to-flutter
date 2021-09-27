import 'package:rfw/rfw.dart';

abstract class LibraryClient {
  const LibraryClient();
  Future<List<Library>> getLibraries();
  Future<RemoteWidgetLibrary?> getLibrary(Library library);
}

class Library {
  const Library(
    this.identifier,
    this.version,
  );
  final String identifier;
  final int version;
}
