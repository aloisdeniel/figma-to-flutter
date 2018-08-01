import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Logo extends StatelessWidget {
  Logo({this.topBar});

  final Data topBar;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: LogoPainter(topBar));
  }
}

class LogoPainter extends CustomPainter {
  LogoPainter(this.topBar);

  final Data topBar;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-30, -18);
    var draw_106_0 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          30, 18, (container.width - (0)), (container.height - (0)));
      canvas.save();
      canvas.transform(Float64List.fromList([
        1,
        0,
        0.0,
        0.0,
        0,
        1,
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
      var draw_105_43 = (Canvas canvas, Rect container) {
        canvas.save();
        canvas.translate(34.14213562011719, 92.2843017578125);
        var draw_105_44 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (20.000003814697266 * (container.width) / 20.000003814697266),
              (3.216245934129728e-15 * (container.width) / 20.000003814697266),
              (20.000003814697266 * (container.width) / 20.000003814697266),
              (20.000003814697266 * (container.width) / 20.000003814697266));
          canvas.save();
          canvas.transform(Float64List.fromList([
            -1.6081226229577292e-16,
            1,
            0.0,
            0.0,
            -1,
            -1.6081226229577292e-16,
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
            (frame.width / 20.000003814697266),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 20.000003814697266),
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
            _PathCatalog.instance.path_0.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_105_44(canvas, frame);
        var draw_105_45 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (1.1368683772161603e-13 * (container.width) / 20.000011444091797),
              (10.000001907348633 * (container.width) / 20.000011444091797),
              (20.000011444091797 * (container.width) / 20.000011444091797),
              (10.000005722045898 * (container.width) / 20.000011444091797));
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.9999996423721313,
            -3.530460549191853e-30,
            0.0,
            0.0,
            3.537548121850475e-30,
            0.9999996423721313,
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
            (frame.width / 20.000011444091797),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 10.000005722045898),
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
            (Path()
              ..addRect(Rect.fromLTWH(0.0, 0.0, frame.width, frame.height)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_105_45(canvas, frame);
        canvas.restore();
      };
      draw_105_43(canvas, frame);
      var draw_105_47 = (Canvas canvas, Rect container) {
        canvas.save();
        canvas.translate(48.14213562011719, 106.2843017578125);
        var draw_105_48 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (20.000003814697266 * (container.width) / 20.000003814697266),
              (3.216245934129728e-15 * (container.width) / 20.000003814697266),
              (20.000003814697266 * (container.width) / 20.000003814697266),
              (20.000003814697266 * (container.width) / 20.000003814697266));
          canvas.save();
          canvas.transform(Float64List.fromList([
            -1.6081226229577292e-16,
            1,
            0.0,
            0.0,
            -1,
            -1.6081226229577292e-16,
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
            (frame.width / 20.000003814697266),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 20.000003814697266),
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
            _PathCatalog.instance.path_1.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_105_48(canvas, frame);
        var draw_105_49 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (9.1680269241333 * (container.width) / 10.831965446472168),
              (9.999984741210938 * (container.width) / 10.831965446472168),
              (10.831965446472168 * (container.width) / 10.831965446472168),
              (10.000005722045898 * (container.width) / 10.831965446472168));
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.9999996423721313,
            0,
            0.0,
            0.0,
            0,
            0.9999996423721313,
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
            (frame.width / 10.831965446472168),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 10.000005722045898),
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
            (Path()
              ..addRect(Rect.fromLTWH(0.0, 0.0, frame.width, frame.height)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_105_49(canvas, frame);
        canvas.restore();
      };
      draw_105_47(canvas, frame);
      var draw_105_46 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            (34 * (container.width) / 20.000003814697266),
            (64.14215087890625 * (container.width) / 20.000003814697266),
            (20.000003814697266 * (container.width) / 20.000003814697266),
            (20.000003814697266 * (container.width) / 20.000003814697266));
        canvas.save();
        canvas.transform(Float64List.fromList([
          0.7071067094802856,
          -0.7071067094802856,
          0.0,
          0.0,
          0.7071067094802856,
          0.7071067094802856,
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
          (frame.width / 20.000003814697266),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 20.000003814697266),
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
      if (this.topBar?.isVisible ?? true) {
        var draw_186_0 = (Canvas canvas, Rect container) {
          canvas.save();
          canvas.translate(0, 0);
          var draw_105_21 = (Canvas canvas, Rect container) {
            canvas.save();
            canvas.translate(14.142135620117188, 73.2843017578125);
            var draw_105_22 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  (20.000003814697266 * (container.width) / 20.000003814697266),
                  (3.216245934129728e-15 *
                      (container.width) /
                      20.000003814697266),
                  (20.000003814697266 * (container.width) / 20.000003814697266),
                  (20.000003814697266 *
                      (container.width) /
                      20.000003814697266));
              canvas.save();
              canvas.transform(Float64List.fromList([
                -1.6081226229577292e-16,
                1,
                0.0,
                0.0,
                -1,
                -1.6081226229577292e-16,
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
                (frame.width / 20.000003814697266),
                0.0,
                0.0,
                0.0,
                0.0,
                (frame.height / 20.000003814697266),
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
                _PathCatalog.instance.path_3.transform(transform)
              ];
              fillGeometry.forEach((path) {
                canvas.drawPath(path, _PaintCatalog.instance.paint_3);
              });
              canvas.restore();
            };
            draw_105_22(canvas, frame);
            var draw_105_23 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  (1.1368683772161603e-13 *
                      (container.width) /
                      20.000011444091797),
                  (10.000001907348633 * (container.width) / 20.000011444091797),
                  (20.000011444091797 * (container.width) / 20.000011444091797),
                  (10.000005722045898 *
                      (container.width) /
                      20.000011444091797));
              canvas.save();
              canvas.transform(Float64List.fromList([
                0.9999996423721313,
                -3.530460549191853e-30,
                0.0,
                0.0,
                3.537548121850475e-30,
                0.9999996423721313,
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
                (frame.width / 20.000011444091797),
                0.0,
                0.0,
                0.0,
                0.0,
                (frame.height / 10.000005722045898),
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
                (Path()
                  ..addRect(Rect.fromLTWH(0.0, 0.0, frame.width, frame.height)))
              ];
              fillGeometry.forEach((path) {
                canvas.drawPath(path, _PaintCatalog.instance.paint_3);
              });
              canvas.restore();
            };
            draw_105_23(canvas, frame);
            canvas.restore();
          };
          draw_105_21(canvas, frame);
          var draw_105_40 = (Canvas canvas, Rect container) {
            canvas.save();
            canvas.translate(59.14213562011719, 0);
            var draw_105_41 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  (20.000003814697266 * (container.width) / 20.000003814697266),
                  (3.216245934129728e-15 *
                      (container.width) /
                      20.000003814697266),
                  (20.000003814697266 * (container.width) / 20.000003814697266),
                  (20.000003814697266 *
                      (container.width) /
                      20.000003814697266));
              canvas.save();
              canvas.transform(Float64List.fromList([
                -1.6081226229577292e-16,
                1,
                0.0,
                0.0,
                -1,
                -1.6081226229577292e-16,
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
                (frame.width / 20.000003814697266),
                0.0,
                0.0,
                0.0,
                0.0,
                (frame.height / 20.000003814697266),
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
                _PathCatalog.instance.path_4.transform(transform)
              ];
              fillGeometry.forEach((path) {
                canvas.drawPath(path, _PaintCatalog.instance.paint_4);
              });
              canvas.restore();
            };
            draw_105_41(canvas, frame);
            var draw_105_42 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  (1.1368683772161603e-13 *
                      (container.width) /
                      20.000011444091797),
                  (10.000001907348633 * (container.width) / 20.000011444091797),
                  (20.000011444091797 * (container.width) / 20.000011444091797),
                  (53.726959228515625 *
                      (container.width) /
                      20.000011444091797));
              canvas.save();
              canvas.transform(Float64List.fromList([
                0.9999996423721313,
                -3.530460549191853e-30,
                0.0,
                0.0,
                3.537548121850475e-30,
                0.9999996423721313,
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
                (frame.width / 20.000011444091797),
                0.0,
                0.0,
                0.0,
                0.0,
                (frame.height / 53.726959228515625),
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
                (Path()
                  ..addRect(Rect.fromLTWH(0.0, 0.0, frame.width, frame.height)))
              ];
              fillGeometry.forEach((path) {
                canvas.drawPath(path, _PaintCatalog.instance.paint_4);
              });
              canvas.restore();
            };
            draw_105_42(canvas, frame);
            canvas.restore();
          };
          draw_105_40(canvas, frame);
          canvas.restore();
        };
        draw_186_0(canvas, frame);
      }
      var draw_266_0 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(-10, 95, 24, 15);
        canvas.save();
        canvas.transform(Float64List.fromList([
          1,
          0,
          0.0,
          0.0,
          0,
          1,
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
        var style_0 = _TextStyleCatalog.instance.ui_TextStyle_0;
        var paragraphStyle = ui.ParagraphStyle(
          fontFamily: 'Roboto',
          textAlign: TextAlign.left,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        );
        var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(style_0);
        paragraphBuilder.addText("beta");
        var paragraph = paragraphBuilder.build();
        paragraph.layout(new ui.ParagraphConstraints(width: frame.width));
        canvas.drawParagraph(paragraph, Offset.zero);
        canvas.restore();
      };
      draw_266_0(canvas, frame);
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
    return oldDelegate.topBar != this.topBar;
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
    path.moveTo(20.000003814697266, 10.000001907348633);
    path.cubicTo(20.000003814697266, 15.522850036621094, 15.522850036621094,
        20.000003814697266, 10.000001907348633, 20.000003814697266);
    path.cubicTo(4.477153301239014, 20.000003814697266, 0, 15.522850036621094,
        0, 10.000001907348633);
    path.cubicTo(
        0, 4.477153301239014, 4.477153301239014, 0, 10.000001907348633, 0);
    path.cubicTo(15.522850036621094, 0, 20.000003814697266, 4.477153301239014,
        20.000003814697266, 10.000001907348633);
    path.close();
    return path;
  }

  static Path _build_1() {
    var path = Path();
    path.moveTo(20.000003814697266, 10.000001907348633);
    path.cubicTo(20.000003814697266, 15.522850036621094, 15.522850036621094,
        20.000003814697266, 10.000001907348633, 20.000003814697266);
    path.cubicTo(4.477153301239014, 20.000003814697266, 0, 15.522850036621094,
        0, 10.000001907348633);
    path.cubicTo(
        0, 4.477153301239014, 4.477153301239014, 0, 10.000001907348633, 0);
    path.cubicTo(15.522850036621094, 0, 20.000003814697266, 4.477153301239014,
        20.000003814697266, 10.000001907348633);
    path.close();
    return path;
  }

  static Path _build_2() {
    var path = Path();
    path.moveTo(20.000003814697266, 10.000001907348633);
    path.cubicTo(20.000003814697266, 15.522850036621094, 15.522850036621094,
        20.000003814697266, 10.000001907348633, 20.000003814697266);
    path.cubicTo(4.477153301239014, 20.000003814697266, 0, 15.522850036621094,
        0, 10.000001907348633);
    path.cubicTo(
        0, 4.477153301239014, 4.477153301239014, 0, 10.000001907348633, 0);
    path.cubicTo(15.522850036621094, 0, 20.000003814697266, 4.477153301239014,
        20.000003814697266, 10.000001907348633);
    path.close();
    return path;
  }

  static Path _build_3() {
    var path = Path();
    path.moveTo(20.000003814697266, 10.000001907348633);
    path.cubicTo(20.000003814697266, 15.522850036621094, 15.522850036621094,
        20.000003814697266, 10.000001907348633, 20.000003814697266);
    path.cubicTo(4.477153301239014, 20.000003814697266, 0, 15.522850036621094,
        0, 10.000001907348633);
    path.cubicTo(
        0, 4.477153301239014, 4.477153301239014, 0, 10.000001907348633, 0);
    path.cubicTo(15.522850036621094, 0, 20.000003814697266, 4.477153301239014,
        20.000003814697266, 10.000001907348633);
    path.close();
    return path;
  }

  static Path _build_4() {
    var path = Path();
    path.moveTo(20.000003814697266, 10.000001907348633);
    path.cubicTo(20.000003814697266, 15.522850036621094, 15.522850036621094,
        20.000003814697266, 10.000001907348633, 20.000003814697266);
    path.cubicTo(4.477153301239014, 20.000003814697266, 0, 15.522850036621094,
        0, 10.000001907348633);
    path.cubicTo(
        0, 4.477153301239014, 4.477153301239014, 0, 10.000001907348633, 0);
    path.cubicTo(15.522850036621094, 0, 20.000003814697266, 4.477153301239014,
        20.000003814697266, 10.000001907348633);
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
    this.color_6 = Color.fromARGB(255, 255, 255, 255);
  }

  Color color_0;

  Color color_1;

  Color color_2;

  Color color_3;

  Color color_4;

  Color color_5;

  Color color_6;

  static final _ColorCatalog instance = _ColorCatalog();
}

class _TextStyleCatalog {
  _TextStyleCatalog() {
    this.ui_TextStyle_0 = ui.TextStyle(
      fontFamily: 'Roboto',
      color: _ColorCatalog.instance.color_6,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    );
  }

  ui.TextStyle ui_TextStyle_0;

  static final _TextStyleCatalog instance = _TextStyleCatalog();
}