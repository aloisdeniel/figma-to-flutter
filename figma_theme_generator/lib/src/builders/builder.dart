import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:figma/figma.dart';
import 'package:meta/meta.dart';

import 'nodes.dart';

class FigmaThemeBuilder {
  final String fallbackConstructorName;
  const FigmaThemeBuilder({
    this.fallbackConstructorName = 'fallback',
  });

  Future<String> download({
    @required String name,
    @required String apiToken,
    @required String fileKey,
  }) async {
    assert(apiToken != null);
    assert(fileKey != null);

    final client = FigmaClient(apiToken);
    final file = await client.getFile(fileKey);

    return build(name, file);
  }

  String build(String name, FileResponse response) {
    final library = LibraryBuilder();

    const FileBuilder().build(
      library: library,
      name: name,
      response: response,
      fallbackConstructorName: fallbackConstructorName,
    );

    final emitter = DartEmitter();
    final source = '${library.build().accept(emitter)}';
    return DartFormatter().format(source);
  }
}
