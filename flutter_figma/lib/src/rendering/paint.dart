import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';
import 'package:figma/figma.dart' as figma;
import '../helpers/api_extensions.dart';

abstract class FigmaPaint {
  const FigmaPaint();

  factory FigmaPaint.api(figma.Paint paint) {
    if (paint.type == figma.PaintType.solid) {
      return FigmaSolidPaint(
        color: paint.color?.toFlutterColor(paint.opacity ?? 1.0),
      );
    } else if (paint.type == figma.PaintType.gradientLinear) {
      var begin =
          paint.gradientHandlePositions?[0] ?? figma.Vector2D(x: 0.0, y: 0.0);
      var end =
          paint.gradientHandlePositions?[1] ?? figma.Vector2D(x: 0.0, y: 1.0);
      final beginAlign =
          Alignment((begin.x - 0.5) * 2.0, (begin.y - 0.5) * 2.0);
      final endAlign = Alignment((end.x - 0.5) * 2.0, (end.y - 0.5) * 2.0);
      final stops = paint.gradientStops?.map((x) => x.position ?? 0.0).toList();
      final colors = paint.gradientStops
              ?.map((x) => x.color?.toFlutterColor())
              .whereNotNull()
              .toList() ??
          const <Color>[];
      return FigmaGradientLinearPaint(
        gradient: LinearGradient(
          begin: beginAlign,
          end: endAlign,
          colors: colors,
          stops: stops,
          tileMode: TileMode.clamp,
        ),
      );
    } else if (paint.type == figma.PaintType.gradientRadial) {
      var begin =
          paint.gradientHandlePositions?[0] ?? figma.Vector2D(x: 0.0, y: 0.0);
      var end =
          paint.gradientHandlePositions?[1] ?? figma.Vector2D(x: 0.0, y: 1.0);
      final beginAlign =
          Alignment((begin.x - 0.5) * 2.0, (begin.y - 0.5) * 2.0);
      final endAlign = Alignment((end.x - 0.5) * 2.0, (end.y - 0.5) * 2.0);
      final stops = paint.gradientStops?.map((x) => x.position ?? 0.0).toList();
      final colors = paint.gradientStops
              ?.map((x) => x.color?.toFlutterColor())
              .whereNotNull()
              .toList() ??
          const <Color>[];
      return FigmaGradientRadialPaint(
        gradient: RadialGradient(
          center: beginAlign,
          radius: (endAlign.x - beginAlign.x).abs(),
          colors: colors,
          stops: stops,
          tileMode: TileMode.clamp,
        ),
      );
    }
    throw UnsupportedError('Paint type not supported yet : ${paint.type}');
  }
}

class FigmaSolidPaint extends FigmaPaint {
  final Color? color;
  const FigmaSolidPaint({
    required this.color,
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
  final LinearGradient? gradient;
  const FigmaGradientLinearPaint({
    required this.gradient,
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
  final RadialGradient? gradient;
  const FigmaGradientRadialPaint({
    required this.gradient,
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
