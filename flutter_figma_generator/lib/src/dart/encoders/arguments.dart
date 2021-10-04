import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_generator/src/dart/helpers/instance_builder.dart';
import 'package:flutter_figma_generator/src/helpers/round.dart';
import 'package:rfw/dart/model.dart';

abstract class ArgumentEncoders {
  static String? string(Object? value) {
    if (value is String) return '\'$value\'';
    if (value is StateReference) return stateReference(value);
    return null;
  }

  static String? boolean(Object? value) {
    if (value is bool) return value ? 'true' : 'false';
    if (value is String) return value == 'true' ? 'true' : 'false';
    if (value is num) return value == 1 ? 'true' : 'false';
    return null;
  }

  static String? rect(Object? value) {
    if (value is! Map) return null;
    final result = InstanceBuilder('Rect.fromLTWH');
    result.positional(size(value['x']) ?? '0');
    result.positional(size(value['y']) ?? '0');
    result.positional(size(value['w']) ?? '0');
    result.positional(size(value['h']) ?? '0');
    return result.build();
  }

  /// Returns an [Offset] from the specified map.
  ///
  /// The map must have an `x` key and a `y` key, doubles.
  static String? offset(Object? value) {
    if (value is! Map) return null;
    final result = InstanceBuilder('Offset');
    result.positional(size(value['x']) ?? '0');
    result.positional(size(value['y']) ?? '0');
    return result.build();
  }

  /// Returns a [Color] from the specified integer.
  ///
  /// Returns null if it's not an integer; otherwise, passes it to the [new
  /// Color] constructor.
  static String? color(Object? value) {
    if (value is num) {
      return 'const Color(0x${value.toInt().toRadixString(16)})';
    }
    if (value is StateReference) return stateReference(value);
    return null;
  }

  static String? fontWeight(Object? value) {
    if (value is String) {
      return 'FontWeight.$value';
    }
    if (value is StateReference) return stateReference(value);
    return null;
  }

  /// Returns an [EdgeInsetsDirectional] from the specified list.
  ///
  /// The list is a list of doubles. An empty or missing list results in a null
  /// return value. The list should have one through four items. Extra items are
  /// ignored.
  ///
  /// The values are interpreted as follows:
  ///
  ///  * start: first value.
  ///  * top: second value, defaulting to same as start.
  ///  * end: third value, defaulting to same as start.
  ///  * bottom: fourth value, defaulting to same as top.
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

  static String? matrix4(Object? value) {
    if (value is List<num> && value.length >= 16) {
      final result = InstanceBuilder('Matrix4');
      for (var i = 0; i < 16; i++) {
        result.positional(size(value[i]) ?? '');
      }
      return result.build();
    }
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

    final result = InstanceBuilder('ShapeDecoration');
    final shadows = value['shadows'] as List?;
    if (shadows != null && shadows.isNotEmpty) {
      result.namedList(
        'shadows',
        [
          ...shadows.map((e) => boxShadow(e)),
        ],
      );
    }
    result.named(
      'color',
      color(value['color']),
    );
    result.named(
      'gradient',
      gradient(value['gradient']),
    );
    result.named(
      'shape',
      shape(value['shape']),
    );
    result.named(
      'image',
      decorationImage(value['image']),
    );

    return result.build();
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

    final result = InstanceBuilder('SmoothRectangleBorder');

    result.named(
      'borderRadius',
      borderRadius(value['borderRadius']),
    );
    result.named(
      'side',
      borderSide(value['side']),
    );
    result.named(
      'borderAlign',
      enumeration<BorderAlign>(value['borderAlign']),
    );

    return result.build();
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
    final a = radius(value[0]);
    final b = radius(value[1]);
    final c = radius(value[2]);
    final d = radius(value[3]);

    final result = InstanceBuilder('SmoothBorderRadius.only');

    if (a != 'SmoothRadius.zero') {
      result.named(
        'topLeft',
        a,
      );
    }
    if (b != 'SmoothRadius.zero') {
      result.named(
        'topRight',
        b,
      );
    }

    if (c != 'SmoothRadius.zero') {
      result.named(
        'bottomLeft',
        c,
      );
    }

    if (d != 'SmoothRadius.zero') {
      result.named(
        'bottomRight',
        d,
      );
    }

    return result.build();
  }

  static String? textStyle(Object? value) {
    if (value is StateReference) return stateReference(value);
    if (value is! Map) return null;

    final result = InstanceBuilder('TextStyle');

    result.named(
      'fontSize',
      size(value['fontSize']),
    );
    result.named(
      'fontFamily',
      string(value['fontFamily']),
    );
    result.named(
      'color',
      color(value['color']),
    );
    result.named(
      'fontWeight',
      fontWeight(value['fontWeight']),
    );
    result.named(
      'textDecoration',
      enumeration<TextDecoration>(value['textDecoration']),
    );

    return result.build();
  }

  static String? imageFilter(Object? value) {
    if (value is StateReference) return stateReference(value);
    if (value is! Map) return null;
    final type = value['type'];

    if (type == 'blur') {
      final result = InstanceBuilder('ImageFilter.blur');

      result.named(
        'sigmaX',
        size(value['sigmaX']),
      );
      result.named(
        'sigmaY',
        size(value['sigmaY']),
      );
      result.named(
        'tileMode',
        enumeration<TileMode>(value['tileMode']),
      );
      return result.build();
    }
    return null;
  }

