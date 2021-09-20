import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma_generator/src/code_builders/context.dart';
import 'package:flutter_figma_generator/src/code_builders/helpers/instance.dart';
import 'package:flutter_figma_generator/src/code_builders/resources/resources.dart';

abstract class FigmaWidgetBuilder<N extends figma.Node> {
  ValueBuilder buildInstance(GeneratorContext resources, N node);
}
