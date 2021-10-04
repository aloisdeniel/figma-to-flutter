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
    /// 1. Get component set node ids to only get those ones
    var uri = Uri.https(
      figma.base,
      '${_api.apiVersion}/files/$fileId/component_sets',
      const figma.FigmaQuery(geometry: 'paths').params,
    );
    final componentSets = await _api.authenticatedGet(uri.toString());

    /// 2. Get component node ids to only get those ones
    uri = Uri.https(
      figma.base,
      '${_api.apiVersion}/files/$fileId/components',
      const figma.FigmaQuery(geometry: 'paths').params,
    );
    final components = await _api.authenticatedGet(uri.toString());

    final nodeIds = <String>[
      ...componentSets['meta']['component_sets'].map((x) => x['node_id']),
      ...components['meta']['components'].map((x) => x['node_id']),
    ];

    /// 2. Get components nodes with file info
    uri = Uri.https(
      figma.base,
      '${_api.apiVersion}/files/$fileId',
      figma.FigmaQuery(
        geometry: 'paths',
        ids: nodeIds,
      ).params,
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
