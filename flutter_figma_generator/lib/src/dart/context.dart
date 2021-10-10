import 'package:flutter_figma/flutter_figma.dart';
import 'package:rfw/rfw.dart';

import 'options.dart';

class DartGeneratorContext {
  const DartGeneratorContext({
    required this.options,
    required FigmaComponentBase component,
  }) : component = component;
  const DartGeneratorContext.empty()
      : component = null,
        options = const DartGeneratorOptions();

  final FigmaComponentBase? component;
  final DartGeneratorOptions options;

  Object? resolveReference(StateReference node) {
    final component = this.component;
    if (component is FigmaComponent) {
      return _resolveReference(
        component.declaration.initialState ?? <String, Object?>{},
        node.parts,
      );
    }

    if (component is FigmaComponentVariant) {
      return _resolveReference(
        component.declaration.initialState ?? <String, Object?>{},
        node.parts,
      );
    }

    return node;
  }
}

Object? _resolveReference(Map<String, Object?> state, List<Object> path) {
  final res = state[path.first];

  if (path.length == 1) {
    return res;
  }
  if (res is Map<String, Object?>) {
    return _resolveReference(
      res,
      path.skip(1).toList(),
    );
  }

  return null;
}
