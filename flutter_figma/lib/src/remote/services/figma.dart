import 'package:flutter_figma/src/converters/library/library.dart';
import 'package:rfw/dart/model.dart';
import 'package:figma/figma.dart' as figma;

import 'client.dart';

class FigmaLibraryClient extends LibraryClient {
  FigmaLibraryClient({
    required this.token,
    required this.fileId,
  }) : _api = figma.FigmaClient(token);
  final String token;
  final String fileId;
  Future<FigmaRemoteLibrary>? _figmaUpdate;
  late final figma.FigmaClient _api;

  Future<FigmaRemoteLibrary> _refresh() async {
    final file = await _refreshFile();
    final images = await _refreshImages();
    return FigmaRemoteLibrary(
      file: file,
      images: images,
    );
  }

  Future<Map<String, String>?> _refreshImages() async {
    final uri = Uri.https(
      figma.base,
      '${_api.apiVersion}/files/$fileId/images',
    );
    final json = await _api.authenticatedGet(uri.toString());
    return <String, String>{
      ...json['meta']['images'],
    };
  }

  Future<figma.FileResponse> _refreshFile() async {
    final uri = Uri.https(
      figma.base,
      '${_api.apiVersion}/files/$fileId',
      const figma.FigmaQuery(geometry: 'paths').params,
    );
    final json = await _api.authenticatedGet(uri.toString());

    return figma.FileResponse.fromJson(json);
  }

  @override
  Future<List<Library>> getLibraries() async {
    return [
      const Library('figma', 10000000000),
    ];
  }

  @override
  Future<RemoteWidgetLibrary?> getLibrary(Library library) async {
    _figmaUpdate ??= _refresh();
    final library = await _figmaUpdate;
    return library;
  }
}
