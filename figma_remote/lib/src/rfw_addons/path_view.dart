import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class PathView extends StatelessWidget {
  const PathView({
    Key? key,
    required this.geometry,
    this.fills = const <Color>[],
    this.strokes = const <BorderSide>[],
  }) : super(
          key: key,
        );

  final List<Path> geometry;
  final List<Color> fills;
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
  });

  final List<Path> geometry;
  final List<Color> fills;
  final List<BorderSide> strokes;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    for (var fill in fills) {
      paint.color = fill;
      for (var path in geometry) {
        canvas.drawPath(path, paint);
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
