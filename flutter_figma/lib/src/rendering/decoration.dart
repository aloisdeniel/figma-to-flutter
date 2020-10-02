import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';
import 'package:figma/figma.dart' as figma;
import '../helpers/api_extensions.dart';

class FigmaPaintDecoration extends Decoration {
  final FigmaPaintShape shape;
  final double strokeWeight;
  final List<figma.Effect> effects;
  final List<figma.Paint> fills;
  final List<figma.Paint> strokes;

  const FigmaPaintDecoration({
    this.strokeWeight = 1.0,
    this.effects = const <figma.Effect>[],
    this.shape = const FigmaBoxPaintShape(),
    this.fills = const <figma.Paint>[],
    this.strokes = const <figma.Paint>[],
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
    if (shape is FigmaBoxPaintShape) {
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
    } else if (shape is FigmaPathPaintShape) {
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
    for (final shadow in _decoration.effects
        .where((x) => x.type == figma.EffectType.dropShadow)) {
      final paint = Paint()
        ..color = shadow.color.toFlutterColor()
        ..maskFilter = MaskFilter.blur(
            BlurStyle.normal, convertRadiusToSigma(shadow.radius));
      if (shadow.offset != figma.Vector2D(x: 0, y: 0)) {
        path = path.transform(Matrix4.translationValues(
          shadow.offset.x,
          shadow.offset.y,
          0,
        ).storage);
      }
      canvas.drawPath(path, paint);
    }
  }

  // TODO caching of paints
  Paint _paint(PaintingStyle style, figma.Paint paint, Rect frame) {
    final result = Paint()
      ..style = style
      ..strokeWidth = _decoration.strokeWeight;

    if (paint.type == figma.PaintType.solid) {
      result.color = paint.color.toFlutterColor(paint.opacity ?? 1.0);
    } else if (paint.type == figma.PaintType.gradientLinear) {
      var begin = paint.gradientHandlePositions[0];
      var end = paint.gradientHandlePositions[1];
      final beginAlign =
          Alignment((begin.x - 0.5) * 2.0, (begin.y - 0.5) * 2.0);
      final endAlign = Alignment((end.x - 0.5) * 2.0, (end.y - 0.5) * 2.0);
      final gradient = LinearGradient(
        begin: beginAlign,
        end: endAlign,
        colors:
            paint.gradientStops.map((x) => x.color.toFlutterColor()).toList(),
        stops: paint.gradientStops.map((x) => x.position).toList(),
        tileMode: TileMode.clamp,
      );
      result.shader = gradient.createShader(frame);
    } else if (paint.type == figma.PaintType.gradientRadial) {
      var begin = paint.gradientHandlePositions[0];
      var end = paint.gradientHandlePositions[1];
      final beginAlign =
          Alignment((begin.x - 0.5) * 2.0, (begin.y - 0.5) * 2.0);
      final endAlign = Alignment((end.x - 0.5) * 2.0, (end.y - 0.5) * 2.0);
      final gradient = RadialGradient(
        center: beginAlign,
        radius: (endAlign.x - beginAlign.x).abs(),
        colors:
            paint.gradientStops.map((x) => x.color.toFlutterColor()).toList(),
        stops: paint.gradientStops.map((x) => x.position).toList(),
        tileMode: TileMode.clamp,
      );
      result.shader = gradient.createShader(frame);
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

abstract class FigmaPaintShape {
  const FigmaPaintShape();
}

class FigmaBoxPaintShape extends FigmaPaintShape {
  final List<num> rectangleCornerRadii;

  const FigmaBoxPaintShape({
    this.rectangleCornerRadii = const <num>[0, 0, 0, 0],
  }) : assert(rectangleCornerRadii != null);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaBoxPaintShape &&
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

class FigmaPathPaintShape extends FigmaPaintShape {
  final List<Path> fillGeometry;

  const FigmaPathPaintShape({
    @required this.fillGeometry,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is FigmaPathPaintShape && fillGeometry != other.fillGeometry;
  }

  @override
  int get hashCode {
    return fillGeometry?.hashCode ?? 0;
  }
}