  static String? radius(Object? value) {
    if (value is! Map) return null;
    if (value['x'] == 0 && value['smoothing'] == 0) return 'SmoothRadius.zero';

    final result = InstanceBuilder('SmoothRadius');

    result.named(
      'cornerRadius',
      size(value['x']) ?? '0',
    );
    result.named(
      'cornerSmoothing',
      size(value['smoothing']) ?? '0',
    );
    return result.build();
  }

  static String? borderSide(Object? value) {
    if (value is! Map) return null;

    final result = InstanceBuilder('BorderSide');

    result.named(
      'color',
      color(value['color']),
    );
    result.named(
      'width',
      size(value['width']),
    );
    result.named(
      'style',
      enumeration<BorderStyle>(value['style']),
    );
    return result.build();
  }

  static String? gradient(Object? value) {
    if (value is! Map) return null;
    final type = value['type'];
    final result = InstanceBuilder('LinearGradient');

    if (type == 'linear') {
      result.named(
        'begin',
        alignment(value['begin']),
      );

      result.named(
        'end',
        alignment(value['end']),
      );
    } else if (type == 'radial') {
      result.name = 'RadialGradient';
      result.named(
        'center',
        alignment(value['center']),
      );

      result.named(
        'radius',
        size(value['radius']),
      );

      result.named(
        'focal',
        alignment(value['focal']),
      );

      result.named(
        'focalRadius',
        size(value['focalRadius']),
      );
    } else if (type == 'sweep') {
      result.name = 'SweepGradient';
      result.named(
        'center',
        alignment(value['center']),
      );

      result.named(
        'startAngle',
        size(value['startAngle']),
      );

      result.named(
        'endAngle',
        size(value['endAngle']),
      );
    }

    result.named(
      'tileMode',
      enumeration<TileMode>(value['tileMode']),
    );

    final colors = value['colors'] as List?;
    if (colors != null) {
      result.namedList('colors', [
        ...colors.map((e) => color(e)),
      ]);
    }

    final stops = value['stops'] as List?;
    if (stops != null) {
      result.namedList('stops', [
        ...stops.map((e) => size(e)),
      ]);
    }

    return result.build();
  }

  static String? alignment(Object? value) {
    if (value is! Map) return null;

    final result = InstanceBuilder('Alignment');
    final x = size(value['x']);
    final y = size(value['y']);
    final start = size(value['start']);
    if (x == null && start == null) {
      return null;
    }
    if (y == null) {
      return null;
    }
    if (start != null) {
      result.name = 'AlignmentDirectional';
      result.positional(start);
      result.positional(y);
    } else {
      result.positional(x!);
      result.positional(y);
    }
    return result.build();
  }

  static String? decorationImage(Object? value) {
    if (value is! Map) return null;
    final result = InstanceBuilder('DecorationImage');

    result.named(
      'image',
      imageProvider(value),
    );
    result.named(
      'alignment',
      alignment(value['alignment']),
    );
    result.named(
      'fit',
      enumeration<BoxFit>(value['fit']),
    );
    result.named(
      'fit',
      enumeration<BoxFit>(value['fit']),
    );
    result.named(
      'centerSlice',
      rect(value['centerSlice']),
    );
    result.named(
      'colorFilter',
      colorFilter(value['colorFilter']),
    );
    result.named(
      'matchTextDirection',
      boolean(value['matchTextDirection']),
    );
    return result.build();
  }

  static String? imageProvider(Object? value) {
    if (value is StateReference) return stateReference(value);
    if (value is! Map) return null;
    final source = value['source'];
    if (source is StateReference) {
      return 'NetworkImage(' + stateReference(source) + ')';
    }
    if (source == null) return null;
    final Uri? imageUrl = Uri.tryParse(source);
    if (imageUrl == null) {
      return null;
    }

    if (!imageUrl.hasScheme) {
      final result = InstanceBuilder('AssetImage');
      result.positional(string(source) ?? '?');
      return result.build();
    }

    final result = InstanceBuilder('NetworkImage');
    result.positional(string(source) ?? '?');
    return result.build();
  }

  static String? colorFilter(Object? value) {
    if (value is! Map) return null;
    final type = value['type'];
    if (type == null) {
      return null;
    }
    if (type == 'linearToSrgbGamma') {
      return 'ColorFilter.linearToSrgbGamma()';
    }
    if (type == 'mode') {
      final result = InstanceBuilder('ColorFilter.mode');
      result.positional(color(value['color']) ?? 'const Color(0xFF000000)');
      result.positional(
          enumeration<BlendMode>(value['blendMode']) ?? 'BlendMode.srcOver');
      return result.build();
    }

    return null;
  }

  static String? boxShadow(Object? value) {
    if (value is! Map) return null;
    final result = InstanceBuilder('BoxShadow');

    result.named(
      'color',
      color(value['color']),
    );
    result.named(
      'offset',
      offset(value['offset']),
    );
    result.named(
      'blurRadius',
      size(value['blurRadius']),
    );
    result.named(
      'spreadRadius',
      size(value['spreadRadius']),
    );
    return result.build();
  }

  static String stateReference(StateReference node) {
    return node.parts.join('.');
  }
}
