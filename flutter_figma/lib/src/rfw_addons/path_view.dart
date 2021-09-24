import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

/// Renders a [geomotry] which consists of multiple [Path] with the given
/// [fills] and [strokes].
class PathView extends StatelessWidget {
  const PathView({
    Key? key,
    required this.geometry,
    this.fills = const <Decoration>[],
    this.strokes = const <BorderSide>[],
  }) : super(
          key: key,
        );

  final List<Path> geometry;
  final List<Decoration> fills;
  final List<BorderSide> strokes;

  @override
  Widget build(BuildContext context) {
    final bounds = geometry.map((path) => path.getBounds()).toList();
    final width =
        bounds.fold<double>(0.0, (currentMax, x) => max(currentMax, x.right));
    final height =
        bounds.fold<double>(0.0, (currentMax, x) => max(currentMax, x.bottom));
    if (width <= 0 || height <= 0) return const SizedBox();
    return FittedBox(
      child: SizedBox(
        width: width,
        height: height,
        child: CustomPaint(
          painter: _Painter(
            geometry: geometry,
            fills: fills,
            strokes: strokes,
          ),
        ),
      ),
    );
  }
}

class _Painter extends CustomPainter {
  _Painter({
    required this.geometry,
    required this.fills,
    required this.strokes,
  }) : fillPainters = fills.map((x) => x.createBoxPainter(() {})).toList();

  final List<Path> geometry;
  final List<Decoration> fills;
  final List<BorderSide> strokes;
  final List<BoxPainter> fillPainters;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    for (var boxPainter in fillPainters) {
      for (var path in geometry) {
        canvas.save();
        canvas.clipPath(path);
        boxPainter.paint(canvas, Offset.zero, ImageConfiguration(size: size));
        canvas.restore();
      }
    }
    paint = Paint()..style = PaintingStyle.stroke;
    for (var stroke in strokes) {
      paint.color = stroke.color;
      paint.strokeWidth = stroke.width;
      for (var path in geometry) {
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
