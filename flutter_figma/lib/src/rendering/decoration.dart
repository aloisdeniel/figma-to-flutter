import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';
import 'package:figma/figma.dart' as figma;
import '../helpers/api_extensions.dart';

class FigmaPaintDecoration extends Decoration {
  final FigmaShape shape;
  final double strokeWeight;
  final List<FigmaEffect> effects;
  final List<FigmaPaint> fills;
  final List<FigmaPaint> strokes;

  const FigmaPaintDecoration({
    this.strokeWeight = 1.0,
    this.effects = const <FigmaEffect>[],
    this.shape = const FigmaRectangleShape(),
    this.fills = const <FigmaPaint>[],
    this.strokes = const <FigmaPaint>[],
  })  : assert(shape != null),
        assert(fills != null),
        assert(strokes != null),
        assert(effects != null);

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return _FigmaPaintDecoration(this, strokeWeight, onChanged);
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    Path clipPath;
    final shape = this.shape;
    if (shape is FigmaRectangleShape) {
      final rectangleCornerRadii = shape.rectangleCornerRadii.toBorderRadius();
      clipPath = Path()
        ..addRRect(
          RRect.fromRectAndCorners(
            rect,
            topLeft: rectangleCornerRadii.topLeft,
            topRight: rectangleCornerRadii.topRight,
            bottomRight: rectangleCornerRadii.bottomRight,
            bottomLeft: rectangleCornerRadii.bottomLeft,
          ),
        );
    } else if (shape is FigmaPathShape) {
      clipPath = Path();
      for (var geometry in shape.fillGeometry) {
        final bounds = geometry.getBounds();
        final transform = Matrix4.translationValues(
              rect.left,
              rect.top,
              0,
            ) *
            (Matrix4.identity()
              ..scale(
                rect.width / (bounds.left + bounds.width),
                rect.height / (bounds.top + bounds.height),
              ));
        clipPath.addPath(geometry.transform(transform.storage), Offset.zero);
      }
    } else {
      clipPath = Path();
    }

    return clipPath;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final equality = const ListEquality().equals;
    return other is FigmaPaintDecoration &&
        other.shape == shape &&
        other.strokeWeight == strokeWeight &&
        equality(other.fills, fills) &&
        equality(other.strokes, strokes) &&
        equality(other.effects, effects);
  }

  @override
  int get hashCode {
    return hashValues(
      shape,
      strokeWeight,
      hashList(fills),
      hashList(strokes),
      hashList(effects),
    );
  }
}

class _FigmaPaintDecoration extends BoxPainter {
  final FigmaPaintDecoration _decoration;
  final double _strokeWidth;

  _FigmaPaintDecoration(
    this._decoration,
    this._strokeWidth,
    VoidCallback onChanged,
  )   : assert(_decoration != null),
        super(onChanged);

  void _paintDropShadows(Canvas canvas, Path path) {
    for (final shadow
        in _decoration.effects.whereType<FigmaDropShadowEffect>()) {
      final paint = Paint()
        ..color = shadow.color
        ..maskFilter = MaskFilter.blur(
            BlurStyle.normal, convertRadiusToSigma(shadow.radius));
      if (shadow.offset != Offset.zero) {
        path = path.transform(Matrix4.translationValues(
          shadow.offset.dx,
          shadow.offset.dy,
          0,
        ).storage);
      }
      canvas.drawPath(path, paint);
    }
  }

  // TODO caching of paints
  Paint _paint(PaintingStyle style, FigmaPaint paint, Rect frame) {
    final result = Paint()
      ..style = style
      ..strokeWidth = _decoration.strokeWeight;

    if (paint is FigmaSolidPaint) {
      result.color = paint.color;
    } else if (paint is FigmaGradientLinearPaint) {
      result.shader = paint.gradient.createShader(frame);
    } else if (paint is FigmaGradientRadialPaint) {
      result.shader = paint.gradient.createShader(frame);
    }

    return result;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = offset & configuration.size;
    final path = _decoration.getClipPath(rect, null);

    _paintDropShadows(canvas, path);

    for (var fill in _decoration.fills) {
      final paint = _paint(PaintingStyle.fill, fill, rect);
      canvas.drawPath(path, paint);
    }

    for (var stroke in _decoration.strokes) {
      final paint = _paint(PaintingStyle.stroke, stroke, rect);
      paint.strokeWidth = _strokeWidth;
      canvas.drawPath(path, paint);
    }
  }
}

double convertRadiusToSigma(double radius) {
  return radius * 0.57735 + 0.5;
}

abstract class FigmaEffect {
  const FigmaEffect();

