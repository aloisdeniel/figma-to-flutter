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
    canvas.translate(-30.0, -18.0);
    var draw_106_0 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          30.0000000000,
          18.0000000000,
          (container.width - (0.0000000000)),
          (container.height - (0.0000000000)));
      canvas.save();
      canvas.transform(Float64List.fromList([
        1.0000000000,
        0.0000000000,
        0.0,
        0.0,
        0.0000000000,
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
      var draw_105_43 = (Canvas canvas, Rect container) {
        canvas.save();
        canvas.translate(34.14213562011719, 92.2843017578125);
        var draw_105_44 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (20.0000038147 * (container.width) / 20.0000038147),
              (0.0000000000 * (container.width) / 20.0000038147),
              (20.0000038147 * (container.width) / 20.0000038147),
              (20.0000038147 * (container.width) / 20.0000038147));
          canvas.save();
          canvas.transform(Float64List.fromList([
            -0.0000000000,
            1.0000000000,
            0.0,
            0.0,
            -1.0000000000,
            -0.0000000000,
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
              (0.0000000000 * (container.width) / 20.0000114441),
              (10.0000019073 * (container.width) / 20.0000114441),
              (20.0000114441 * (container.width) / 20.0000114441),
              (10.0000057220 * (container.width) / 20.0000114441));
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.9999996424,
            -0.0000000000,
            0.0,
            0.0,
            0.0000000000,
            0.9999996424,
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
              (20.0000038147 * (container.width) / 20.0000038147),
              (0.0000000000 * (container.width) / 20.0000038147),
              (20.0000038147 * (container.width) / 20.0000038147),
              (20.0000038147 * (container.width) / 20.0000038147));
          canvas.save();
          canvas.transform(Float64List.fromList([
            -0.0000000000,
            1.0000000000,
            0.0,
            0.0,
            -1.0000000000,
            -0.0000000000,
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
              (9.1680269241 * (container.width) / 10.8319654465),
              (9.9999847412 * (container.width) / 10.8319654465),
              (10.8319654465 * (container.width) / 10.8319654465),
              (10.0000057220 * (container.width) / 10.8319654465));
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.9999996424,
            0.0000000000,
            0.0,
            0.0,
            0.0000000000,
            0.9999996424,
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
            (34.0000000000 * (container.width) / 20.0000038147),
            (64.1421508789 * (container.width) / 20.0000038147),
            (20.0000038147 * (container.width) / 20.0000038147),
            (20.0000038147 * (container.width) / 20.0000038147));
        canvas.save();
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
      if (this.topBar?.isVisible ?? true) {
        var draw_186_0 = (Canvas canvas, Rect container) {
          canvas.save();
          canvas.translate(0.0, 0.0);
          var draw_105_21 = (Canvas canvas, Rect container) {
            canvas.save();
            canvas.translate(14.142135620117188, 73.2843017578125);
            var draw_105_22 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  (20.0000038147 * (container.width) / 20.0000038147),
                  (0.0000000000 * (container.width) / 20.0000038147),
                  (20.0000038147 * (container.width) / 20.0000038147),
                  (20.0000038147 * (container.width) / 20.0000038147));
              canvas.save();
              canvas.transform(Float64List.fromList([
                -0.0000000000,
                1.0000000000,
                0.0,
                0.0,
                -1.0000000000,
                -0.0000000000,
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
                  (0.0000000000 * (container.width) / 20.0000114441),
                  (10.0000019073 * (container.width) / 20.0000114441),
                  (20.0000114441 * (container.width) / 20.0000114441),
                  (10.0000057220 * (container.width) / 20.0000114441));
              canvas.save();
              canvas.transform(Float64List.fromList([
                0.9999996424,
                -0.0000000000,
                0.0,
                0.0,
                0.0000000000,
                0.9999996424,
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
            canvas.translate(59.14213562011719, 0.0);
            var draw_105_41 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  (20.0000038147 * (container.width) / 20.0000038147),
                  (0.0000000000 * (container.width) / 20.0000038147),
                  (20.0000038147 * (container.width) / 20.0000038147),
                  (20.0000038147 * (container.width) / 20.0000038147));
              canvas.save();
              canvas.transform(Float64List.fromList([
                -0.0000000000,
                1.0000000000,
                0.0,
                0.0,
                -1.0000000000,
                -0.0000000000,
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
                  (0.0000000000 * (container.width) / 20.0000114441),
                  (10.0000019073 * (container.width) / 20.0000114441),
                  (20.0000114441 * (container.width) / 20.0000114441),
                  (53.7269592285 * (container.width) / 20.0000114441));
              canvas.save();
              canvas.transform(Float64List.fromList([
                0.9999996424,
                -0.0000000000,
                0.0,
                0.0,
                0.0000000000,
                0.9999996424,
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
        var frame = Rect.fromLTWH(
            -10.0000000000, 95.0000000000, 24.0000000000, 15.0000000000);
        canvas.save();
        canvas.transform(Float64List.fromList([
          1.0000000000,
          0.0000000000,
          0.0,
          0.0,
          0.0000000000,
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
        var style_0 = _TextStyleCatalog.instance.ui_TextStyle_0;
        var paragraphStyle = ui.ParagraphStyle(
          fontFamily: 'Roboto',
          textAlign: TextAlign.left,
          fontSize: 12.0000000000,
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
    path.moveTo(20.0000038147, 10.0000019073);
    path.cubicTo(20.0000038147, 15.5228500366, 15.5228500366, 20.0000038147,
        10.0000019073, 20.0000038147);
    path.cubicTo(4.4771533012, 20.0000038147, 0.0000000000, 15.5228500366,
        0.0000000000, 10.0000019073);
    path.cubicTo(0.0000000000, 4.4771533012, 4.4771533012, 0.0000000000,
        10.0000019073, 0.0000000000);
    path.cubicTo(15.5228500366, 0.0000000000, 20.0000038147, 4.4771533012,
        20.0000038147, 10.0000019073);
    path.close();
    return path;
  }

  static Path _build_1() {
    var path = Path();
    path.moveTo(20.0000038147, 10.0000019073);
    path.cubicTo(20.0000038147, 15.5228500366, 15.5228500366, 20.0000038147,
        10.0000019073, 20.0000038147);
    path.cubicTo(4.4771533012, 20.0000038147, 0.0000000000, 15.5228500366,
        0.0000000000, 10.0000019073);
    path.cubicTo(0.0000000000, 4.4771533012, 4.4771533012, 0.0000000000,
        10.0000019073, 0.0000000000);
    path.cubicTo(15.5228500366, 0.0000000000, 20.0000038147, 4.4771533012,
        20.0000038147, 10.0000019073);
    path.close();
    return path;
  }

  static Path _build_2() {
    var path = Path();
    path.moveTo(20.0000038147, 10.0000019073);
    path.cubicTo(20.0000038147, 15.5228500366, 15.5228500366, 20.0000038147,
        10.0000019073, 20.0000038147);
    path.cubicTo(4.4771533012, 20.0000038147, 0.0000000000, 15.5228500366,
        0.0000000000, 10.0000019073);
    path.cubicTo(0.0000000000, 4.4771533012, 4.4771533012, 0.0000000000,
        10.0000019073, 0.0000000000);
    path.cubicTo(15.5228500366, 0.0000000000, 20.0000038147, 4.4771533012,
        20.0000038147, 10.0000019073);
    path.close();
    return path;
  }

  static Path _build_3() {
    var path = Path();
    path.moveTo(20.0000038147, 10.0000019073);
    path.cubicTo(20.0000038147, 15.5228500366, 15.5228500366, 20.0000038147,
        10.0000019073, 20.0000038147);
    path.cubicTo(4.4771533012, 20.0000038147, 0.0000000000, 15.5228500366,
        0.0000000000, 10.0000019073);
    path.cubicTo(0.0000000000, 4.4771533012, 4.4771533012, 0.0000000000,
        10.0000019073, 0.0000000000);
    path.cubicTo(15.5228500366, 0.0000000000, 20.0000038147, 4.4771533012,
        20.0000038147, 10.0000019073);
    path.close();
    return path;
  }

  static Path _build_4() {
    var path = Path();
    path.moveTo(20.0000038147, 10.0000019073);
    path.cubicTo(20.0000038147, 15.5228500366, 15.5228500366, 20.0000038147,
        10.0000019073, 20.0000038147);
    path.cubicTo(4.4771533012, 20.0000038147, 0.0000000000, 15.5228500366,
        0.0000000000, 10.0000019073);
    path.cubicTo(0.0000000000, 4.4771533012, 4.4771533012, 0.0000000000,
        10.0000019073, 0.0000000000);
    path.cubicTo(15.5228500366, 0.0000000000, 20.0000038147, 4.4771533012,
        20.0000038147, 10.0000019073);
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
      fontSize: 12.0000000000,
      fontWeight: FontWeight.w700,
    );
  }

  ui.TextStyle ui_TextStyle_0;

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
