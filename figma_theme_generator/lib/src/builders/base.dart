import 'package:figma/figma.dart';

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
      'spreadRadius: ${effect.radius},'
      ')';
}

String buildTextStyleInstance(TypeStyle style, List<Paint> fills) {
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

extension on num {
  String buildDouble() {
    return this.toStringAsFixed(2);
  }
}
