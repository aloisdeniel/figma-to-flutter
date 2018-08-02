import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Logo extends StatelessWidget {
  Logo();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: LogoPainter());
  }
}

class LogoPainter extends CustomPainter {
  LogoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-30.0000000000, -18.0000000000);

// 106:0 : Logo (COMPONENT)
    var draw_106_0 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          30.0000000000,
          18.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:30.0,t:18.0,r:-30.0,b:-30.0,w:73.28427124023438,h:106.2843017578125) */;
      canvas.save();
      canvas.transform(Float64List.fromList([
        1.0000000000,
        0.0,
        0.0,
        0.0,
        0.0,
        1.0000000000,
        0.0,
        0.0,
        0.0,
        0.0,
        1.0,
        0.0,
        frame.left,
        frame.top,
        0.0,
        1.0
      ]));
      canvas.drawRect(Offset.zero & frame.size,
          (Paint()..color = _ColorCatalog.instance.color_0));

// 105:44 : Ellipse (ELLIPSE)
      var draw_105_44 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(20.0000000000, 78.1421508789, 20.0000038147,
            20.0000038147) /* H:SCALE V:SCALE F:(l:20.0,t:78.14215087890625,r:33.28426742553711,b:33.28426742553711,w:20.000003814697266,h:20.000003814697266) */;
        canvas.save();
        canvas.scale((container.width) / 73.2842712402,
            (container.height) / 106.2843017578);
        canvas.transform(Float64List.fromList([
          0.7071067095,
          -0.7071067095,
          0.0,
          0.0,
          0.7071067095,
          0.7071067095,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 20.0000038147),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 20.0000038147),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [_PathCatalog.instance.path_0.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_0);
        });
        canvas.restore();
      };
      draw_105_44(canvas, frame);

// 105:45 : Rectangle 3 (RECTANGLE)
      var draw_105_45 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(41.2132034302, 85.2132568359, 20.0000114441,
            10.0000057220) /* H:SCALE V:SCALE F:(l:41.21320343017578,t:85.2132568359375,r:12.071056365966797,b:12.071056365966797,w:20.000011444091797,h:10.000005722045898) */;
        canvas.save();
        canvas.scale((container.width) / 73.2842712402,
            (container.height) / 106.2843017578);
        canvas.transform(Float64List.fromList([
          -0.7071064711,
          -0.7071064711,
          0.0,
          0.0,
          0.7071064711,
          -0.7071064711,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 20.0000114441),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 10.0000057220),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [
          (Path()..addRect(Rect.fromLTWH(0.0, 0.0, frame.width, frame.height)))
        ];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_0);
        });
        canvas.restore();
      };
      draw_105_45(canvas, frame);

// 105:48 : Ellipse (ELLIPSE)
      var draw_105_48 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(34.0000000000, 92.1421508789, 20.0000038147,
            20.0000038147) /* H:SCALE V:SCALE F:(l:34.0,t:92.14215087890625,r:19.28426742553711,b:19.28426742553711,w:20.000003814697266,h:20.000003814697266) */;
        canvas.save();
        canvas.scale((container.width) / 73.2842712402,
            (container.height) / 106.2843017578);
        canvas.transform(Float64List.fromList([
          0.7071067095,
          -0.7071067095,
          0.0,
          0.0,
          0.7071067095,
          0.7071067095,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 20.0000038147),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 20.0000038147),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [_PathCatalog.instance.path_1.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_1);
        });
        canvas.restore();
      };
      draw_105_48(canvas, frame);

