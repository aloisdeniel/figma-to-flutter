import 'package:figma/figma.dart';
import 'package:recase/recase.dart';

String createFieldName(String name) {
  final cased = ReCase(name);
  return _removeSpecialCharacters(cased.camelCase);
}

String createClassName(String name) {
  final cased = ReCase(name);
  return _removeSpecialCharacters(cased.pascalCase);
}

String _removeSpecialCharacters(String value) {
  final result = StringBuffer();
  final regexp = RegExp('[a-zA-Z0-9]');
  for (var i = 0; i < value.length; i++) {
    final character = value[i];
    if (regexp.allMatches(character).isNotEmpty) {
      result.write(character);
    }
  }

  return result.toString();
}

String buildColorInstance(Color color, double opacity) {
  var ir = ((color.r ?? 0.0) * 255).toInt();
  var ig = ((color.g ?? 0.0) * 255).toInt();
  var ib = ((color.b ?? 0.0) * 255).toInt();
  var ia = ((color.a ?? 1.0) * (opacity ?? 1.0) * 255).toInt();
  return 'Color.fromARGB($ia, $ir, $ig, $ib)';
}

String buildBoxShadowInstance(Effect effect) {
  return 'BoxShadow('
      'color: ${buildColorInstance(effect.color, 1.0)},'
      'blurRadius: ${effect.radius},'
      'offset: Offset(${effect.offset.x}, ${effect.offset.y}),'
      ')';
}

String buildTextStyleInstance(
    String package, TypeStyle style, List<Paint> fills) {
  /// Only color paint should be used as text fills since Flutter
  /// is not really optimized for drawing gradient fills or image fills
  final colorPaint = (style.fills ?? (fills ?? const <Paint>[])).firstWhere(
    (x) => x.type == PaintType.solid,
    orElse: () => Paint(
      color: Color(
        a: 0,
        r: 0,
        g: 0,
        b: 0,
      ),
      opacity: 0.0,
    ),
  );
  final color = buildColorInstance(colorPaint.color, colorPaint.opacity);
  return 'TextStyle('
      'fontFamily: \'${style.fontFamily}\','
      '${package != null ? 'package: \'$package\',' : ''}'
      'fontSize: ${style.fontSize.buildDouble()},'
      'fontWeight: FontWeight.w${style.fontWeight.toInt()},'
      'color: $color,'
      ')';
}

String buildGradientInstance(Paint paint) {
  var begin = paint.gradientHandlePositions[0];
  var end = paint.gradientHandlePositions[1];
  begin = Vector2D(
    x: (begin.x - 0.5) * 2.0,
    y: (begin.y - 0.5) * 2.0,
  );
  end = Vector2D(
    x: (end.x - 0.5) * 2.0,
    y: (end.y - 0.5) * 2.0,
  );
  var beginAlignment =
      'Alignment(${begin.x.buildDouble()}, ${begin.y.buildDouble()})';
  var endAlignment =
      'Alignment(${end.x.buildDouble()}, ${end.y.buildDouble()})';
  final stops = "[" +
      paint.gradientStops
          .map(
            (e) => '${e.position.buildDouble()},',
          )
          .join("") +
      "]";
  final colorValues = paint.gradientStops
      .map(
        (e) => buildColorInstance(e.color, 1.0) + ',',
      )
      .toList();
  var colors = "[" + colorValues.join("") + "]";

  if (paint.type == PaintType.gradientRadial) {
    var radius = (end.x - begin.x).abs();
    return 'RadialGradient(' +
        'center: $beginAlignment,'
            'radius: $radius,'
            'stops: $stops,'
            'colors: $colors,'
            'tileMode: TileMode.clamp,'
            ')';
  }

  return 'LinearGradient(' +
      'begin: $beginAlignment,'
          'end: $endAlignment,'
          'stops: $stops,'
          'colors: $colors,'
          'tileMode: TileMode.clamp, '
          ')';
}

String buildBorderSideInstance(Paint colorPaint, double width) {
  final color = buildColorInstance(colorPaint.color, colorPaint.opacity);
  return 'BorderSide('
      'style: BorderStyle.solid,'
      'width: ${width.buildDouble()},'
      'color: $color,'
      ')';
}

String buildBorderRadiusInstance(List<num> radius) {
  final topLeft = radius.length > 0 ? radius[0] : 0;
  final topRight = radius.length > 1 ? radius[1] : 0;
  final bottomRight = radius.length > 2 ? radius[2] : 0;
  final bottomLeft = radius.length > 3 ? radius[3] : 0;

  if (topLeft == topRight && topLeft == bottomLeft && topLeft == bottomRight) {
    return 'BorderRadius.circular(${topLeft.buildDouble()})';
  }
  return 'BorderRadius.only('
      'topLeft: Radius.circular(${topLeft.buildDouble()}),'
      'topRight: Radius.circular(${topRight.buildDouble()}),'
      'bottomLeft: Radius.circular(${bottomLeft.buildDouble()}),'
      'bottomRight: Radius.circular(${bottomRight.buildDouble()}),'
      ')';
}

extension on num {
  String buildDouble() {
    return this.toStringAsFixed(2);
  }
}
