import 'package:flutter_figma_generator/src/helpers/round.dart';
import 'package:rfw/dart/model.dart';

String? buildString(Object? value) {
  if (value is String) return '\'$value\'';
  if (value is StateReference) return stateReference(value);
  return null;
}

String? buildColor(Object? value) {
  if (value is num) return 'const Color(0x${value.toInt().toRadixString(16)})';
  if (value is StateReference) return stateReference(value);
  return null;
}

String? buildEdgeInsets(Object? value) {
  if (value is List) {
    final left = buildSize(value[0]);
    final top = buildSize(value[1]);
    final right = buildSize(value[2]);
    final bottom = buildSize(value[3]);
    return 'const EdgeInsets.only(left:$left,top:$top,right:$right,bottom:$bottom,)';
  }
  if (value is StateReference) return stateReference(value);
  return null;
}

String? buildSize(Object? value) {
  if (value is num) {
    if (value == double.infinity) return 'double.infinity';
    value = value.roundFixed();
    return '$value';
  }
  if (value is StateReference) return stateReference(value);
  return null;
}

String? buildEnum<T>(Object? value) {
  if (value is String) {
    return '$T.$value';
  }
  return null;
}

String? buildDecoration(Object? value) {
  if (value is! Map) return null;
  final shape = buildShape(value['shape']);
  final color = buildColor(value['color']);
  final gradient = buildGradient(value['gradient']);
  final image = buildDecorationImage(value['image']);
  final result = StringBuffer();
  result.write('ShapeDecoration(');
  if (color != null) {
    result.write('color: ${buildColor(color)}');
  }
  result.write(')');
  return result.toString();
}

String? buildShape(Object? value) {
  return 'Shape()';
}

String? buildGradient(Object? value) {
  return 'LinearGradient()';
}

String? buildDecorationImage(Object? value) {
  return 'LinearGradient()';
}

String stateReference(StateReference node) {
  return node.parts.join('.');
}