// 105:49 : Rectangle 3 (RECTANGLE)
      var draw_105_49 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(48.7304153442, 92.7304687500, 10.8319654465,
            10.0000057220) /* H:SCALE V:SCALE F:(l:48.73041534423828,t:92.73046875,r:13.721890449523926,b:13.721890449523926,w:10.831965446472168,h:10.000005722045898) */;
        canvas.save();
        canvas.scale((container.width) / 73.2842712402,
            (container.height) / 106.2843017578);
        canvas.transform(Float64List.fromList([
          -0.7071064711,
          -0.7071064711,
          0.0,
          0.0,
          0.7071064711,
          -0.7071064711,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 10.8319654465),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 10.0000057220),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [
          (Path()..addRect(Rect.fromLTWH(0.0, 0.0, frame.width, frame.height)))
        ];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_1);
        });
        canvas.restore();
      };
      draw_105_49(canvas, frame);

// 105:46 : Ellipse (ELLIPSE)
      var draw_105_46 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(34.0000000000, 64.1421508789, 20.0000038147,
            20.0000038147) /* H:SCALE V:SCALE F:(l:34.0,t:64.14215087890625,r:19.28426742553711,b:19.28426742553711,w:20.000003814697266,h:20.000003814697266) */;
        canvas.save();
        canvas.scale((container.width) / 73.2842712402,
            (container.height) / 106.2843017578);
        canvas.transform(Float64List.fromList([
          0.7071067095,
          -0.7071067095,
          0.0,
          0.0,
          0.7071067095,
          0.7071067095,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 20.0000038147),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 20.0000038147),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [_PathCatalog.instance.path_2.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_2);
        });
        canvas.restore();
      };
      draw_105_46(canvas, frame);

// 105:22 : Ellipse (ELLIPSE)
      var draw_105_22 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(-0.0000019073, 59.1421508789, 20.0000038147,
            20.0000038147) /* H:SCALE V:SCALE F:(l:-0.0000019073486328125,t:59.14215087890625,r:53.28426933288574,b:53.28426933288574,w:20.000003814697266,h:20.000003814697266) */;
        canvas.save();
        canvas.scale((container.width) / 73.2842712402,
            (container.height) / 106.2843017578);
        canvas.transform(Float64List.fromList([
          0.7071067095,
          -0.7071067095,
          0.0,
          0.0,
          0.7071067095,
          0.7071067095,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 20.0000038147),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 20.0000038147),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [_PathCatalog.instance.path_3.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_3);
        });
        canvas.restore();
      };
      draw_105_22(canvas, frame);

// 105:23 : Rectangle 3 (RECTANGLE)
      var draw_105_23 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(21.2132034302, 66.2132568359, 20.0000114441,
            10.0000057220) /* H:SCALE V:SCALE F:(l:21.21320343017578,t:66.2132568359375,r:32.0710563659668,b:32.0710563659668,w:20.000011444091797,h:10.000005722045898) */;
        canvas.save();
        canvas.scale((container.width) / 73.2842712402,
            (container.height) / 106.2843017578);
        canvas.transform(Float64List.fromList([
          -0.7071064711,
          -0.7071064711,
          0.0,
          0.0,
          0.7071064711,
          -0.7071064711,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 20.0000114441),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 10.0000057220),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [
          (Path()..addRect(Rect.fromLTWH(0.0, 0.0, frame.width, frame.height)))
        ];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_3);
        });
        canvas.restore();
      };
      draw_105_23(canvas, frame);

// 105:41 : Ellipse (ELLIPSE)
      var draw_105_41 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(73.2842712402, 14.1421508789, 20.0000038147,
            20.0000038147) /* H:SCALE V:SCALE F:(l:73.28427124023438,t:14.14215087890625,r:-20.000003814697266,b:-20.000003814697266,w:20.000003814697266,h:20.000003814697266) */;
        canvas.save();
        canvas.scale((container.width) / 73.2842712402,
            (container.height) / 106.2843017578);
        canvas.transform(Float64List.fromList([
          -0.7071067691,
          0.7071067691,
          0.0,
          0.0,
          -0.7071067691,
          -0.7071067691,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 20.0000038147),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 20.0000038147),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [_PathCatalog.instance.path_4.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_4);
        });
        canvas.restore();
      };
      draw_105_41(canvas, frame);

