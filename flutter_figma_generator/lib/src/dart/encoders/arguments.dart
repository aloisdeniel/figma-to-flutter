import 'package:flutter/widgets.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_generator/src/dart/context.dart';
import 'package:flutter_figma_generator/src/dart/helpers/instance_builder.dart';
import 'package:flutter_figma_generator/src/helpers/round.dart';
import 'package:rfw/dart/model.dart';

abstract class ArgumentEncoders {
  static String? string(DartGeneratorContext context, Object? value) {
    if (value is StateReference && !context.options.data.text) {
      value = context.resolveReference(value);
    }
    if (value is String) return '\'$value\'';
    if (value is StateReference) return stateReference(value);
    return null;
  }

  static String? boolean(DartGeneratorContext context, Object? value) {
    if (value is bool) return value ? 'true' : 'false';
    if (value is String) return value == 'true' ? 'true' : 'false';
    if (value is num) return value == 1 ? 'true' : 'false';
    return null;
  }

  static String? rect(DartGeneratorContext context, Object? value) {
    if (value is! Map) return null;
    final result = InstanceBuilder('Rect.fromLTWH');
    result.positional(size(context, value['x']) ?? '0');
    result.positional(size(context, value['y']) ?? '0');
    result.positional(size(context, value['w']) ?? '0');
    result.positional(size(context, value['h']) ?? '0');
    return result.build();
  }

  /// Returns an [Offset] from the specified map.
  ///
  /// The map must have an `x` key and a `y` key, doubles.
  static String? offset(DartGeneratorContext context, Object? value) {
    if (value is! Map) return null;
    final result = InstanceBuilder('Offset');
    result.positional(size(context, value['x']) ?? '0');
    result.positional(size(context, value['y']) ?? '0');
    return result.build();
  }

  /// Returns a [Color] from the specified integer.
  ///
  /// Returns null if it's not an integer; otherwise, passes it to the [new
  /// Color] constructor.
  static String? color(DartGeneratorContext context, Object? value) {
    if (value is StateReference && !context.options.theme.color) {
      value = context.resolveReference(value);
    }
    if (value is num) {
      return 'const Color(0x${value.toInt().toRadixString(16)})';
    }
    if (value is StateReference) return stateReference(value);
    return null;
  }

