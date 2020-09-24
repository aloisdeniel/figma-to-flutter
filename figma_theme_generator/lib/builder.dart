import 'package:build/build.dart';
import 'package:figma_theme_generator/src/generator.dart';
import 'package:source_gen/source_gen.dart';

Builder figmaThemeGenerator(BuilderOptions options) => SharedPartBuilder(
      [FigmaThemeGenerator()],
      'figma_theme_generator',
    );