// 105:42 : Rectangle 3 (RECTANGLE)
      var draw_105_42 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(52.0710678101, 7.0710449219, 20.0000114441,
            53.7269592285) /* H:SCALE V:SCALE F:(l:52.071067810058594,t:7.071044921875,r:1.2131919860839844,b:1.2131919860839844,w:20.000011444091797,h:53.726959228515625) */;
        canvas.save();
        canvas.scale((container.width) / 73.2842712402,
            (container.height) / 106.2843017578);
        canvas.transform(Float64List.fromList([
          0.7071065307,
          0.7071065307,
          0.0,
          0.0,
          -0.7071065307,
          0.7071065307,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          frame.left,
          frame.top,
          0.0,
          1.0
        ]));
        var transform = Float64List.fromList([
          (frame.width / 20.0000114441),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 53.7269592285),
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0
        ]);
        var fillGeometry = [
          (Path()..addRect(Rect.fromLTWH(0.0, 0.0, frame.width, frame.height)))
        ];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_4);
        });
        canvas.restore();
      };
      draw_105_42(canvas, frame);
      canvas.restore();
    };
    draw_106_0(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(LogoPainter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(LogoPainter oldDelegate) {
    return false;
  }
}

class _PathCatalog {
  _PathCatalog() {
    this.path_0 = _build_0();
    this.path_1 = _build_1();
    this.path_2 = _build_2();
    this.path_3 = _build_3();
    this.path_4 = _build_4();
  }

  Path path_0;

  Path path_1;

  Path path_2;

  Path path_3;

  Path path_4;

  static final _PathCatalog instance = _PathCatalog();

  static Path _build_0() {
    var path = Path();
    path.moveTo(20.0000038147, 10.0000019073);
    path.cubicTo(20.0000038147, 15.5228500366, 15.5228500366, 20.0000038147,
        10.0000019073, 20.0000038147);
    path.cubicTo(
        4.4771533012, 20.0000038147, 0.0, 15.5228500366, 0.0, 10.0000019073);
    path.cubicTo(0.0, 4.4771533012, 4.4771533012, 0.0, 10.0000019073, 0.0);
    path.cubicTo(15.5228500366, 0.0, 20.0000038147, 4.4771533012, 20.0000038147,
        10.0000019073);
    path.close();
    return path;
  }

  static Path _build_1() {
    var path = Path();
    path.moveTo(20.0000038147, 10.0000019073);
    path.cubicTo(20.0000038147, 15.5228500366, 15.5228500366, 20.0000038147,
        10.0000019073, 20.0000038147);
    path.cubicTo(
        4.4771533012, 20.0000038147, 0.0, 15.5228500366, 0.0, 10.0000019073);
    path.cubicTo(0.0, 4.4771533012, 4.4771533012, 0.0, 10.0000019073, 0.0);
    path.cubicTo(15.5228500366, 0.0, 20.0000038147, 4.4771533012, 20.0000038147,
        10.0000019073);
    path.close();
    return path;
  }

  static Path _build_2() {
    var path = Path();
    path.moveTo(20.0000038147, 10.0000019073);
    path.cubicTo(20.0000038147, 15.5228500366, 15.5228500366, 20.0000038147,
        10.0000019073, 20.0000038147);
    path.cubicTo(
        4.4771533012, 20.0000038147, 0.0, 15.5228500366, 0.0, 10.0000019073);
    path.cubicTo(0.0, 4.4771533012, 4.4771533012, 0.0, 10.0000019073, 0.0);
    path.cubicTo(15.5228500366, 0.0, 20.0000038147, 4.4771533012, 20.0000038147,
        10.0000019073);
    path.close();
    return path;
  }

  static Path _build_3() {
    var path = Path();
    path.moveTo(20.0000038147, 10.0000019073);
    path.cubicTo(20.0000038147, 15.5228500366, 15.5228500366, 20.0000038147,
        10.0000019073, 20.0000038147);
    path.cubicTo(
        4.4771533012, 20.0000038147, 0.0, 15.5228500366, 0.0, 10.0000019073);
    path.cubicTo(0.0, 4.4771533012, 4.4771533012, 0.0, 10.0000019073, 0.0);
    path.cubicTo(15.5228500366, 0.0, 20.0000038147, 4.4771533012, 20.0000038147,
        10.0000019073);
    path.close();
    return path;
  }

  static Path _build_4() {
    var path = Path();
    path.moveTo(20.0000038147, 10.0000019073);
    path.cubicTo(20.0000038147, 15.5228500366, 15.5228500366, 20.0000038147,
        10.0000019073, 20.0000038147);
    path.cubicTo(
        4.4771533012, 20.0000038147, 0.0, 15.5228500366, 0.0, 10.0000019073);
    path.cubicTo(0.0, 4.4771533012, 4.4771533012, 0.0, 10.0000019073, 0.0);
    path.cubicTo(15.5228500366, 0.0, 20.0000038147, 4.4771533012, 20.0000038147,
        10.0000019073);
    path.close();
    return path;
  }
}

class _PaintCatalog {
  _PaintCatalog() {
    this.paint_0 = (Paint()..color = _ColorCatalog.instance.color_1);
    this.paint_1 = (Paint()..color = _ColorCatalog.instance.color_2);
    this.paint_2 = (Paint()..color = _ColorCatalog.instance.color_3);
    this.paint_3 = (Paint()..color = _ColorCatalog.instance.color_4);
    this.paint_4 = (Paint()..color = _ColorCatalog.instance.color_5);
  }

  Paint paint_0;

  Paint paint_1;

  Paint paint_2;

  Paint paint_3;

  Paint paint_4;

  static final _PaintCatalog instance = _PaintCatalog();
}

class _EffectCatalog {
  _EffectCatalog() {}

  static final _EffectCatalog instance = _EffectCatalog();
}

class _ColorCatalog {
  _ColorCatalog() {
    this.color_0 = Color.fromARGB(0, 0, 0, 0);
    this.color_1 = Color.fromARGB(255, 162, 89, 255);
    this.color_2 = Color.fromARGB(255, 10, 207, 131);
    this.color_3 = Color.fromARGB(255, 26, 188, 254);
    this.color_4 = Color.fromARGB(255, 242, 78, 30);
    this.color_5 = Color.fromARGB(255, 255, 114, 98);
  }

  Color color_0;

  Color color_1;

  Color color_2;

  Color color_3;

  Color color_4;

  Color color_5;

  static final _ColorCatalog instance = _ColorCatalog();
}

class _TextStyleCatalog {
  _TextStyleCatalog() {}

  static final _TextStyleCatalog instance = _TextStyleCatalog();
}

class Data {
  Data({this.isVisible});

  final bool isVisible;

  @override
  bool operator ==(o) => o is Data && isVisible == o.isVisible;
  @override
  int get hashcode {
    int result = 17;
    result = 37 * result + (this.isVisible?.hashCode ?? 0);
    return result;
  }
}

class TextData extends Data {
  TextData({isVisible, this.text}) : super(isVisible: isVisible);

  final String text;

  @override
  bool operator ==(o) =>
      o is TextData && isVisible == o.isVisible && text == o.text;
  @override
  int get hashcode {
    int result = 17;
    result = 37 * result + (this.isVisible?.hashCode ?? 0);
    result = 37 * result + (this.text?.hashCode ?? 0);
    return result;
  }
}

class VectorData extends Data {
  VectorData({isVisible}) : super(isVisible: isVisible);

  @override
  bool operator ==(o) => o is VectorData && isVisible == o.isVisible;
  @override
  int get hashcode {
    int result = 17;
    result = 37 * result + (this.isVisible?.hashCode ?? 0);
    return result;
  }
}
