import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_generator/src/generator.dart';

class RfwFigmaCodeGenerator extends FigmaCodeGenerator {
  @override
  String generate(FigmaRemoteLibrary library) {
    return library.toString();
  }
}
