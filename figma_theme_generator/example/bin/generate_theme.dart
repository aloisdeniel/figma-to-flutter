import 'dart:convert';
import 'dart:io';

import 'package:figma_theme_generator/figma_theme_generator.dart';
import 'package:figma/figma.dart';

void main() {
  final generator = FigmaThemeGenerator();

  final content = File('file_response_example.json').readAsStringSync();
  final file = FileResponse.fromJson(jsonDecode(content));
  final result = generator.generate('Example', file);

  File('../lib/theme_data.g.dart').writeAsStringSync(result);
  print('generated!');
}
