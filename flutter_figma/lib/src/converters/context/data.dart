import 'package:flutter_figma/src/helpers/naming.dart';
import 'package:rfw/rfw.dart';

import 'context.dart';

class FigmaResourceData<T> {
  FigmaResourceData(this.name, this.context);

  final FigmaComponentContext context;

  final String name;

  final Map<String, T> _values = {};

  String create(T value, String name) {
    /// Normalized name
    final baseName = createFieldName(name);
    name = baseName;

    /// Create a new resource
    int index = 0;
    while (_values.containsKey(name)) {
      index++;
      name = '$baseName$index';
    }

    _values[name] = value;

    return name;
  }

  DynamicMap toMap() {
    return _values;
  }
}

class FigmaComponentData {
  FigmaComponentData(FigmaComponentContext context)
      : text = FigmaResourceData<String>('text', context);

  final FigmaResourceData<String> text;

  DynamicMap toMap() {
    return {
      'text': text.toMap(),
    };
  }
}
