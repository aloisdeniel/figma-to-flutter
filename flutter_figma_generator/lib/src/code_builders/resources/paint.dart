import 'package:figma/figma.dart';
import 'package:flutter_figma_generator/src/code_builders/helpers/instance.dart';

extension PaintCodeBuilderExtensions on Paint {
  ValueBuilder toCodeBuilder({
    required ValueBuilder paintColor,
    required ListValueBuilder gradientColors,
  }) {
    
    return ConstantBuilder(null);
  }
}
