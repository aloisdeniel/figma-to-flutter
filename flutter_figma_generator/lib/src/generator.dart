import 'package:flutter_figma/flutter_figma.dart';

abstract class FigmaCodeGenerator<TOptions> {
  String generate({
    required FigmaRemoteLibrary library,
    required FigmaComponentBase component,
    TOptions options,
  });
}
