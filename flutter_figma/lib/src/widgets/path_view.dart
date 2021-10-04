import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:path_parsing/path_parsing.dart';

/// A path, represented as a SVG [data] string.
///
/// A [windingRule] can also be precised. If not precised, defaults to [PathFillType.nonZero]
class Geometry {
  const Geometry(
    this.data, {
    this.windingRule,
  });

  final String data;
  final PathFillType? windingRule;

  /// Create a
  Path toPath() {
    if (data == '') {
      return Path();
    }

    final SvgPathStringSource parser = SvgPathStringSource(data);
    final FlutterPathProxy path = FlutterPathProxy();
    path.path.fillType = windingRule ?? PathFillType.nonZero;
    final SvgPathNormalizer normalizer = SvgPathNormalizer();
    for (PathSegmentData seg in parser.parseSegments()) {
      normalizer.emitSegment(seg, path);
    }
    return path.path;
  }

  @override
  bool operator ==(Object other) {
    return other is Geometry &&
        data == other.data &&
        windingRule == other.windingRule;
  }

  @override
  int get hashCode => hashValues(data, windingRule);
}

/// Renders a [geomotry] which consists of multiple [Path] with the given
/// [fills] and [strokes].
class PathView extends StatefulWidget {
  const PathView({
    Key? key,
    required this.geometry,
    this.fills = const <Decoration>[],
    this.strokes = const <BorderSide>[],
  }) : super(
          key: key,
        );

  final List<Geometry> geometry;
  final List<Decoration> fills;
  final List<BorderSide> strokes;

  @override
  State<PathView> createState() => _PathViewState();
}

class _PathViewState extends State<PathView> {
  late List<Path> geometry;

  @override
  void initState() {
    geometry = [
      ...widget.geometry.map((x) => x.toPath()),
    ];
    super.initState();
  }

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
            fills: widget.fills,
            strokes: widget.strokes,
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
