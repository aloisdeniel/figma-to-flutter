import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:figma_theme/figma_theme.dart' as annotation;
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

import 'builders/builder.dart';

class FigmaThemeGenerator
    extends GeneratorForAnnotation<annotation.FigmaTheme> {
  const FigmaThemeGenerator();

  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) {
      final name = element.name;
      throw InvalidGenerationSourceError('Generator cannot target `$name`.',
          todo: 'Remove the FigmaTheme annotation from `$name`.',
          element: element);
    }

    final classElement = element as ClassElement;

    final apiToken =
        annotation.objectValue.getField('apiToken').toStringValue();
    final fileKey = annotation.objectValue.getField('fileKey').toStringValue();
    final package = annotation.objectValue.getField('package').toStringValue();

    final builder = FigmaThemeBuilder();
    return await builder.download(
      name: classElement.displayName,
      package: package,
      apiToken: apiToken,
      fileKey: fileKey,
    );
  }
}
