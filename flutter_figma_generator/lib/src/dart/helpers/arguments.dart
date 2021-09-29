import 'package:flutter/widgets.dart';
import 'package:flutter_figma_generator/src/helpers/round.dart';
import 'package:rfw/dart/model.dart';

abstract class ArgumentEncoders {
  static String? string(Object? value) {
    if (value is String) return '\'$value\'';
    if (value is StateReference) return stateReference(value);
    return null;
  }

  static String? color(Object? value) {
    if (value is num) {
      return 'const Color(0x${value.toInt().toRadixString(16)})';
    }
    if (value is StateReference) return stateReference(value);
    return null;
  }

  static String? edgeInsets(Object? value) {
    if (value is List) {
      final left = size(value[0]);
      final top = size(value[1]);
      final right = size(value[2]);
      final bottom = size(value[3]);
      return 'EdgeInsets.only(left:$left,top:$top,right:$right,bottom:$bottom,)';
    }
    if (value is StateReference) return stateReference(value);
    return null;
  }

  static String? size(Object? value) {
    if (value is num) {
      if (value == double.infinity) return 'double.infinity';
      value = value.roundFixed();
      return '$value';
    }
    if (value is StateReference) return stateReference(value);
    return null;
  }

  static String? enumeration<T>(Object? value) {
    if (value is String) {
      return '$T.$value';
    }
    return null;
  }

  static String? decoration(Object? value) {
    if (value is! Map) return null;
    final shape = ArgumentEncoders.shape(value['shape']);
    final color = ArgumentEncoders.color(value['color']);
    final gradient = ArgumentEncoders.gradient(value['gradient']);
    final image = ArgumentEncoders.decorationImage(value['image']);
    final result = StringBuffer();
    result.write('ShapeDecoration(');
    if (color != null) {
      result.write('color: $color,');
    }
    if (shape != null) {
      result.write('shape: $shape,');
    }
    result.write(')');
    return result.toString();
  }

  static String instance(String name, List<String?> positionalArguments,
      Map<String, String?> arguments) {
    final result = StringBuffer('$name(');
    for (var item in positionalArguments.where((x) => x != null)) {
      result.writeln('$item,');
    }
    for (var item in arguments.entries.where((x) => x.value != null)) {
      result.writeln('${item.key}: ${item.value},');
    }
    result.writeln(')');
    return result.toString();
  }

  static String? shape(Object? value) {
    if (value is! Map) return null;
    return instance('SmoothRectangleBorder', [], {
      'side': borderSide(value['side']),
      'borderRadius':
          borderRadius(value['borderRadius']) ?? 'SmoothBorderRadius.zero',
      'borderAlign': 'BorderAlign.' + (value['borderAlign'] ?? 'inside'),
    });
  }

  static String? geometry(Object? value) {
    if (value is! Map) return null;
    final data = string(value['path']);
    if (data == null) return null;
    return instance('const Geometry', [
      data,
    ], {
      'windingRule': string(value['windingRule']),
    });
  }

  static String? borderRadius(Object? value) {
    if (value is StateReference) return stateReference(value);
    if (value is! List || value.length < 4) return null;
    final a = radius(value[0]) ?? 'null';
    final b = radius(value[1]) ?? 'null';
    final c = radius(value[2]) ?? 'null';
    final d = radius(value[3]) ?? 'null';
    final result = StringBuffer('SmoothBorderRadius.only(');
    if (a != 'SmoothRadius.zero') {
      result.writeln('topLeft: $a,');
    }
    if (b != 'SmoothRadius.zero') {
      result.writeln('topRight: $b,');
    }
    if (c != 'SmoothRadius.zero') {
      result.writeln('bottomLeft: $c,');
    }
    if (d != 'SmoothRadius.zero') {
      result.writeln('bottomRight: $d,');
    }
    result.writeln(')');
    return result.toString();
  }

  static String? radius(Object? value) {
    if (value is! Map) return null;
    if (value['x'] == 0 && value['smoothing'] == 0) return 'SmoothRadius.zero';

    final result = StringBuffer('SmoothRadius(');
    final x = size(value['x']) ?? '0';
    result.writeln('cornerRadius: $x,');

    final smoothing = size(value['smoothing']) ?? '0';
    result.writeln('cornerSmoothing: $smoothing,');

    result.writeln(')');
    return result.toString();
  }

  static String? borderSide(Object? value) {
    if (value is! Map) return null;
    final color = ArgumentEncoders.color(value['color']) ?? 'null';
    final width = size(value['width']) ?? 'null';
    final style =
        enumeration<BorderStyle>(value['style']) ?? 'BorderStyle.solid';
    return 'BorderSide('
        'color: $color,'
        'width: $width,'
        'style: $style,'
        ')';
  }

  static String? gradient(Object? value) {
    return 'LinearGradient()';
  }

  static String? decorationImage(Object? value) {
    return 'LinearGradient()';
  }

  static String stateReference(StateReference node) {
    return node.parts.join('.');
  }
}
