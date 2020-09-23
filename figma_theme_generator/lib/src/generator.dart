import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:figma/figma.dart';

import 'builders/builders.dart';

class FigmaThemeGenerator {
  final String fallbackConstructorName;
  const FigmaThemeGenerator({
    this.fallbackConstructorName = 'fallback',
  });

  Future<String> download(String name, String token, String fileToken) async {
    assert(token != null);
    assert(fileToken != null);
    final client = FigmaClient('token');
    final file = await client.getFile('file_key');
    return generate(name, file);
  }

  String generate(String name, FileResponse response) {
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
