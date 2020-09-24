import 'dart:convert';
import 'dart:io';

import 'package:figma_theme_generator/src/builders/builder.dart';
import 'package:figma/figma.dart';

void main() {
  final generator = FigmaThemeBuilder();

  final content = File('file_response_example.json').readAsStringSync();
  final file = FileResponse.fromJson(jsonDecode(content));
  final result = generator.build('Example', file);

  final result2 = generator.download(
    name: 'Example',
    apiToken: '64396-6b99a5ef-7878-4710-96cf-53d7436cf758',
    fileKey: '2n1EmQ6tqjbeydW2w2odZF',
  );

  File('../lib/theme_data.g.dart').writeAsStringSync(result);
  print('generated!');
}
