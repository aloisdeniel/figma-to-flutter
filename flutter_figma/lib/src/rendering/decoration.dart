import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';
import '../helpers/api_extensions.dart';
import 'effect.dart';
import 'paint.dart';
import 'shape.dart';

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
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
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
      if (shape.fillGeometry != null) {
        for (var geometry in shape.fillGeometry!) {
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
    VoidCallback? onChanged,
  ) : super(onChanged);

  void _paintDropShadows(Canvas canvas, Path path) {
    for (final shadow
        in _decoration.effects.whereType<FigmaDropShadowEffect>()) {
      final paint = Paint()
        ..color = shadow.color ?? const Color(0xFF000000)
        ..maskFilter = MaskFilter.blur(
            BlurStyle.normal, convertRadiusToSigma(shadow.radius ?? 0.0));
      if (shadow.offset != Offset.zero) {
        path = path.transform(Matrix4.translationValues(
          shadow.offset?.dx ?? 0.0,
          shadow.offset?.dy ?? 0.0,
          0,
        ).storage);
      }
      canvas.drawPath(path, paint);
    }
  }

  // TODO caching of paints
  Paint _buildPaint(PaintingStyle style, FigmaPaint paint, Rect frame) {
    final result = Paint()
      ..style = style
      ..strokeWidth = _decoration.strokeWeight;

    if (paint is FigmaSolidPaint) {
      if (paint.color != null) result.color = paint.color!;
    } else if (paint is FigmaGradientLinearPaint) {
      if (paint.gradient != null)
        result.shader = paint.gradient!.createShader(frame);
    } else if (paint is FigmaGradientRadialPaint) {
      if (paint.gradient != null)
        result.shader = paint.gradient!.createShader(frame);
    }

    return result;
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = offset & (configuration.size ?? Size.zero);
    final path = _decoration.getClipPath(rect, TextDirection.ltr);

    _paintDropShadows(canvas, path);

    for (var fill in _decoration.fills) {
      final paint = _buildPaint(PaintingStyle.fill, fill, rect);
      canvas.drawPath(path, paint);
    }

    for (var stroke in _decoration.strokes) {
      final paint = _buildPaint(PaintingStyle.stroke, stroke, rect);
      paint.strokeWidth = _strokeWidth;
      canvas.drawPath(path, paint);
    }
  }
}

double convertRadiusToSigma(double radius) {
  return radius * 0.57735 + 0.5;
}