  static String? fontWeight(DartGeneratorContext context, Object? value) {
    if (value is String) {
      return 'FontWeight.$value';
    }
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
  static String? edgeInsets(DartGeneratorContext context, Object? value) {
    if (value is List) {
      final left = spacing(context, value[0]);
      final top = spacing(context, value[1]);
      final right = spacing(context, value[2]);
      final bottom = spacing(context, value[3]);
      return 'EdgeInsets.only(left:$left,top:$top,right:$right,bottom:$bottom,)';
    }
    if (value is StateReference) return stateReference(value);
    return null;
  }

  static String? spacing(DartGeneratorContext context, Object? value) {
    if (value is StateReference && !context.options.theme.spacing) {
      value = context.resolveReference(value);
    }

    if (value is num) {
      if (value == double.infinity) return 'double.infinity';
      value = value.roundFixed();
      return '$value';
    }
    if (value is StateReference) return stateReference(value);
    return null;
  }

  static String? size(DartGeneratorContext context, Object? value) {
    if (value is num) {
      if (value == double.infinity) return 'double.infinity';
      value = value.roundFixed();
      return '$value';
    }
    if (value is StateReference) return stateReference(value);
    return null;
  }

  static String? matrix4(DartGeneratorContext context, Object? value) {
    if (value is List<num> && value.length >= 16) {
      final result = InstanceBuilder('Matrix4');
      for (var i = 0; i < 16; i++) {
        result.positional(size(context, value[i]) ?? '');
      }
      return result.build();
    }
    return null;
  }

  static String? enumeration<T>(DartGeneratorContext context, Object? value) {
    if (value is String) {
      return '$T.$value';
    }
    return null;
  }

  static String? decoration(DartGeneratorContext context, Object? value) {
    if (value is! Map) return null;

    final result = InstanceBuilder('ShapeDecoration');
    final shadows = value['shadows'] as List?;
    if (shadows != null && shadows.isNotEmpty) {
      result.namedList(
        'shadows',
        [
          ...shadows.map((e) => boxShadow(context, e)),
        ],
      );
    }
    result.named(
      'color',
      color(context, value['color']),
    );
    result.named(
      'gradient',
      gradient(context, value['gradient']),
    );
    result.named(
      'shape',
      shape(context, value['shape']),
    );
    result.named(
      'image',
      decorationImage(context, value['image']),
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

  static String? shape(DartGeneratorContext context, Object? value) {
    if (value is! Map) return null;

    final result = InstanceBuilder('SmoothRectangleBorder');

    result.named(
      'borderRadius',
      borderRadius(context, value['borderRadius']),
    );
    result.named(
      'side',
      borderSide(context, value['side']),
    );
    result.named(
      'borderAlign',
      enumeration<BorderAlign>(context, value['borderAlign']),
    );

    return result.build();
  }

  static String? geometry(DartGeneratorContext context, Object? value) {
    if (value is! Map) return null;
    final data = string(context, value['path']);
    if (data == null) return null;
    return instance('const Geometry', [
      data,
    ], {
      'windingRule': string(context, value['windingRule']),
    });
  }

  static String? borderRadius(DartGeneratorContext context, Object? value) {
    if (value is StateReference) return stateReference(value);
    if (value is! List || value.length < 4) return null;
    final a = radius(context, value[0]);
    final b = radius(context, value[1]);
    final c = radius(context, value[2]);
    final d = radius(context, value[3]);

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

  static String? textStyle(DartGeneratorContext context, Object? value) {
    if (value is StateReference && !context.options.theme.textStyle) {
      value = context.resolveReference(value);
    }
    if (value is StateReference) return stateReference(value);
    if (value is! Map) return null;

    final result = InstanceBuilder('const TextStyle');

    result.named(
      'fontSize',
      size(context, value['fontSize']),
    );
    result.named(
      'fontFamily',
      string(context, value['fontFamily']),
    );
    result.named(
      'fontWeight',
      fontWeight(context, value['fontWeight']),
    );
    result.named(
      'height',
      size(context, value['height']),
    );
    result.named(
      'textDecoration',
      enumeration<TextDecoration>(context, value['textDecoration']),
    );

    return result.build();
  }

  static String? imageFilter(DartGeneratorContext context, Object? value) {
    if (value is StateReference) return stateReference(value);
    if (value is! Map) return null;
    final type = value['type'];

    if (type == 'blur') {
      final result = InstanceBuilder('ImageFilter.blur');

      result.named(
        'sigmaX',
        size(context, value['sigmaX']),
      );
      result.named(
        'sigmaY',
        size(context, value['sigmaY']),
      );
      result.named(
        'tileMode',
        enumeration<TileMode>(context, value['tileMode']),
      );
      return result.build();
    }
    return null;
  }

  static String? radius(DartGeneratorContext context, Object? value) {
    if (value is! Map) return null;
    if (value['x'] == 0 && value['smoothing'] == 0) return 'SmoothRadius.zero';

    final result = InstanceBuilder('SmoothRadius');

    result.named(
      'cornerRadius',
      size(context, value['x']) ?? '0',
    );
    result.named(
      'cornerSmoothing',
      size(context, value['smoothing']) ?? '0',
    );
    return result.build();
  }

  static String? borderSide(DartGeneratorContext context, Object? value) {
    if (value is! Map) return null;

    final result = InstanceBuilder('BorderSide');

    result.named(
      'width',
      size(context, value['width']),
    );
    result.named(
      'style',
      enumeration<BorderStyle>(context, value['style']),
    );
    return result.build() +
        '.copyWith(color: ${color(context, value['color'])},)';
  }

  static String? gradient(DartGeneratorContext context, Object? value) {
    if (value is! Map) return null;
    final type = value['type'];
    final result = InstanceBuilder('LinearGradient');

    if (type == 'linear') {
      result.named(
        'begin',
        alignment(context, value['begin']),
      );

      result.named(
        'end',
        alignment(context, value['end']),
      );
    } else if (type == 'radial') {
      result.name = 'RadialGradient';
      result.named(
        'center',
        alignment(context, value['center']),
      );

      result.named(
        'radius',
        size(context, value['radius']),
      );

      result.named(
        'focal',
        alignment(context, value['focal']),
      );

      result.named(
        'focalRadius',
        size(context, value['focalRadius']),
      );
    } else if (type == 'sweep') {
      result.name = 'SweepGradient';
      result.named(
        'center',
        alignment(context, value['center']),
      );

      result.named(
        'startAngle',
        size(context, value['startAngle']),
      );

      result.named(
        'endAngle',
        size(context, value['endAngle']),
      );
    }

    result.named(
      'tileMode',
      enumeration<TileMode>(context, value['tileMode']),
    );

    final colors = value['colors'] as List?;
    if (colors != null) {
      result.namedList('colors', [
        ...colors.map((e) => color(context, e)),
      ]);
    }

    final stops = value['stops'] as List?;
    if (stops != null) {
      result.namedList('stops', [
        ...stops.map((e) => size(context, e)),
      ]);
    }

    return result.build();
  }

  static String? alignment(DartGeneratorContext context, Object? value) {
    if (value is! Map) return null;

    final result = InstanceBuilder('Alignment');
    final x = size(context, value['x']);
    final y = size(context, value['y']);
    final start = size(context, value['start']);
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

  static String? decorationImage(DartGeneratorContext context, Object? value) {
    if (value is! Map) return null;
    final result = InstanceBuilder('DecorationImage');

    result.named(
      'image',
      imageProvider(context, value),
    );
    result.named(
      'alignment',
      alignment(context, value['alignment']),
    );
    result.named(
      'fit',
      enumeration<BoxFit>(context, value['fit']),
    );
    result.named(
      'fit',
      enumeration<BoxFit>(context, value['fit']),
    );
    result.named(
      'centerSlice',
      rect(context, value['centerSlice']),
    );
    result.named(
      'colorFilter',
      colorFilter(context, value['colorFilter']),
    );
    result.named(
      'matchTextDirection',
      boolean(context, value['matchTextDirection']),
    );
    return result.build();
  }

  static String? imageProvider(DartGeneratorContext context, Object? value) {
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
      result.positional(string(context, source) ?? '?');
      return result.build();
    }

    final result = InstanceBuilder('NetworkImage');
    result.positional(string(context, source) ?? '?');
    return result.build();
  }

  static String? colorFilter(DartGeneratorContext context, Object? value) {
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
      result.positional(
          color(context, value['color']) ?? 'const Color(0xFF000000)');
      result.positional(enumeration<BlendMode>(context, value['blendMode']) ??
          'BlendMode.srcOver');
      return result.build();
    }

    return null;
  }

  static String? boxShadow(DartGeneratorContext context, Object? value) {
    if (value is! Map) return null;
    final result = InstanceBuilder('BoxShadow');

    result.named(
      'color',
      color(context, value['color']),
    );
    result.named(
      'offset',
      offset(context, value['offset']),
    );
    result.named(
      'blurRadius',
      size(context, value['blurRadius']),
    );
    result.named(
      'spreadRadius',
      size(context, value['spreadRadius']),
    );
    return result.build();
  }

  static String stateReference(StateReference node) {
    return node.parts.join('.');
  }
}
