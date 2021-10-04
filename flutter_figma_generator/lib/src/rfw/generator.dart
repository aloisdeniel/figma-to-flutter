import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_generator/src/generator.dart';

import 'options.dart';

class RfwFigmaCodeGenerator extends FigmaCodeGenerator<RfwGeneratorOptions> {
  @override
  String generate({
    required FigmaRemoteLibrary library,
    required FigmaComponentBase component,
    RfwGeneratorOptions options = const RfwGeneratorOptions(),
  }) {
    return library.toString();
  }
}
