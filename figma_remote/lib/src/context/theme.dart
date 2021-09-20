import 'package:figma/figma.dart';

import 'context.dart';

class FigmaResourceTheme<T> {
  FigmaResourceTheme(this.name);

  final String name;

  final Map<String, T> _values = {};

  int _lastIndex = 0;

  String getResourceName(FigmaContext context, T value) {
    final existing = _values.entries
        .firstWhere((resource) => resource.value == value, orElse: () {
      // TODO search style name in styles first
      // and if not found, generate one.
      _lastIndex++;
      final resName = '$name$_lastIndex';
      _values[resName] = value;
      return MapEntry(resName, value);
    });

    return existing.key;
  }
}

class FigmaTheme {
  final FigmaResourceTheme<Color> colors = FigmaResourceTheme<Color>('color');
}