  factory FigmaEffect.api(figma.Effect effect) {
    if (effect.type == figma.EffectType.dropShadow) {
      return FigmaDropShadowEffect(
        color: effect.color?.toFlutterColor(),
        offset: Offset(effect.offset?.x ?? 0.0, effect.offset?.y ?? 0.0),
        radius: effect.radius?.toDouble() ?? 0.0,
      );
    }
    if (effect.type == figma.EffectType.backgroundBlur) {
      return FigmaBackgroundBlurEffect(
        radius: effect.radius?.toDouble() ?? 0.0,
      );
    }

    return null;
  }
}

class FigmaDropShadowEffect extends FigmaEffect {
  final Color color;
  final Offset offset;
  final double radius;
  const FigmaDropShadowEffect({
    @required this.color,
    @required this.offset,
    @required this.radius,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaDropShadowEffect &&
        color != other.color &&
        offset != other.offset &&
        radius != other.radius;
  }

  @override
  int get hashCode {
    return (color.hashCode ^ offset.hashCode ^ radius.hashCode) ?? 0;
  }
}

class FigmaBackgroundBlurEffect extends FigmaEffect {
  final double radius;
  const FigmaBackgroundBlurEffect({
    @required this.radius,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaBackgroundBlurEffect && radius != other.radius;
  }

  @override
  int get hashCode {
    return (radius.hashCode) ?? 0;
  }
}

abstract class FigmaPaint {
  const FigmaPaint();

  factory FigmaPaint.api(figma.Paint paint) {
    if (paint.type == figma.PaintType.solid) {
      return FigmaSolidPaint(
        color: paint.color.toFlutterColor(paint.opacity ?? 1.0),
      );
    } else if (paint.type == figma.PaintType.gradientLinear) {
      var begin = paint.gradientHandlePositions[0];
      var end = paint.gradientHandlePositions[1];
      final beginAlign =
          Alignment((begin.x - 0.5) * 2.0, (begin.y - 0.5) * 2.0);
      final endAlign = Alignment((end.x - 0.5) * 2.0, (end.y - 0.5) * 2.0);
      return FigmaGradientLinearPaint(
        gradient: LinearGradient(
          begin: beginAlign,
          end: endAlign,
          colors:
              paint.gradientStops.map((x) => x.color.toFlutterColor()).toList(),
          stops: paint.gradientStops.map((x) => x.position).toList(),
          tileMode: TileMode.clamp,
        ),
      );
    } else if (paint.type == figma.PaintType.gradientRadial) {
      var begin = paint.gradientHandlePositions[0];
      var end = paint.gradientHandlePositions[1];
      final beginAlign =
          Alignment((begin.x - 0.5) * 2.0, (begin.y - 0.5) * 2.0);
      final endAlign = Alignment((end.x - 0.5) * 2.0, (end.y - 0.5) * 2.0);
      return FigmaGradientRadialPaint(
        gradient: RadialGradient(
          center: beginAlign,
          radius: (endAlign.x - beginAlign.x).abs(),
          colors:
              paint.gradientStops.map((x) => x.color.toFlutterColor()).toList(),
          stops: paint.gradientStops.map((x) => x.position).toList(),
          tileMode: TileMode.clamp,
        ),
      );
    }
    return null;
  }
}

class FigmaSolidPaint extends FigmaPaint {
  final Color color;
  const FigmaSolidPaint({
    @required this.color,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaSolidPaint && color != other.color;
  }

  @override
  int get hashCode {
    return color?.hashCode ?? 0;
  }
}

class FigmaGradientLinearPaint extends FigmaPaint {
  final LinearGradient gradient;
  const FigmaGradientLinearPaint({
    @required this.gradient,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaGradientLinearPaint && gradient != other.gradient;
  }

  @override
  int get hashCode {
    return gradient?.hashCode ?? 0;
  }
}

class FigmaGradientRadialPaint extends FigmaPaint {
  final RadialGradient gradient;
  const FigmaGradientRadialPaint({
    @required this.gradient,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaGradientRadialPaint && gradient != other.gradient;
  }

  @override
  int get hashCode {
    return gradient?.hashCode ?? 0;
  }
}

abstract class FigmaShape {
  const FigmaShape();
}

class FigmaRectangleShape extends FigmaShape {
  final List<num> rectangleCornerRadii;

  const FigmaRectangleShape({
    this.rectangleCornerRadii = const <num>[0, 0, 0, 0],
  }) : assert(rectangleCornerRadii != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaRectangleShape &&
        other.rectangleCornerRadii.length == rectangleCornerRadii.length &&
        other.rectangleCornerRadii
            .asMap()
            .entries
            .every((e) => e.value == rectangleCornerRadii[e.key]);
  }

  @override
  int get hashCode {
    return rectangleCornerRadii.hashCode;
  }
}

class FigmaPathShape extends FigmaShape {
  final List<Path> fillGeometry;

  const FigmaPathShape({
    @required this.fillGeometry,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaPathShape && fillGeometry != other.fillGeometry;
  }

  @override
  int get hashCode {
    return fillGeometry?.hashCode ?? 0;
  }
}
