import 'package:flutter/foundation.dart';
import 'package:flutter_figma/src/converters/library/library.dart';
import 'package:rfw/rfw.dart';
import 'package:figma/figma.dart' as figma;

import 'client.dart';

class FigmaLibraryClient extends LibraryClient {
  FigmaLibraryClient({
    required this.token,
    required this.fileId,
  }) : _api = figma.FigmaClient(
          token,
          useHttp2: !kIsWeb,
        );
  final String token;
  final String fileId;
  Future<FigmaRemoteLibrary>? _figmaUpdate;
  late final figma.FigmaClient _api;

  Future<FigmaRemoteLibrary> _refresh(
    Library library, {
    List<String>? componentsId,
  }) async {
    final file = await _refreshFile(library, componentsId: componentsId);
    final images = await _refreshImages(library);
    return FigmaRemoteLibrary(
      file: file,
      images: images,
    );
  }

  Future<Map<String, String>?> _refreshImages(Library library) async {
    final uri = Uri.https(
      figma.base,
      '${_api.apiVersion}/files/$fileId/images',
    );
    final json = await _api.authenticatedGet(uri.toString());
    return <String, String>{
      ...json['meta']['images'],
    };
  }

  Future<figma.FileResponse> _refreshFile(
    Library library, {
    List<String>? componentsId,
  }) async {
    final nodeIds = componentsId ??
        (await getComponents(library)).map((e) => e.id).toList();

    /// 2. Get components nodes with file info
    final uri = Uri.https(
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
  Future<RemoteWidgetLibrary?> getLibrary(
    Library library, {
    List<String>? componentsId,
  }) async {
    _figmaUpdate ??= _refresh(library, componentsId: componentsId);
    final remote = await _figmaUpdate;
    return remote;
  }

  @override
  Future<List<LibraryComponent>> getComponents(Library library) async {
    /// 1. Get component set node ids to only get those ones
    var uri = Uri.https(
      figma.base,
      '${_api.apiVersion}/files/$fileId/component_sets',
    );
    final componentSets = await _api.authenticatedGet(uri.toString());

    /// 2. Get component node ids to only get those ones
    uri = Uri.https(
      figma.base,
      '${_api.apiVersion}/files/$fileId/components',
    );
    final components = await _api.authenticatedGet(uri.toString());

    final result = <LibraryComponent>[
      ...componentSets['meta']['component_sets'].map(
        (x) => LibraryComponent(
          x['node_id'],
          x['name'],
        ),
      ),
      ...components['meta']['components'].map(
        (x) => LibraryComponent(
          x['node_id'],
          x['name'],
        ),
      ),
    ];

    if (result.isEmpty) {
      // If no published component, then we load the entire file to extract
      // components
      final uri = Uri.https(
        figma.base,
        '${_api.apiVersion}/files/$fileId',
      );
      final json = await _api.authenticatedGet(uri.toString());
      return <LibraryComponent>[
        ...json['componentSets'].entries.map(
              (x) => LibraryComponent(
                x.key,
                x.value['name'],
              ),
            ),
        ...json['components'].entries.map(
              (x) => LibraryComponent(
                x.key,
                x.value['name'],
              ),
            ),
      ];
    }

    return result;
  }
}
