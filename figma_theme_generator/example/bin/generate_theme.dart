import 'dart:convert';
import 'dart:io';

import 'package:figma_theme_generator/src/builders/builder.dart';
import 'package:figma/figma.dart';

void main() {
  final generator = FigmaThemeBuilder();

  final content = File('file_response_example.json').readAsStringSync();
  final file = FileResponse.fromJson(jsonDecode(content));
  final result = generator.build('Example', null, file);

  File('../lib/theme_data.g.dart').writeAsStringSync(result);
  print('generated!');
}
