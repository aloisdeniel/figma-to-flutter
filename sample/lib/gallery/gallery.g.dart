import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Constraints1 extends StatelessWidget {
  Constraints1();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: Constraints1Painter());
  }
}

class Constraints1Painter extends CustomPainter {
  Constraints1Painter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(0.0, -195.0000000000);

// 342:63 : Constraints_1 (COMPONENT)
    var draw_342_63 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          0.0,
          195.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:0.0,t:195.0,r:0.0,b:0.0,w:132.0,h:132.0) */;
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

// 39:7 : bottom-left_cyan (ELLIPSE)
      var draw_39_7 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            16.0000000000,
            16.0000000000,
            (container.width - (33.0000000000)),
            (container.height -
                (33.0000000000))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:16.0,t:16.0,r:17.0,b:17.0,w:99.0,h:99.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 99.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 99.0000000000),
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
      draw_39_7(canvas, frame);

// 39:8 : center-right (ELLIPSE)
      var draw_39_8 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (-22.0000000000)),
            ((container.height / 2.0) - 9.0000000000),
            18.0000000000,
            18.0000000000) /* H:CENTER V:CENTER F:(l:88.0,t:57.0,r:26.0,b:26.0,w:18.0,h:18.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 18.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 18.0000000000),
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
      draw_39_8(canvas, frame);

// 39:10 : center-right (ELLIPSE)
      var draw_39_10 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (9.0000000000)),
            ((container.height / 2.0) - 38.0000000000),
            18.0000000000,
            18.0000000000) /* H:CENTER V:CENTER F:(l:57.0,t:28.0,r:57.0,b:57.0,w:18.0,h:18.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 18.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 18.0000000000),
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
          canvas.drawPath(path, _PaintCatalog.instance.paint_1);
        });
        canvas.restore();
      };
      draw_39_10(canvas, frame);

// 39:12 : top-center (ELLIPSE)
      var draw_39_12 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (9.0000000000)),
            0.0,
            18.0000000000,
            18.0000000000) /* H:CENTER V:TOP F:(l:57.0,t:0.0,r:57.0,b:57.0,w:18.0,h:18.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 18.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 18.0000000000),
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
          canvas.drawPath(path, _PaintCatalog.instance.paint_1);
        });
        canvas.restore();
      };
      draw_39_12(canvas, frame);

// 39:13 : bottom-center (ELLIPSE)
      var draw_39_13 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (9.0000000000)),
            (container.height - (17.0000000000)),
            18.0000000000,
            18.0000000000) /* H:CENTER V:BOTTOM F:(l:57.0,t:115.0,r:57.0,b:57.0,w:18.0,h:18.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 18.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 18.0000000000),
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
          canvas.drawPath(path, _PaintCatalog.instance.paint_1);
        });
        canvas.restore();
      };
      draw_39_13(canvas, frame);

// 39:14 : right-center (ELLIPSE)
      var draw_39_14 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            (container.width - (17.0000000000)),
            ((container.height / 2.0) - 9.0000000000),
            18.0000000000,
            18.0000000000) /* H:RIGHT V:CENTER F:(l:115.0,t:57.0,r:-1.0,b:-1.0,w:18.0,h:18.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 18.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 18.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_5.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_1);
        });
        canvas.restore();
      };
      draw_39_14(canvas, frame);

// 39:15 : right-center (ELLIPSE)
      var draw_39_15 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            0.0,
            ((container.height / 2.0) - 9.0000000000),
            18.0000000000,
            18.0000000000) /* H:LEFT V:CENTER F:(l:0.0,t:57.0,r:114.0,b:114.0,w:18.0,h:18.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 18.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 18.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_6.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_1);
        });
        canvas.restore();
      };
      draw_39_15(canvas, frame);

// 39:11 : center-right (ELLIPSE)
      var draw_39_11 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (9.0000000000)),
            ((container.height / 2.0) - -19.0000000000),
            18.0000000000,
            18.0000000000) /* H:CENTER V:CENTER F:(l:57.0,t:85.0,r:57.0,b:57.0,w:18.0,h:18.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 18.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 18.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_7.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_1);
        });
        canvas.restore();
      };
      draw_39_11(canvas, frame);

// 39:9 : center-left (ELLIPSE)
      var draw_39_9 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (41.0000000000)),
            ((container.height / 2.0) - 9.0000000000),
            18.0000000000,
            18.0000000000) /* H:CENTER V:CENTER F:(l:25.0,t:57.0,r:89.0,b:89.0,w:18.0,h:18.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 18.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 18.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_8.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_1);
        });
        canvas.restore();
      };
      draw_39_9(canvas, frame);

// 39:2 : top-left_red (ELLIPSE)
      var draw_39_2 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(0.0, 0.0, 17.0000000000,
            17.0000000000) /* H:LEFT V:TOP F:(l:0.0,t:0.0,r:115.0,b:115.0,w:17.0,h:17.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 17.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 17.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_9.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_2);
        });
        canvas.restore();
      };
      draw_39_2(canvas, frame);

// 39:3 : top-right_blue (ELLIPSE)
      var draw_39_3 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            (container.width - (17.0000000000)),
            0.0,
            17.0000000000,
            17.0000000000) /* H:RIGHT V:TOP F:(l:115.0,t:0.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 17.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 17.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_10.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_3);
        });
        canvas.restore();
      };
      draw_39_3(canvas, frame);

// 39:4 : bottom-right_purple (ELLIPSE)
      var draw_39_4 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            (container.width - (17.0000000000)),
            (container.height - (17.0000000000)),
            17.0000000000,
            17.0000000000) /* H:RIGHT V:BOTTOM F:(l:115.0,t:115.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 17.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 17.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_11.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_4);
        });
        canvas.restore();
      };
      draw_39_4(canvas, frame);

// 39:5 : bottom-left_cyan (ELLIPSE)
      var draw_39_5 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            0.0,
            (container.height - (17.0000000000)),
            17.0000000000,
            17.0000000000) /* H:LEFT V:BOTTOM F:(l:0.0,t:115.0,r:115.0,b:115.0,w:17.0,h:17.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 17.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 17.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_12.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_5);
        });
        canvas.restore();
      };
      draw_39_5(canvas, frame);

// 39:6 : center_yellow (ELLIPSE)
      var draw_39_6 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (9.0000000000)),
            ((container.height / 2.0) - 9.0000000000),
            17.0000000000,
            17.0000000000) /* H:CENTER V:CENTER F:(l:57.0,t:57.0,r:58.0,b:58.0,w:17.0,h:17.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 17.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 17.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_13.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_6);
        });
        canvas.restore();
      };
      draw_39_6(canvas, frame);
      canvas.restore();
    };
    draw_342_63(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(Constraints1Painter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(Constraints1Painter oldDelegate) {
    return false;
  }
}

class ConstraintsNested extends StatelessWidget {
  ConstraintsNested();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: ConstraintsNestedPainter());
  }
}

class ConstraintsNestedPainter extends CustomPainter {
  ConstraintsNestedPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-172.0000000000, -195.0000000000);

// 342:62 : Constraints_nested (COMPONENT)
    var draw_342_62 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          172.0000000000,
          195.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:172.0,t:195.0,r:-172.0,b:-172.0,w:713.0,h:363.0) */;
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

// 39:31 : top_left (FRAME)
      var draw_39_31 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(19.0000000000, 14.0000000000, 95.0000000000,
            95.0000000000) /* H:LEFT V:TOP F:(l:19.0,t:14.0,r:599.0,b:599.0,w:95.0,h:95.0) */;
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
            (Paint()..color = _ColorCatalog.instance.color_8));

// 39:32 : bottom-left_cyan (ELLIPSE)
        var draw_39_32 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              16.0000000000,
              16.0000000000,
              (container.width - (33.0000000000)),
              (container.height -
                  (33.0000000000))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:16.0,t:16.0,r:17.0,b:17.0,w:62.0,h:62.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 62.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 62.0000000000),
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
            _PathCatalog.instance.path_14.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_39_32(canvas, frame);

// 39:33 : center-right (ELLIPSE)
        var draw_39_33 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (-22.5000000000)),
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:70.0,t:39.0,r:7.0,b:7.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_15.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_33(canvas, frame);

// 39:34 : center-right (ELLIPSE)
        var draw_39_34 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (8.5000000000)),
              ((container.height / 2.0) - 37.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:39.0,t:10.0,r:38.0,b:38.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_16.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_34(canvas, frame);

// 39:35 : top-center (ELLIPSE)
        var draw_39_35 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (8.5000000000)),
              0.0,
              18.0000000000,
              18.0000000000) /* H:CENTER V:TOP F:(l:39.0,t:0.0,r:38.0,b:38.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_17.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_35(canvas, frame);

// 39:36 : bottom-center (ELLIPSE)
        var draw_39_36 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (8.5000000000)),
              (container.height - (17.0000000000)),
              18.0000000000,
              18.0000000000) /* H:CENTER V:BOTTOM F:(l:39.0,t:78.0,r:38.0,b:38.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_18.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_36(canvas, frame);

// 39:37 : right-center (ELLIPSE)
        var draw_39_37 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:RIGHT V:CENTER F:(l:78.0,t:39.0,r:-1.0,b:-1.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_19.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_37(canvas, frame);

// 39:38 : right-center (ELLIPSE)
        var draw_39_38 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:LEFT V:CENTER F:(l:0.0,t:39.0,r:77.0,b:77.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_20.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_38(canvas, frame);

// 39:39 : center-right (ELLIPSE)
        var draw_39_39 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (8.5000000000)),
              ((container.height / 2.0) - -19.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:39.0,t:67.0,r:38.0,b:38.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_21.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_39(canvas, frame);

// 39:40 : center-left (ELLIPSE)
        var draw_39_40 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (40.5000000000)),
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:7.0,t:39.0,r:70.0,b:70.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_22.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_40(canvas, frame);

// 39:41 : top-left_red (ELLIPSE)
        var draw_39_41 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(0.0, 0.0, 17.0000000000,
              17.0000000000) /* H:LEFT V:TOP F:(l:0.0,t:0.0,r:78.0,b:78.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_23.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_2);
          });
          canvas.restore();
        };
        draw_39_41(canvas, frame);

// 39:42 : top-right_blue (ELLIPSE)
        var draw_39_42 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              0.0,
              17.0000000000,
              17.0000000000) /* H:RIGHT V:TOP F:(l:78.0,t:0.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_24.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_3);
          });
          canvas.restore();
        };
        draw_39_42(canvas, frame);

// 39:43 : bottom-right_purple (ELLIPSE)
        var draw_39_43 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              (container.height - (17.0000000000)),
              17.0000000000,
              17.0000000000) /* H:RIGHT V:BOTTOM F:(l:78.0,t:78.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_25.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_4);
          });
          canvas.restore();
        };
        draw_39_43(canvas, frame);

// 39:44 : bottom-left_cyan (ELLIPSE)
        var draw_39_44 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              (container.height - (17.0000000000)),
              17.0000000000,
              17.0000000000) /* H:LEFT V:BOTTOM F:(l:0.0,t:78.0,r:78.0,b:78.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_26.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_5);
          });
          canvas.restore();
        };
        draw_39_44(canvas, frame);

// 39:45 : center_yellow (ELLIPSE)
        var draw_39_45 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (8.5000000000)),
              ((container.height / 2.0) - 8.5000000000),
              17.0000000000,
              17.0000000000) /* H:CENTER V:CENTER F:(l:39.0,t:39.0,r:39.0,b:39.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_27.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_6);
          });
          canvas.restore();
        };
        draw_39_45(canvas, frame);
        canvas.restore();
      };
      draw_39_31(canvas, frame);

// 39:91 : center (FRAME)
      var draw_39_91 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            115.0000000000,
            109.0000000000,
            (container.width - (227.0000000000)),
            (container.height -
                (216.0000000000))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:115.0,t:109.0,r:112.0,b:112.0,w:486.0,h:147.0) */;
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
            (Paint()..color = _ColorCatalog.instance.color_9));

// 39:92 : bottom-left_cyan (ELLIPSE)
        var draw_39_92 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              16.0000000000,
              16.0000000000,
              (container.width - (33.0000000000)),
              (container.height -
                  (33.0000000000))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:16.0,t:16.0,r:17.0,b:17.0,w:453.0,h:114.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 453.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 114.0000000000),
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
            _PathCatalog.instance.path_28.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_7);
          });
          canvas.restore();
        };
        draw_39_92(canvas, frame);

// 39:93 : center-right (ELLIPSE)
        var draw_39_93 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (-22.0000000000)),
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:265.0,t:65.0,r:203.0,b:203.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_29.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_93(canvas, frame);

// 39:94 : center-right (ELLIPSE)
        var draw_39_94 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              ((container.height / 2.0) - 37.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:234.0,t:36.0,r:234.0,b:234.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_30.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_94(canvas, frame);

// 39:95 : top-center (ELLIPSE)
        var draw_39_95 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              0.0,
              18.0000000000,
              18.0000000000) /* H:CENTER V:TOP F:(l:234.0,t:0.0,r:234.0,b:234.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_31.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_95(canvas, frame);

// 39:96 : bottom-center (ELLIPSE)
        var draw_39_96 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              (container.height - (17.0000000000)),
              18.0000000000,
              18.0000000000) /* H:CENTER V:BOTTOM F:(l:234.0,t:130.0,r:234.0,b:234.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_32.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_96(canvas, frame);

// 39:97 : right-center (ELLIPSE)
        var draw_39_97 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:RIGHT V:CENTER F:(l:469.0,t:65.0,r:-1.0,b:-1.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_33.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_97(canvas, frame);

// 39:98 : right-center (ELLIPSE)
        var draw_39_98 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:LEFT V:CENTER F:(l:0.0,t:65.0,r:468.0,b:468.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_34.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_98(canvas, frame);

// 39:99 : center-right (ELLIPSE)
        var draw_39_99 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              ((container.height / 2.0) - -19.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:234.0,t:93.0,r:234.0,b:234.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_35.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_99(canvas, frame);

// 39:100 : center-left (ELLIPSE)
        var draw_39_100 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (41.0000000000)),
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:202.0,t:65.0,r:266.0,b:266.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_36.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_100(canvas, frame);

// 39:101 : top-left_red (ELLIPSE)
        var draw_39_101 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(0.0, 0.0, 17.0000000000,
              17.0000000000) /* H:LEFT V:TOP F:(l:0.0,t:0.0,r:469.0,b:469.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_37.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_2);
          });
          canvas.restore();
        };
        draw_39_101(canvas, frame);

// 39:102 : top-right_blue (ELLIPSE)
        var draw_39_102 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              0.0,
              17.0000000000,
              17.0000000000) /* H:RIGHT V:TOP F:(l:469.0,t:0.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_38.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_3);
          });
          canvas.restore();
        };
        draw_39_102(canvas, frame);

// 39:103 : bottom-right_purple (ELLIPSE)
        var draw_39_103 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              (container.height - (17.0000000000)),
              17.0000000000,
              17.0000000000) /* H:RIGHT V:BOTTOM F:(l:469.0,t:130.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_39.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_4);
          });
          canvas.restore();
        };
        draw_39_103(canvas, frame);

// 39:104 : bottom-left_cyan (ELLIPSE)
        var draw_39_104 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              (container.height - (17.0000000000)),
              17.0000000000,
              17.0000000000) /* H:LEFT V:BOTTOM F:(l:0.0,t:130.0,r:469.0,b:469.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_40.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_5);
          });
          canvas.restore();
        };
        draw_39_104(canvas, frame);

// 39:105 : center_yellow (ELLIPSE)
        var draw_39_105 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              ((container.height / 2.0) - 8.5000000000),
              17.0000000000,
              17.0000000000) /* H:CENTER V:CENTER F:(l:234.0,t:65.0,r:235.0,b:235.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_41.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_6);
          });
          canvas.restore();
        };
        draw_39_105(canvas, frame);
        canvas.restore();
      };
      draw_39_91(canvas, frame);

// 39:46 : top_right (FRAME)
      var draw_39_46 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            (container.width - (112.0000000000)),
            13.0000000000,
            98.0000000000,
            98.0000000000) /* H:RIGHT V:TOP F:(l:601.0,t:13.0,r:14.0,b:14.0,w:98.0,h:98.0) */;
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
            (Paint()..color = _ColorCatalog.instance.color_8));

// 39:47 : bottom-left_cyan (ELLIPSE)
        var draw_39_47 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              16.0000000000,
              16.0000000000,
              (container.width - (33.0000000000)),
              (container.height -
                  (33.0000000000))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:16.0,t:16.0,r:17.0,b:17.0,w:65.0,h:65.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 65.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 65.0000000000),
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
            _PathCatalog.instance.path_42.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_39_47(canvas, frame);

// 39:48 : center-right (ELLIPSE)
        var draw_39_48 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (-22.0000000000)),
              ((container.height / 2.0) - 9.0000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:71.0,t:40.0,r:9.0,b:9.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_43.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_48(canvas, frame);

// 39:49 : center-right (ELLIPSE)
        var draw_39_49 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              ((container.height / 2.0) - 38.0000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:40.0,t:11.0,r:40.0,b:40.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_44.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_49(canvas, frame);

// 39:50 : top-center (ELLIPSE)
        var draw_39_50 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              0.0,
              18.0000000000,
              18.0000000000) /* H:CENTER V:TOP F:(l:40.0,t:0.0,r:40.0,b:40.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_45.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_50(canvas, frame);

// 39:51 : bottom-center (ELLIPSE)
        var draw_39_51 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              (container.height - (17.0000000000)),
              18.0000000000,
              18.0000000000) /* H:CENTER V:BOTTOM F:(l:40.0,t:81.0,r:40.0,b:40.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_46.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_51(canvas, frame);

// 39:52 : right-center (ELLIPSE)
        var draw_39_52 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              ((container.height / 2.0) - 9.0000000000),
              18.0000000000,
              18.0000000000) /* H:RIGHT V:CENTER F:(l:81.0,t:40.0,r:-1.0,b:-1.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_47.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_52(canvas, frame);

// 39:53 : right-center (ELLIPSE)
        var draw_39_53 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              ((container.height / 2.0) - 9.0000000000),
              18.0000000000,
              18.0000000000) /* H:LEFT V:CENTER F:(l:0.0,t:40.0,r:80.0,b:80.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_48.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_53(canvas, frame);

// 39:54 : center-right (ELLIPSE)
        var draw_39_54 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              ((container.height / 2.0) - -19.0000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:40.0,t:68.0,r:40.0,b:40.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_49.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_54(canvas, frame);

// 39:55 : center-left (ELLIPSE)
        var draw_39_55 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (41.0000000000)),
              ((container.height / 2.0) - 9.0000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:8.0,t:40.0,r:72.0,b:72.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_50.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_55(canvas, frame);

// 39:56 : top-left_red (ELLIPSE)
        var draw_39_56 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(0.0, 0.0, 17.0000000000,
              17.0000000000) /* H:LEFT V:TOP F:(l:0.0,t:0.0,r:81.0,b:81.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_51.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_2);
          });
          canvas.restore();
        };
        draw_39_56(canvas, frame);

// 39:57 : top-right_blue (ELLIPSE)
        var draw_39_57 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              0.0,
              17.0000000000,
              17.0000000000) /* H:RIGHT V:TOP F:(l:81.0,t:0.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_52.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_3);
          });
          canvas.restore();
        };
        draw_39_57(canvas, frame);

// 39:58 : bottom-right_purple (ELLIPSE)
        var draw_39_58 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              (container.height - (17.0000000000)),
              17.0000000000,
              17.0000000000) /* H:RIGHT V:BOTTOM F:(l:81.0,t:81.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_53.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_4);
          });
          canvas.restore();
        };
        draw_39_58(canvas, frame);

// 39:59 : bottom-left_cyan (ELLIPSE)
        var draw_39_59 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              (container.height - (17.0000000000)),
              17.0000000000,
              17.0000000000) /* H:LEFT V:BOTTOM F:(l:0.0,t:81.0,r:81.0,b:81.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_54.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_5);
          });
          canvas.restore();
        };
        draw_39_59(canvas, frame);

// 39:60 : center_yellow (ELLIPSE)
        var draw_39_60 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              ((container.height / 2.0) - 9.0000000000),
              17.0000000000,
              17.0000000000) /* H:CENTER V:CENTER F:(l:40.0,t:40.0,r:41.0,b:41.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_55.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_6);
          });
          canvas.restore();
        };
        draw_39_60(canvas, frame);
        canvas.restore();
      };
      draw_39_46(canvas, frame);

// 39:61 : bottom_right (FRAME)
      var draw_39_61 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            (container.width - (112.0000000000)),
            (container.height - (109.0000000000)),
            99.0000000000,
            99.0000000000) /* H:RIGHT V:BOTTOM F:(l:601.0,t:254.0,r:13.0,b:13.0,w:99.0,h:99.0) */;
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
            (Paint()..color = _ColorCatalog.instance.color_8));

// 39:62 : bottom-left_cyan (ELLIPSE)
        var draw_39_62 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              16.0000000000,
              16.0000000000,
              (container.width - (33.0000000000)),
              (container.height -
                  (33.0000000000))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:16.0,t:16.0,r:17.0,b:17.0,w:66.0,h:66.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 66.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 66.0000000000),
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
            _PathCatalog.instance.path_56.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_39_62(canvas, frame);

// 39:63 : center-right (ELLIPSE)
        var draw_39_63 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (-22.5000000000)),
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:72.0,t:41.0,r:9.0,b:9.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_57.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_63(canvas, frame);

// 39:64 : center-right (ELLIPSE)
        var draw_39_64 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (8.5000000000)),
              ((container.height / 2.0) - 37.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:41.0,t:12.0,r:40.0,b:40.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_58.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_64(canvas, frame);

// 39:65 : top-center (ELLIPSE)
        var draw_39_65 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (8.5000000000)),
              0.0,
              18.0000000000,
              18.0000000000) /* H:CENTER V:TOP F:(l:41.0,t:0.0,r:40.0,b:40.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_59.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_65(canvas, frame);

// 39:66 : bottom-center (ELLIPSE)
        var draw_39_66 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (8.5000000000)),
              (container.height - (17.0000000000)),
              18.0000000000,
              18.0000000000) /* H:CENTER V:BOTTOM F:(l:41.0,t:82.0,r:40.0,b:40.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_60.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_66(canvas, frame);

// 39:67 : right-center (ELLIPSE)
        var draw_39_67 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:RIGHT V:CENTER F:(l:82.0,t:41.0,r:-1.0,b:-1.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_61.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_67(canvas, frame);

// 39:68 : right-center (ELLIPSE)
        var draw_39_68 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:LEFT V:CENTER F:(l:0.0,t:41.0,r:81.0,b:81.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_62.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_68(canvas, frame);

// 39:69 : center-right (ELLIPSE)
        var draw_39_69 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (8.5000000000)),
              ((container.height / 2.0) - -19.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:41.0,t:69.0,r:40.0,b:40.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_63.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_69(canvas, frame);

// 39:70 : center-left (ELLIPSE)
        var draw_39_70 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (40.5000000000)),
              ((container.height / 2.0) - 8.5000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:9.0,t:41.0,r:72.0,b:72.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_64.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_70(canvas, frame);

// 39:71 : top-left_red (ELLIPSE)
        var draw_39_71 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(0.0, 0.0, 17.0000000000,
              17.0000000000) /* H:LEFT V:TOP F:(l:0.0,t:0.0,r:82.0,b:82.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_65.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_2);
          });
          canvas.restore();
        };
        draw_39_71(canvas, frame);

// 39:72 : top-right_blue (ELLIPSE)
        var draw_39_72 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              0.0,
              17.0000000000,
              17.0000000000) /* H:RIGHT V:TOP F:(l:82.0,t:0.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_66.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_3);
          });
          canvas.restore();
        };
        draw_39_72(canvas, frame);

// 39:73 : bottom-right_purple (ELLIPSE)
        var draw_39_73 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              (container.height - (17.0000000000)),
              17.0000000000,
              17.0000000000) /* H:RIGHT V:BOTTOM F:(l:82.0,t:82.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_67.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_4);
          });
          canvas.restore();
        };
        draw_39_73(canvas, frame);

// 39:74 : bottom-left_cyan (ELLIPSE)
        var draw_39_74 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              (container.height - (17.0000000000)),
              17.0000000000,
              17.0000000000) /* H:LEFT V:BOTTOM F:(l:0.0,t:82.0,r:82.0,b:82.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_68.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_5);
          });
          canvas.restore();
        };
        draw_39_74(canvas, frame);

// 39:75 : center_yellow (ELLIPSE)
        var draw_39_75 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (8.5000000000)),
              ((container.height / 2.0) - 8.5000000000),
              17.0000000000,
              17.0000000000) /* H:CENTER V:CENTER F:(l:41.0,t:41.0,r:41.0,b:41.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_69.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_6);
          });
          canvas.restore();
        };
        draw_39_75(canvas, frame);
        canvas.restore();
      };
      draw_39_61(canvas, frame);

// 39:76 : bottom_left (FRAME)
      var draw_39_76 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            18.0000000000,
            (container.height - (107.0000000000)),
            96.0000000000,
            96.0000000000) /* H:LEFT V:BOTTOM F:(l:18.0,t:256.0,r:599.0,b:599.0,w:96.0,h:96.0) */;
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
            (Paint()..color = _ColorCatalog.instance.color_8));

// 39:77 : bottom-left_cyan (ELLIPSE)
        var draw_39_77 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              16.0000000000,
              16.0000000000,
              (container.width - (33.0000000000)),
              (container.height -
                  (33.0000000000))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:16.0,t:16.0,r:17.0,b:17.0,w:63.0,h:63.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 63.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 63.0000000000),
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
            _PathCatalog.instance.path_70.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_39_77(canvas, frame);

// 39:78 : center-right (ELLIPSE)
        var draw_39_78 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (-22.0000000000)),
              ((container.height / 2.0) - 9.0000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:70.0,t:39.0,r:8.0,b:8.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_71.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_78(canvas, frame);

// 39:79 : center-right (ELLIPSE)
        var draw_39_79 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              ((container.height / 2.0) - 38.0000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:39.0,t:10.0,r:39.0,b:39.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_72.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_79(canvas, frame);

// 39:80 : top-center (ELLIPSE)
        var draw_39_80 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              0.0,
              18.0000000000,
              18.0000000000) /* H:CENTER V:TOP F:(l:39.0,t:0.0,r:39.0,b:39.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_73.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_80(canvas, frame);

// 39:81 : bottom-center (ELLIPSE)
        var draw_39_81 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              (container.height - (17.0000000000)),
              18.0000000000,
              18.0000000000) /* H:CENTER V:BOTTOM F:(l:39.0,t:79.0,r:39.0,b:39.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_74.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_81(canvas, frame);

// 39:82 : right-center (ELLIPSE)
        var draw_39_82 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              ((container.height / 2.0) - 9.0000000000),
              18.0000000000,
              18.0000000000) /* H:RIGHT V:CENTER F:(l:79.0,t:39.0,r:-1.0,b:-1.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_75.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_82(canvas, frame);

// 39:83 : right-center (ELLIPSE)
        var draw_39_83 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              ((container.height / 2.0) - 9.0000000000),
              18.0000000000,
              18.0000000000) /* H:LEFT V:CENTER F:(l:0.0,t:39.0,r:78.0,b:78.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_76.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_83(canvas, frame);

// 39:84 : center-right (ELLIPSE)
        var draw_39_84 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              ((container.height / 2.0) - -19.0000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:39.0,t:67.0,r:39.0,b:39.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_77.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_84(canvas, frame);

// 39:85 : center-left (ELLIPSE)
        var draw_39_85 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (41.0000000000)),
              ((container.height / 2.0) - 9.0000000000),
              18.0000000000,
              18.0000000000) /* H:CENTER V:CENTER F:(l:7.0,t:39.0,r:71.0,b:71.0,w:18.0,h:18.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 18.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 18.0000000000),
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
            _PathCatalog.instance.path_78.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_39_85(canvas, frame);

// 39:86 : top-left_red (ELLIPSE)
        var draw_39_86 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(0.0, 0.0, 17.0000000000,
              17.0000000000) /* H:LEFT V:TOP F:(l:0.0,t:0.0,r:79.0,b:79.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_79.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_2);
          });
          canvas.restore();
        };
        draw_39_86(canvas, frame);

// 39:87 : top-right_blue (ELLIPSE)
        var draw_39_87 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              0.0,
              17.0000000000,
              17.0000000000) /* H:RIGHT V:TOP F:(l:79.0,t:0.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_80.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_3);
          });
          canvas.restore();
        };
        draw_39_87(canvas, frame);

// 39:88 : bottom-right_purple (ELLIPSE)
        var draw_39_88 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (17.0000000000)),
              (container.height - (17.0000000000)),
              17.0000000000,
              17.0000000000) /* H:RIGHT V:BOTTOM F:(l:79.0,t:79.0,r:0.0,b:0.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_81.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_4);
          });
          canvas.restore();
        };
        draw_39_88(canvas, frame);

// 39:89 : bottom-left_cyan (ELLIPSE)
        var draw_39_89 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              (container.height - (17.0000000000)),
              17.0000000000,
              17.0000000000) /* H:LEFT V:BOTTOM F:(l:0.0,t:79.0,r:79.0,b:79.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_82.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_5);
          });
          canvas.restore();
        };
        draw_39_89(canvas, frame);

// 39:90 : center_yellow (ELLIPSE)
        var draw_39_90 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (9.0000000000)),
              ((container.height / 2.0) - 9.0000000000),
              17.0000000000,
              17.0000000000) /* H:CENTER V:CENTER F:(l:39.0,t:39.0,r:40.0,b:40.0,w:17.0,h:17.0) */;
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
          var transform = Float64List.fromList([
            (frame.width / 17.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 17.0000000000),
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
            _PathCatalog.instance.path_83.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_6);
          });
          canvas.restore();
        };
        draw_39_90(canvas, frame);
        canvas.restore();
      };
      draw_39_76(canvas, frame);
      canvas.restore();
    };
    draw_342_62(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(ConstraintsNestedPainter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(ConstraintsNestedPainter oldDelegate) {
    return false;
  }
}

class LandscapeSimple extends StatelessWidget {
  LandscapeSimple();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: LandscapeSimplePainter());
  }
}

class LandscapeSimplePainter extends CustomPainter {
  LandscapeSimplePainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(12.0000000000, -750.0000000000);

// 342:68 : Landscape_simple (COMPONENT)
    var draw_342_68 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          -12.0000000000,
          750.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:-12.0,t:750.0,r:12.0,b:12.0,w:261.0,h:299.0) */;
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
          (Paint()..color = _ColorCatalog.instance.color_10));

// 20:1 : Ellipse (ELLIPSE)
      var draw_20_1 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            (container.width - (64.0000000000)),
            15.0000000000,
            49.0000000000,
            49.0000000000) /* H:RIGHT V:TOP F:(l:197.0,t:15.0,r:15.0,b:15.0,w:49.0,h:49.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 49.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 49.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_84.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_8);
        });
        var strokes = [_PaintCatalog.instance.paint_9];
        var strokeGeometry = [
          _PathCatalog.instance.path_85.transform(transform)
        ];
        strokes.forEach((paint) {
          strokeGeometry.forEach((path) {
            canvas.drawPath(path, paint);
          });
        });
        canvas.restore();
      };
      draw_20_1(canvas, frame);

// 20:2 : Rectangle (VECTOR)
      var draw_20_2 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            0.0,
            (container.height - (72.7778015137)),
            (container.width - (0.0)),
            72.7777786255) /* H:LEFT_RIGHT V:BOTTOM F:(l:0.0,t:226.22219848632812,r:0.0,b:0.0,w:261.0,h:72.77777862548828) */;
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
        var transform = Float64List.fromList([
          (frame.width / 261.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 72.7777786255),
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
        var fillGeometry = [_PathCatalog.instance.path_86.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_10);
        });
        canvas.restore();
      };
      draw_20_2(canvas, frame);

// 20:3 : Rectangle 2 (RECTANGLE)
      var draw_20_3 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            36.0000000000,
            (container.height - (97.0000000000)),
            10.0000000000,
            65.0000000000) /* H:LEFT V:BOTTOM F:(l:36.0,t:202.0,r:215.0,b:215.0,w:10.0,h:65.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 10.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 65.0000000000),
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
          Path()
            ..addRRect(RRect.fromRectAndRadius(
                Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                Radius.circular(13.0)))
        ];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_11);
        });
        canvas.restore();
      };
      draw_20_3(canvas, frame);

// 20:4 : Ellipse 2 (VECTOR)
      var draw_20_4 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            12.0000000000,
            (container.height - (172.0000000000)),
            58.0000000000,
            92.0000000000) /* H:LEFT V:BOTTOM F:(l:12.0,t:127.0,r:191.0,b:191.0,w:58.0,h:92.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 58.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 92.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_87.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_12);
        });
        canvas.restore();
      };
      draw_20_4(canvas, frame);

// 56:6 : Cloud (BOOLEAN_OPERATION)
      var draw_56_6 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(12.0000000000, 24.0000000000, 99.0000000000,
            52.0000000000) /* H:LEFT V:TOP F:(l:12.0,t:24.0,r:150.0,b:150.0,w:99.0,h:52.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 99.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 52.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_88.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_13);
        });
        canvas.restore();
      };
      draw_56_6(canvas, frame);

// 56:7 : Cloud (BOOLEAN_OPERATION)
      var draw_56_7 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(89.0000000000, 31.0000000000, 83.0000000000,
            58.0000000000) /* H:LEFT V:TOP F:(l:89.0,t:31.0,r:89.0,b:89.0,w:83.0,h:58.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 83.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 58.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_89.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_13);
        });
        canvas.restore();
      };
      draw_56_7(canvas, frame);
      canvas.restore();
    };
    draw_342_68(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(LandscapeSimplePainter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(LandscapeSimplePainter oldDelegate) {
    return false;
  }
}

class LandscapeEffects extends StatelessWidget {
  LandscapeEffects();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: LandscapeEffectsPainter());
  }
}

class LandscapeEffectsPainter extends CustomPainter {
  LandscapeEffectsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-261.0000000000, -750.0000000000);

// 342:65 : Landscape_effects (COMPONENT)
    var draw_342_65 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          261.0000000000,
          750.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:261.0,t:750.0,r:-261.0,b:-261.0,w:268.0,h:299.0) */;
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
          (Paint()..color = _ColorCatalog.instance.color_10));

// 1:4 : Ellipse (ELLIPSE)
      var draw_1_4 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            (container.width - (64.0000000000)),
            15.0000000000,
            49.0000000000,
            49.0000000000) /* H:RIGHT V:TOP F:(l:204.0,t:15.0,r:15.0,b:15.0,w:49.0,h:49.0) */;
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
        var transform = Float64List.fromList([
          (frame.width / 49.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 49.0000000000),
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
        var fillGeometry = [_PathCatalog.instance.path_90.transform(transform)];
        fillGeometry.forEach((path) {
          var effectPaint = _EffectCatalog.instance.paint_0;
          canvas.drawPath(path, effectPaint);
        });
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_8);
        });
        canvas.restore();
      };
      draw_1_4(canvas, frame);

// 82:0 : SUUN (TEXT)
      var draw_82_0 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            (container.width - (78.0000000000)),
            18.0000000000,
            51.0000000000,
            43.0000000000) /* H:RIGHT V:TOP F:(l:190.0,t:18.0,r:27.0,b:27.0,w:51.0,h:43.0) */;
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
        var style_0 = _TextStyleCatalog.instance.ui_TextStyle_0;
        var style_2 = _TextStyleCatalog.instance.ui_TextStyle_1;
        var style_8 = _TextStyleCatalog.instance.ui_TextStyle_2;
        var style_11 = _TextStyleCatalog.instance.ui_TextStyle_3;
        var paragraphStyle = ui.ParagraphStyle(
          fontFamily: 'Roboto',
          textAlign: TextAlign.right,
          fontSize: 11.0000000000,
          fontWeight: FontWeight.w400,
        );
        var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(style_0);
        paragraphBuilder.pushStyle(style_2);
        paragraphBuilder.addText("S");
        paragraphBuilder.pushStyle(style_8);
        paragraphBuilder.addText("UU");
        paragraphBuilder.pushStyle(style_11);
        paragraphBuilder.addText("N");
        var paragraph = paragraphBuilder.build();
        paragraph.layout(new ui.ParagraphConstraints(width: frame.width));
        canvas.drawParagraph(paragraph, Offset.zero);
        canvas.restore();
      };
      draw_82_0(canvas, frame);

// 1:5 : Rectangle (VECTOR)
      var draw_1_5 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            0.0,
            (container.height - (72.7778015137)),
            (container.width - (0.0)),
            72.7777786255) /* H:LEFT_RIGHT V:BOTTOM F:(l:0.0,t:226.22219848632812,r:0.0,b:0.0,w:268.0,h:72.77777862548828) */;
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
        var transform = Float64List.fromList([
          (frame.width / 268.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 72.7777786255),
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
        var fillGeometry = [_PathCatalog.instance.path_91.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_10);
        });
        canvas.restore();
      };
      draw_1_5(canvas, frame);

// 342:64 : A forest tree! (INSTANCE)
      var draw_342_64 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            12.0000000000,
            (container.height - (161.0000000000)),
            57.9999961853,
            139.9999389648) /* H:LEFT V:BOTTOM F:(l:12.0,t:138.0,r:198.00000381469727,b:198.00000381469727,w:57.999996185302734,h:139.99993896484375) */;
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
            (Paint()..color = _ColorCatalog.instance.color_19));

// I342:64;1:6 : Rectangle 2 (RECTANGLE)
        var draw_I342_64__1_6 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(23.9999389648, 74.9999389648, 10.0000000000,
              65.0000000000) /* H:SCALE V:SCALE F:(l:23.99993896484375,t:74.99993896484375,r:24.000057220458984,b:24.000057220458984,w:10.0,h:65.0) */;
          canvas.save();
          canvas.scale((container.width) / 57.9999961853,
              (container.height) / 139.9999389648);
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
          var transform = Float64List.fromList([
            (frame.width / 10.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 65.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(13.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_11);
          });
          canvas.restore();
        };
        draw_I342_64__1_6(canvas, frame);

// I342:64;1:7 : Ellipse 2 (VECTOR)
        var draw_I342_64__1_7 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(0.0, 0.0000000000, 58.0000000000,
              92.0000000000) /* H:SCALE V:SCALE F:(l:0.0,t:7.105427357601002e-15,r:-0.000003814697265625,b:-0.000003814697265625,w:58.0,h:92.0) */;
          canvas.save();
          canvas.scale((container.width) / 57.9999961853,
              (container.height) / 139.9999389648);
          canvas.transform(Float64List.fromList([
            0.9999999404,
            -0.0000000000,
            0.0,
            0.0,
            0.0000000000,
            0.9999999404,
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
            (frame.width / 58.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 92.0000000000),
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
            _PathCatalog.instance.path_92.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(
                path,
                (Paint()
                  ..shader = LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 0.9999999999999998),
                          stops: [0.0, 1.0],
                          colors: [
                            _ColorCatalog.instance.color_15,
                            _ColorCatalog.instance.color_20
                          ],
                          tileMode: TileMode.clamp)
                      .createShader(Offset.zero & frame.size)));
          });
          canvas.restore();
        };
        draw_I342_64__1_7(canvas, frame);
        canvas.restore();
      };
      draw_342_64(canvas, frame);

// 152:1 : A forest tree! (INSTANCE)
      var draw_152_1 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            82.9999389648,
            (container.height - (151.0000610352)),
            42.0000000000,
            102.0000000000) /* H:LEFT V:BOTTOM F:(l:82.99993896484375,t:147.99993896484375,r:143.00006103515625,b:143.00006103515625,w:42.0,h:102.0) */;
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
            (Paint()..color = _ColorCatalog.instance.color_19));

// I152:1;1:6 : Rectangle 2 (RECTANGLE)
        var draw_I152_1__1_6 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(17.3792667389, 54.6428375244, 7.2413792610,
              47.3571624756) /* H:SCALE V:SCALE F:(l:17.3792667388916,t:54.64283752441406,r:17.379354000091553,b:17.379354000091553,w:7.241379261016846,h:47.35716247558594) */;
          canvas.save();
          canvas.scale((container.width) / 42.0000000000,
              (container.height) / 102.0000000000);
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
          var transform = Float64List.fromList([
            (frame.width / 7.2413792610),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 47.3571624756),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(13.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_11);
          });
          canvas.restore();
        };
        draw_I152_1__1_6(canvas, frame);

// I152:1;1:7 : Ellipse 2 (VECTOR)
        var draw_I152_1__1_7 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(0.0, 0.0000000000, 42.0000000000,
              67.0285949707) /* H:SCALE V:SCALE F:(l:0.0,t:7.105427357601002e-15,r:0.0,b:0.0,w:42.0,h:67.02859497070312) */;
          canvas.save();
          canvas.scale((container.width) / 42.0000000000,
              (container.height) / 102.0000000000);
          canvas.transform(Float64List.fromList([
            0.9999999404,
            -0.0000000000,
            0.0,
            0.0,
            0.0000000000,
            0.9999999404,
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
            (frame.width / 42.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 67.0285949707),
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
            _PathCatalog.instance.path_93.transform(transform)
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(
                path,
                (Paint()
                  ..shader = LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 0.9999999999999998),
                          stops: [0.0, 1.0],
                          colors: [
                            _ColorCatalog.instance.color_15,
                            _ColorCatalog.instance.color_20
                          ],
                          tileMode: TileMode.clamp)
                      .createShader(Offset.zero & frame.size)));
          });
          canvas.restore();
        };
        draw_I152_1__1_7(canvas, frame);
        canvas.restore();
      };
      draw_152_1(canvas, frame);
      canvas.restore();
    };
    draw_342_65(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(LandscapeEffectsPainter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(LandscapeEffectsPainter oldDelegate) {
    return false;
  }
}

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
          (Paint()..color = _ColorCatalog.instance.color_19));

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
        var fillGeometry = [_PathCatalog.instance.path_94.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_14);
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
          canvas.drawPath(path, _PaintCatalog.instance.paint_14);
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
        var fillGeometry = [_PathCatalog.instance.path_95.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_15);
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
          canvas.drawPath(path, _PaintCatalog.instance.paint_15);
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
        var fillGeometry = [_PathCatalog.instance.path_96.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_16);
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
        var fillGeometry = [_PathCatalog.instance.path_97.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_17);
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
          canvas.drawPath(path, _PaintCatalog.instance.paint_17);
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
        var fillGeometry = [_PathCatalog.instance.path_98.transform(transform)];
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_18);
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
          canvas.drawPath(path, _PaintCatalog.instance.paint_18);
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

class Goups extends StatelessWidget {
  Goups();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: GoupsPainter());
  }
}

class GoupsPainter extends CustomPainter {
  GoupsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-3.0000000000, 1041.0000000000);

// 342:69 : Goups (COMPONENT)
    var draw_342_69 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          3.0000000000,
          -1041.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:3.0,t:-1041.0,r:-3.0,b:-3.0,w:267.0,h:174.0) */;
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

// 307:4 : Group (GROUP)
      var draw_307_4 = (Canvas canvas, Rect container) {
// 307:1 : Rectangle (RECTANGLE)
        var draw_307_1 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (-0.7045745850)),
              ((container.height / 2.0) - 51.0000000000),
              71.0000000000,
              71.0000000000) /* H:CENTER V:CENTER F:(l:134.20457458496094,t:36.0,r:61.79542541503906,b:61.79542541503906,w:71.0,h:71.0) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.7071067095,
            0.7071068529,
            0.0,
            0.0,
            -0.7071068529,
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
            (frame.width / 71.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 71.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(14.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_307_1(canvas, frame);

// 307:2 : Rectangle (RECTANGLE)
        var draw_307_2 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (-0.7045745850)),
              ((container.height / 2.0) - 51.0000000000),
              20.0000000000,
              20.0000000000) /* H:CENTER V:CENTER F:(l:134.20457458496094,t:36.0,r:112.79542541503906,b:112.79542541503906,w:20.0,h:20.0) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.7071067095,
            0.7071068529,
            0.0,
            0.0,
            -0.7071068529,
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
            (frame.width / 20.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 20.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(7.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_17);
          });
          canvas.restore();
        };
        draw_307_2(canvas, frame);

// 307:3 : Rectangle (RECTANGLE)
        var draw_307_3 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (103.7954294422)),
              (container.height - (57.8751186042)),
              20.0000000000,
              20.0000000000) /* H:RIGHT V:BOTTOM F:(l:163.20457055776023,t:116.12488139576271,r:83.79542944223977,b:83.79542944223977,w:20.0,h:20.0) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.7071067095,
            0.7071068529,
            0.0,
            0.0,
            -0.7071068529,
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
            (frame.width / 20.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 20.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(7.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_14);
          });
          canvas.restore();
        };
        draw_307_3(canvas, frame);
      };
      draw_307_4(canvas, frame);
      canvas.restore();
    };
    draw_342_69(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(GoupsPainter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(GoupsPainter oldDelegate) {
    return false;
  }
}

class MultiGoups extends StatelessWidget {
  MultiGoups();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: MultiGoupsPainter());
  }
}

class MultiGoupsPainter extends CustomPainter {
  MultiGoupsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(2.0000000000, 1356.0000000000);

// 349:63 : MultiGoups (COMPONENT)
    var draw_349_63 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          -2.0000000000,
          -1356.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:-2.0,t:-1356.0,r:2.0,b:2.0,w:377.0,h:245.0) */;
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

// 349:55 : Group (GROUP)
      var draw_349_55 = (Canvas canvas, Rect container) {
// 349:59 : Group (GROUP)
        var draw_349_59 = (Canvas canvas, Rect container) {
// 349:60 : Rectangle (RECTANGLE)
          var draw_349_60 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                ((container.width / 2.0) - (-100.7142566166)),
                ((container.height / 2.0) - -24.9193652592),
                49.6421279907,
                49.6421279907) /* H:CENTER V:CENTER F:(l:289.2142566166476,t:147.41936525922574,r:38.14361539262973,b:38.14361539262973,w:49.642127990722656,h:49.642127990722656) */;
            canvas.save();
            canvas.transform(Float64List.fromList([
              0.3338069889,
              0.9426414452,
              0.0,
              0.0,
              -0.9426414452,
              0.3338069889,
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
              (frame.width / 49.6421279907),
              0.0,
              0.0,
              0.0,
              0.0,
              (frame.height / 49.6421279907),
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
              Path()
                ..addRRect(RRect.fromRectAndRadius(
                    Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                    Radius.circular(14.0)))
            ];
            fillGeometry.forEach((path) {
              canvas.drawPath(path, _PaintCatalog.instance.paint_0);
            });
            canvas.restore();
          };
          draw_349_60(canvas, frame);

// 349:61 : Rectangle (RECTANGLE)
          var draw_349_61 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                ((container.width / 2.0) - (-100.7142566166)),
                ((container.height / 2.0) - -24.9193652592),
                13.9836978912,
                13.9836978912) /* H:CENTER V:CENTER F:(l:289.2142566166476,t:147.41936525922574,r:73.80204549211703,b:73.80204549211703,w:13.983697891235352,h:13.983697891235352) */;
            canvas.save();
            canvas.transform(Float64List.fromList([
              0.3338069889,
              0.9426414452,
              0.0,
              0.0,
              -0.9426414452,
              0.3338069889,
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
              (frame.width / 13.9836978912),
              0.0,
              0.0,
              0.0,
              0.0,
              (frame.height / 13.9836978912),
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
              Path()
                ..addRRect(RRect.fromRectAndRadius(
                    Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                    Radius.circular(7.0)))
            ];
            fillGeometry.forEach((path) {
              canvas.drawPath(path, _PaintCatalog.instance.paint_17);
            });
            canvas.restore();
          };
          draw_349_61(canvas, frame);

// 349:62 : Rectangle (RECTANGLE)
          var draw_349_62 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                (container.width - (109.4976352379)),
                (container.height - (52.1620927815)),
                13.9836978912,
                13.9836978912) /* H:RIGHT V:BOTTOM F:(l:267.50236476209915,t:192.83790721845463,r:95.5139373466655,b:95.5139373466655,w:13.983697891235352,h:13.983697891235352) */;
            canvas.save();
            canvas.transform(Float64List.fromList([
              0.3338069889,
              0.9426414452,
              0.0,
              0.0,
              -0.9426414452,
              0.3338069889,
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
              (frame.width / 13.9836978912),
              0.0,
              0.0,
              0.0,
              0.0,
              (frame.height / 13.9836978912),
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
              Path()
                ..addRRect(RRect.fromRectAndRadius(
                    Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                    Radius.circular(7.0)))
            ];
            fillGeometry.forEach((path) {
              canvas.drawPath(path, _PaintCatalog.instance.paint_14);
            });
            canvas.restore();
          };
          draw_349_62(canvas, frame);
        };
        draw_349_59(canvas, frame);

// 349:56 : Rectangle (RECTANGLE)
        var draw_349_56 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (-0.7046438155)),
              ((container.height / 2.0) - 50.4999929366),
              71.0000000000,
              71.0000000000) /* H:CENTER V:CENTER F:(l:189.20464381552142,t:72.00000706338483,r:116.79535618447858,b:116.79535618447858,w:71.0,h:71.0) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.7071067095,
            0.7071068529,
            0.0,
            0.0,
            -0.7071068529,
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
            (frame.width / 71.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 71.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(14.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_349_56(canvas, frame);

// 349:57 : Rectangle (RECTANGLE)
        var draw_349_57 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (-0.7046438155)),
              ((container.height / 2.0) - 50.4999929366),
              20.0000000000,
              20.0000000000) /* H:CENTER V:CENTER F:(l:189.20464381552142,t:72.00000706338483,r:167.79535618447858,b:167.79535618447858,w:20.0,h:20.0) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.7071067095,
            0.7071068529,
            0.0,
            0.0,
            -0.7071068529,
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
            (frame.width / 20.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 20.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(7.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_17);
          });
          canvas.restore();
        };
        draw_349_57(canvas, frame);

// 349:58 : Rectangle (RECTANGLE)
        var draw_349_58 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (187.8578157846)),
              (container.height - (100.9999724732)),
              20.0000000000,
              20.0000000000) /* H:RIGHT V:BOTTOM F:(l:189.1421842154109,t:144.00002752681257,r:167.8578157845891,b:167.8578157845891,w:20.0,h:20.0) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.7071067095,
            0.7071068529,
            0.0,
            0.0,
            -0.7071068529,
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
            (frame.width / 20.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 20.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(7.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_14);
          });
          canvas.restore();
        };
        draw_349_58(canvas, frame);
      };
      draw_349_55(canvas, frame);
      canvas.restore();
    };
    draw_349_63(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(MultiGoupsPainter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(MultiGoupsPainter oldDelegate) {
    return false;
  }
}

class Goups2 extends StatelessWidget {
  Goups2();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: Goups2Painter());
  }
}

class Goups2Painter extends CustomPainter {
  Goups2Painter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-582.0000000000, 1041.0000000000);

// 342:71 : Goups2 (COMPONENT)
    var draw_342_71 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          582.0000000000,
          -1041.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:582.0,t:-1041.0,r:-582.0,b:-582.0,w:260.0,h:174.0) */;
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

// 330:1 : Group (GROUP)
      var draw_330_1 = (Canvas canvas, Rect container) {
// 330:2 : Rectangle (RECTANGLE)
        var draw_330_2 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (17.0000052452)),
              ((container.height / 2.0) - 21.0000045300),
              36.0000038147,
              39.0000038147) /* H:CENTER V:CENTER F:(l:112.99999475479126,t:65.99999547004722,r:111.00000143051147,b:111.00000143051147,w:36.000003814697266,h:39.000003814697266) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.9999998808,
            0.0004882812,
            0.0,
            0.0,
            -0.0004882812,
            0.9999998808,
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
            (frame.width / 36.0000038147),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 39.0000038147),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(14.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_330_2(canvas, frame);

// 330:3 : Rectangle (RECTANGLE)
        var draw_330_3 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(69.0000000000, 44.0000000000, 20.0000000000,
              20.0000000000) /* H:LEFT V:TOP F:(l:69.0,t:44.0,r:171.0,b:171.0,w:20.0,h:20.0) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.9999998808,
            0.0004882812,
            0.0,
            0.0,
            -0.0004882812,
            0.9999998808,
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
            (frame.width / 20.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 20.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(7.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_17);
          });
          canvas.restore();
        };
        draw_330_3(canvas, frame);

// 330:4 : Rectangle (RECTANGLE)
        var draw_330_4 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (87.9999893904)),
              (container.height - (64.0000002384)),
              20.0000000000,
              20.0000000000) /* H:RIGHT V:BOTTOM F:(l:172.00001060962404,t:109.99999976158051,r:67.99998939037596,b:67.99998939037596,w:20.0,h:20.0) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.9999998808,
            0.0004882812,
            0.0,
            0.0,
            -0.0004882812,
            0.9999998808,
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
            (frame.width / 20.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 20.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(7.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_14);
          });
          canvas.restore();
        };
        draw_330_4(canvas, frame);
      };
      draw_330_1(canvas, frame);
      canvas.restore();
    };
    draw_342_71(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(Goups2Painter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(Goups2Painter oldDelegate) {
    return false;
  }
}

class Frames extends StatelessWidget {
  Frames();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: FramesPainter());
  }
}

class FramesPainter extends CustomPainter {
  FramesPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-285.0000000000, 1041.0000000000);

// 342:70 : Frames (COMPONENT)
    var draw_342_70 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          285.0000000000,
          -1041.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:285.0,t:-1041.0,r:-285.0,b:-285.0,w:280.0,h:174.0) */;
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

// 307:10 : Frame (FRAME)
      var draw_307_10 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (45.0000000000)),
            ((container.height / 2.0) - 49.0000000000),
            91.0000000000,
            107.0000000000) /* H:CENTER V:CENTER F:(l:95.0,t:38.0,r:94.0,b:94.0,w:91.0,h:107.0) */;
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

// 307:7 : Rectangle (RECTANGLE)
        var draw_307_7 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (0.2954101563)),
              ((container.height / 2.0) - 50.5000000000),
              71.0000000000,
              71.0000000000) /* H:CENTER V:CENTER F:(l:45.20458984375,t:3.0,r:-25.20458984375,b:-25.20458984375,w:71.0,h:71.0) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.7071067095,
            0.7071067095,
            0.0,
            0.0,
            -0.7071067095,
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
            (frame.width / 71.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 71.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(14.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_307_7(canvas, frame);

// 307:8 : Rectangle (RECTANGLE)
        var draw_307_8 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              ((container.width / 2.0) - (0.2954101563)),
              ((container.height / 2.0) - 50.5000000000),
              20.0000000000,
              20.0000000000) /* H:CENTER V:CENTER F:(l:45.20458984375,t:3.0,r:25.79541015625,b:25.79541015625,w:20.0,h:20.0) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.7071067095,
            0.7071067095,
            0.0,
            0.0,
            -0.7071067095,
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
            (frame.width / 20.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 20.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(7.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_17);
          });
          canvas.restore();
        };
        draw_307_8(canvas, frame);

// 307:9 : Rectangle (RECTANGLE)
        var draw_307_9 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (45.7954101563)),
              (container.height - (27.8751220703)),
              20.0000000000,
              20.0000000000) /* H:RIGHT V:BOTTOM F:(l:45.20458984375,t:79.1248779296875,r:25.79541015625,b:25.79541015625,w:20.0,h:20.0) */;
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.7071067095,
            0.7071067095,
            0.0,
            0.0,
            -0.7071067095,
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
            (frame.width / 20.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 20.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(7.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_14);
          });
          canvas.restore();
        };
        draw_307_9(canvas, frame);
        canvas.restore();
      };
      draw_307_10(canvas, frame);
      canvas.restore();
    };
    draw_342_70(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(FramesPainter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(FramesPainter oldDelegate) {
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
    this.path_5 = _build_5();
    this.path_6 = _build_6();
    this.path_7 = _build_7();
    this.path_8 = _build_8();
    this.path_9 = _build_9();
    this.path_10 = _build_10();
    this.path_11 = _build_11();
    this.path_12 = _build_12();
    this.path_13 = _build_13();
    this.path_14 = _build_14();
    this.path_15 = _build_15();
    this.path_16 = _build_16();
    this.path_17 = _build_17();
    this.path_18 = _build_18();
    this.path_19 = _build_19();
    this.path_20 = _build_20();
    this.path_21 = _build_21();
    this.path_22 = _build_22();
    this.path_23 = _build_23();
    this.path_24 = _build_24();
    this.path_25 = _build_25();
    this.path_26 = _build_26();
    this.path_27 = _build_27();
    this.path_28 = _build_28();
    this.path_29 = _build_29();
    this.path_30 = _build_30();
    this.path_31 = _build_31();
    this.path_32 = _build_32();
    this.path_33 = _build_33();
    this.path_34 = _build_34();
    this.path_35 = _build_35();
    this.path_36 = _build_36();
    this.path_37 = _build_37();
    this.path_38 = _build_38();
    this.path_39 = _build_39();
    this.path_40 = _build_40();
    this.path_41 = _build_41();
    this.path_42 = _build_42();
    this.path_43 = _build_43();
    this.path_44 = _build_44();
    this.path_45 = _build_45();
    this.path_46 = _build_46();
    this.path_47 = _build_47();
    this.path_48 = _build_48();
    this.path_49 = _build_49();
    this.path_50 = _build_50();
    this.path_51 = _build_51();
    this.path_52 = _build_52();
    this.path_53 = _build_53();
    this.path_54 = _build_54();
    this.path_55 = _build_55();
    this.path_56 = _build_56();
    this.path_57 = _build_57();
    this.path_58 = _build_58();
    this.path_59 = _build_59();
    this.path_60 = _build_60();
    this.path_61 = _build_61();
    this.path_62 = _build_62();
    this.path_63 = _build_63();
    this.path_64 = _build_64();
    this.path_65 = _build_65();
    this.path_66 = _build_66();
    this.path_67 = _build_67();
    this.path_68 = _build_68();
    this.path_69 = _build_69();
    this.path_70 = _build_70();
    this.path_71 = _build_71();
    this.path_72 = _build_72();
    this.path_73 = _build_73();
    this.path_74 = _build_74();
    this.path_75 = _build_75();
    this.path_76 = _build_76();
    this.path_77 = _build_77();
    this.path_78 = _build_78();
    this.path_79 = _build_79();
    this.path_80 = _build_80();
    this.path_81 = _build_81();
    this.path_82 = _build_82();
    this.path_83 = _build_83();
    this.path_84 = _build_84();
    this.path_85 = _build_85();
    this.path_86 = _build_86();
    this.path_87 = _build_87();
    this.path_88 = _build_88();
    this.path_89 = _build_89();
    this.path_90 = _build_90();
    this.path_91 = _build_91();
    this.path_92 = _build_92();
    this.path_93 = _build_93();
    this.path_94 = _build_94();
    this.path_95 = _build_95();
    this.path_96 = _build_96();
    this.path_97 = _build_97();
    this.path_98 = _build_98();
  }

  Path path_0;

  Path path_1;

  Path path_2;

  Path path_3;

  Path path_4;

  Path path_5;

  Path path_6;

  Path path_7;

  Path path_8;

  Path path_9;

  Path path_10;

  Path path_11;

  Path path_12;

  Path path_13;

  Path path_14;

  Path path_15;

  Path path_16;

  Path path_17;

  Path path_18;

  Path path_19;

  Path path_20;

  Path path_21;

  Path path_22;

  Path path_23;

  Path path_24;

  Path path_25;

  Path path_26;

  Path path_27;

  Path path_28;

  Path path_29;

  Path path_30;

  Path path_31;

  Path path_32;

  Path path_33;

  Path path_34;

  Path path_35;

  Path path_36;

  Path path_37;

  Path path_38;

  Path path_39;

  Path path_40;

  Path path_41;

  Path path_42;

  Path path_43;

  Path path_44;

  Path path_45;

  Path path_46;

  Path path_47;

  Path path_48;

  Path path_49;

  Path path_50;

  Path path_51;

  Path path_52;

  Path path_53;

  Path path_54;

  Path path_55;

  Path path_56;

  Path path_57;

  Path path_58;

  Path path_59;

  Path path_60;

  Path path_61;

  Path path_62;

  Path path_63;

  Path path_64;

  Path path_65;

  Path path_66;

  Path path_67;

  Path path_68;

  Path path_69;

  Path path_70;

  Path path_71;

  Path path_72;

  Path path_73;

  Path path_74;

  Path path_75;

  Path path_76;

  Path path_77;

  Path path_78;

  Path path_79;

  Path path_80;

  Path path_81;

  Path path_82;

  Path path_83;

  Path path_84;

  Path path_85;

  Path path_86;

  Path path_87;

  Path path_88;

  Path path_89;

  Path path_90;

  Path path_91;

  Path path_92;

  Path path_93;

  Path path_94;

  Path path_95;

  Path path_96;

  Path path_97;

  Path path_98;

  static final _PathCatalog instance = _PathCatalog();

  static Path _build_0() {
    var path = Path();
    path.moveTo(99.0000000000, 49.5000000000);
    path.cubicTo(99.0000000000, 76.8380966187, 76.8380966187, 99.0000000000,
        49.5000000000, 99.0000000000);
    path.cubicTo(
        22.1619052887, 99.0000000000, 0.0, 76.8380966187, 0.0, 49.5000000000);
    path.cubicTo(0.0, 22.1619052887, 22.1619052887, 0.0, 49.5000000000, 0.0);
    path.cubicTo(76.8380966187, 0.0, 99.0000000000, 22.1619052887,
        99.0000000000, 49.5000000000);
    path.close();
    return path;
  }

  static Path _build_1() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_2() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_3() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_4() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_5() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_6() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_7() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_8() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_9() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_10() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_11() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_12() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_13() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_14() {
    var path = Path();
    path.moveTo(62.0000000000, 31.0000000000);
    path.cubicTo(62.0000000000, 48.1208267212, 48.1208267212, 62.0000000000,
        31.0000000000, 62.0000000000);
    path.cubicTo(
        13.8791723251, 62.0000000000, 0.0, 48.1208267212, 0.0, 31.0000000000);
    path.cubicTo(0.0, 13.8791723251, 13.8791723251, 0.0, 31.0000000000, 0.0);
    path.cubicTo(48.1208267212, 0.0, 62.0000000000, 13.8791723251,
        62.0000000000, 31.0000000000);
    path.close();
    return path;
  }

  static Path _build_15() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_16() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_17() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_18() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_19() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_20() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_21() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_22() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_23() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_24() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_25() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_26() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_27() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_28() {
    var path = Path();
    path.moveTo(453.0000000000, 57.0000000000);
    path.cubicTo(453.0000000000, 88.4802322388, 351.5924987793, 114.0000000000,
        226.5000000000, 114.0000000000);
    path.cubicTo(
        101.4075012207, 114.0000000000, 0.0, 88.4802322388, 0.0, 57.0000000000);
    path.cubicTo(0.0, 25.5197696686, 101.4075012207, 0.0, 226.5000000000, 0.0);
    path.cubicTo(351.5924987793, 0.0, 453.0000000000, 25.5197696686,
        453.0000000000, 57.0000000000);
    path.close();
    return path;
  }

  static Path _build_29() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_30() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_31() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_32() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_33() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_34() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_35() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_36() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_37() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_38() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_39() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_40() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_41() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_42() {
    var path = Path();
    path.moveTo(65.0000000000, 32.5000000000);
    path.cubicTo(65.0000000000, 50.4492530823, 50.4492530823, 65.0000000000,
        32.5000000000, 65.0000000000);
    path.cubicTo(
        14.5507459641, 65.0000000000, 0.0, 50.4492530823, 0.0, 32.5000000000);
    path.cubicTo(0.0, 14.5507459641, 14.5507459641, 0.0, 32.5000000000, 0.0);
    path.cubicTo(50.4492530823, 0.0, 65.0000000000, 14.5507459641,
        65.0000000000, 32.5000000000);
    path.close();
    return path;
  }

  static Path _build_43() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_44() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_45() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_46() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_47() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_48() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_49() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_50() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_51() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_52() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_53() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_54() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_55() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_56() {
    var path = Path();
    path.moveTo(66.0000000000, 33.0000000000);
    path.cubicTo(66.0000000000, 51.2253952026, 51.2253952026, 66.0000000000,
        33.0000000000, 66.0000000000);
    path.cubicTo(
        14.7746028900, 66.0000000000, 0.0, 51.2253952026, 0.0, 33.0000000000);
    path.cubicTo(0.0, 14.7746028900, 14.7746028900, 0.0, 33.0000000000, 0.0);
    path.cubicTo(51.2253952026, 0.0, 66.0000000000, 14.7746028900,
        66.0000000000, 33.0000000000);
    path.close();
    return path;
  }

  static Path _build_57() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_58() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_59() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_60() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_61() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_62() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_63() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_64() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_65() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_66() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_67() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_68() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_69() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_70() {
    var path = Path();
    path.moveTo(63.0000000000, 31.5000000000);
    path.cubicTo(63.0000000000, 48.8969688416, 48.8969688416, 63.0000000000,
        31.5000000000, 63.0000000000);
    path.cubicTo(
        14.1030302048, 63.0000000000, 0.0, 48.8969688416, 0.0, 31.5000000000);
    path.cubicTo(0.0, 14.1030302048, 14.1030302048, 0.0, 31.5000000000, 0.0);
    path.cubicTo(48.8969688416, 0.0, 63.0000000000, 14.1030302048,
        63.0000000000, 31.5000000000);
    path.close();
    return path;
  }

  static Path _build_71() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_72() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_73() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_74() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_75() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_76() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_77() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_78() {
    var path = Path();
    path.moveTo(18.0000000000, 9.0000000000);
    path.cubicTo(18.0000000000, 13.9705629349, 13.9705629349, 18.0000000000,
        9.0000000000, 18.0000000000);
    path.cubicTo(
        4.0294370651, 18.0000000000, 0.0, 13.9705629349, 0.0, 9.0000000000);
    path.cubicTo(0.0, 4.0294370651, 4.0294370651, 0.0, 9.0000000000, 0.0);
    path.cubicTo(13.9705629349, 0.0, 18.0000000000, 4.0294370651, 18.0000000000,
        9.0000000000);
    path.close();
    return path;
  }

  static Path _build_79() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_80() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_81() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_82() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_83() {
    var path = Path();
    path.moveTo(17.0000000000, 8.5000000000);
    path.cubicTo(17.0000000000, 13.1944208145, 13.1944208145, 17.0000000000,
        8.5000000000, 17.0000000000);
    path.cubicTo(
        3.8055796623, 17.0000000000, 0.0, 13.1944208145, 0.0, 8.5000000000);
    path.cubicTo(0.0, 3.8055796623, 3.8055796623, 0.0, 8.5000000000, 0.0);
    path.cubicTo(13.1944208145, 0.0, 17.0000000000, 3.8055796623, 17.0000000000,
        8.5000000000);
    path.close();
    return path;
  }

  static Path _build_84() {
    var path = Path();
    path.moveTo(49.0000000000, 24.5000000000);
    path.cubicTo(49.0000000000, 38.0309753418, 38.0309753418, 49.0000000000,
        24.5000000000, 49.0000000000);
    path.cubicTo(
        10.9690237045, 49.0000000000, 0.0, 38.0309753418, 0.0, 24.5000000000);
    path.cubicTo(0.0, 10.9690237045, 10.9690237045, 0.0, 24.5000000000, 0.0);
    path.cubicTo(38.0309753418, 0.0, 49.0000000000, 10.9690237045,
        49.0000000000, 24.5000000000);
    path.close();
    return path;
  }

  static Path _build_85() {
    var path = Path();
    path.moveTo(45.0000000000, 24.5000000000);
    path.cubicTo(45.0000000000, 35.8218383789, 35.8218383789, 45.0000000000,
        24.5000000000, 45.0000000000);
    path.lineTo(24.5000000000, 53.0000000000);
    path.cubicTo(40.2401161194, 53.0000000000, 53.0000000000, 40.2401161194,
        53.0000000000, 24.5000000000);
    path.lineTo(45.0000000000, 24.5000000000);
    path.close();
    path.moveTo(24.5000000000, 45.0000000000);
    path.cubicTo(13.1781625748, 45.0000000000, 4.0000000000, 35.8218383789,
        4.0000000000, 24.5000000000);
    path.lineTo(-4.0000000000, 24.5000000000);
    path.cubicTo(-4.0000000000, 40.2401161194, 8.7598848343, 53.0000000000,
        24.5000000000, 53.0000000000);
    path.lineTo(24.5000000000, 45.0000000000);
    path.close();
    path.moveTo(4.0000000000, 24.5000000000);
    path.cubicTo(4.0000000000, 13.1781625748, 13.1781625748, 4.0000000000,
        24.5000000000, 4.0000000000);
    path.lineTo(24.5000000000, -4.0000000000);
    path.cubicTo(8.7598848343, -4.0000000000, -4.0000000000, 8.7598848343,
        -4.0000000000, 24.5000000000);
    path.lineTo(4.0000000000, 24.5000000000);
    path.close();
    path.moveTo(24.5000000000, 4.0000000000);
    path.cubicTo(35.8218383789, 4.0000000000, 45.0000000000, 13.1781625748,
        45.0000000000, 24.5000000000);
    path.lineTo(53.0000000000, 24.5000000000);
    path.cubicTo(53.0000000000, 8.7598848343, 40.2401161194, -4.0000000000,
        24.5000000000, -4.0000000000);
    path.lineTo(24.5000000000, 4.0000000000);
    path.close();
    return path;
  }

  static Path _build_86() {
    var path = Path();
    path.moveTo(0.0, 13.7777643204);
    path.cubicTo(77.7446823120, 13.7777624130, 162.4308471680, -17.2222061157,
        261.0000000000, 13.7777643204);
    path.lineTo(261.0000000000, 72.7777786255);
    path.lineTo(0.0, 72.7777786255);
    path.lineTo(0.0, 13.7777643204);
    path.close();
    return path;
  }

  static Path _build_87() {
    var path = Path();
    path.moveTo(58.0000000000, 63.0000000000);
    path.cubicTo(58.0000000000, 79.0162582397, 45.0162582397, 92.0000000000,
        29.0000000000, 92.0000000000);
    path.cubicTo(
        12.9837417603, 92.0000000000, 0.0, 79.0162582397, 0.0, 63.0000000000);
    path.cubicTo(0.0, 46.9837417603, 12.9837417603, 0.0, 29.0000000000, 0.0);
    path.cubicTo(45.0162582397, 0.0, 58.0000000000, 46.9837417603,
        58.0000000000, 63.0000000000);
    path.close();
    return path;
  }

  static Path _build_88() {
    var path = Path();
    path.moveTo(53.1708068848, 12.5836181641);
    path.cubicTo(
        50.8720855713, 5.2893066406, 44.0537338257, 0.0, 36.0000000000, 0.0);
    path.cubicTo(29.6619720459, 0.0, 24.0890350342, 3.2758178711, 20.8818855286,
        8.2266235352);
    path.cubicTo(18.6646766663, 6.2213134766, 15.7249622345, 5.0000000000,
        12.5000000000, 5.0000000000);
    path.cubicTo(
        5.5964403152, 5.0000000000, 0.0, 10.5964355469, 0.0, 17.5000000000);
    path.cubicTo(0.0, 23.7171020508, 4.5387678146, 28.8740844727, 10.4835395813,
        29.8381958008);
    path.cubicTo(10.1673393250, 31.1740722656, 10.0000000000, 32.5675048828,
        10.0000000000, 34.0000000000);
    path.cubicTo(10.0000000000, 43.9411010742, 18.0588741302, 52.0000000000,
        28.0000000000, 52.0000000000);
    path.cubicTo(33.3906936646, 52.0000000000, 38.2279167175, 49.6303100586,
        41.5267982483, 45.8757934570);
    path.cubicTo(43.5187301636, 47.2171630859, 45.9179382324, 48.0000000000,
        48.5000000000, 48.0000000000);
    path.cubicTo(53.9599876404, 48.0000000000, 58.6023559570, 44.4993896484,
        60.3051071167, 39.6200561523);
    path.cubicTo(62.6159591675, 39.8685913086, 65.0246353149, 40.0000000000,
        67.5000000000, 40.0000000000);
    path.cubicTo(84.8969726563, 40.0000000000, 99.0000000000, 33.5081176758,
        99.0000000000, 25.5000000000);
    path.cubicTo(99.0000000000, 17.4918823242, 84.8969726563, 11.0000000000,
        67.5000000000, 11.0000000000);
    path.cubicTo(62.3397674561, 11.0000000000, 57.4693450928, 11.5711059570,
        53.1708068848, 12.5836181641);
    path.close();
    return path;
  }

  static Path _build_89() {
    var path = Path();
    path.moveTo(71.9877624512, 24.2144165039);
    path.cubicTo(71.9959030151, 23.9771118164, 72.0000000000, 23.7390136719,
        72.0000000000, 23.5000000000);
    path.cubicTo(
        72.0000000000, 10.5213012695, 59.9116897583, 0.0, 45.0000000000, 0.0);
    path.cubicTo(39.1161499023, 0.0, 33.6718788147, 1.6380615234, 29.2363662720,
        4.4188842773);
    path.cubicTo(21.3881282806, 5.8159179688, 14.7131423950, 10.6037597656,
        10.7802124023, 17.2135009766);
    path.cubicTo(
        4.4335250854, 19.4546508789, 0.0, 24.5602416992, 0.0, 30.5000000000);
    path.cubicTo(0.0, 36.2165527344, 4.1066017151, 41.1605224609, 10.0730133057,
        43.5218505859);
    path.cubicTo(14.5864601135, 52.1285400391, 23.6075515747, 58.0000000000,
        34.0000000000, 58.0000000000);
    path.cubicTo(40.2638626099, 58.0000000000, 46.0295333862, 55.8670043945,
        50.6102714539, 52.2876586914);
    path.cubicTo(52.8762321472, 54.5797729492, 56.0222549438, 56.0000000000,
        59.5000000000, 56.0000000000);
    path.cubicTo(64.3141860962, 56.0000000000, 68.4927291870, 53.2785034180,
        70.5810470581, 49.2900390625);
    path.cubicTo(77.9724731445, 46.8469238281, 83.0000000000, 42.0357055664,
        83.0000000000, 36.5000000000);
    path.cubicTo(83.0000000000, 31.3231201172, 78.6030731201, 26.7798461914,
        71.9877624512, 24.2144165039);
    path.close();
    return path;
  }

  static Path _build_90() {
    var path = Path();
    path.moveTo(49.0000000000, 24.5000000000);
    path.cubicTo(49.0000000000, 38.0309753418, 38.0309753418, 49.0000000000,
        24.5000000000, 49.0000000000);
    path.cubicTo(
        10.9690237045, 49.0000000000, 0.0, 38.0309753418, 0.0, 24.5000000000);
    path.cubicTo(0.0, 10.9690237045, 10.9690237045, 0.0, 24.5000000000, 0.0);
    path.cubicTo(38.0309753418, 0.0, 49.0000000000, 10.9690237045,
        49.0000000000, 24.5000000000);
    path.close();
    return path;
  }

  static Path _build_91() {
    var path = Path();
    path.moveTo(0.0, 13.7777643204);
    path.cubicTo(79.8297882080, 13.7777624130, 166.7872314453, -17.2222061157,
        268.0000000000, 13.7777643204);
    path.lineTo(268.0000000000, 72.7777786255);
    path.lineTo(0.0, 72.7777786255);
    path.lineTo(0.0, 13.7777643204);
    path.close();
    return path;
  }

  static Path _build_92() {
    var path = Path();
    path.moveTo(58.0000000000, 63.0000000000);
    path.cubicTo(58.0000000000, 79.0162582397, 45.0162582397, 92.0000000000,
        29.0000000000, 92.0000000000);
    path.cubicTo(
        12.9837417603, 92.0000000000, 0.0, 79.0162582397, 0.0, 63.0000000000);
    path.cubicTo(0.0, 46.9837417603, 12.9837417603, 0.0, 29.0000000000, 0.0);
    path.cubicTo(45.0162582397, 0.0, 58.0000000000, 46.9837417603,
        58.0000000000, 63.0000000000);
    path.close();
    return path;
  }

  static Path _build_93() {
    var path = Path();
    path.moveTo(42.0000000000, 45.9000167847);
    path.cubicTo(42.0000000000, 57.5690078735, 32.5979804993, 67.0285949707,
        21.0000000000, 67.0285949707);
    path.cubicTo(
        9.4020195007, 67.0285949707, 0.0, 57.5690078735, 0.0, 45.9000167847);
    path.cubicTo(0.0, 34.2310256958, 9.4020195007, 0.0, 21.0000000000, 0.0);
    path.cubicTo(32.5979804993, 0.0, 42.0000000000, 34.2310256958,
        42.0000000000, 45.9000167847);
    path.close();
    return path;
  }

  static Path _build_94() {
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

  static Path _build_95() {
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

  static Path _build_96() {
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

  static Path _build_97() {
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

  static Path _build_98() {
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
    this.paint_5 = (Paint()..color = _ColorCatalog.instance.color_6);
    this.paint_6 = (Paint()..color = _ColorCatalog.instance.color_7);
    this.paint_7 = (Paint()..color = _ColorCatalog.instance.color_0);
    this.paint_8 = (Paint()..color = _ColorCatalog.instance.color_11);
    this.paint_9 = (Paint()..color = _ColorCatalog.instance.color_12);
    this.paint_10 = (Paint()..color = _ColorCatalog.instance.color_13);
    this.paint_11 = (Paint()..color = _ColorCatalog.instance.color_14);
    this.paint_12 = (Paint()..color = _ColorCatalog.instance.color_15);
    this.paint_13 = (Paint()..color = _ColorCatalog.instance.color_16);
    this.paint_14 = (Paint()..color = _ColorCatalog.instance.color_21);
    this.paint_15 = (Paint()..color = _ColorCatalog.instance.color_22);
    this.paint_16 = (Paint()..color = _ColorCatalog.instance.color_23);
    this.paint_17 = (Paint()..color = _ColorCatalog.instance.color_24);
    this.paint_18 = (Paint()..color = _ColorCatalog.instance.color_25);
  }

  Paint paint_0;

  Paint paint_1;

  Paint paint_2;

  Paint paint_3;

  Paint paint_4;

  Paint paint_5;

  Paint paint_6;

  Paint paint_7;

  Paint paint_8;

  Paint paint_9;

  Paint paint_10;

  Paint paint_11;

  Paint paint_12;

  Paint paint_13;

  Paint paint_14;

  Paint paint_15;

  Paint paint_16;

  Paint paint_17;

  Paint paint_18;

  static final _PaintCatalog instance = _PaintCatalog();
}

class _EffectCatalog {
  _EffectCatalog() {
    this.paint_0 = (Paint()
      ..color = _ColorCatalog.instance.color_17
      ..maskFilter = MaskFilter.blur(
          BlurStyle.normal, BoxShadow.convertRadiusToSigma(20.0)));
  }

  Paint paint_0;

  static final _EffectCatalog instance = _EffectCatalog();
}

class _ColorCatalog {
  _ColorCatalog() {
    this.color_0 = Color.fromARGB(255, 255, 255, 255);
    this.color_1 = Color.fromARGB(255, 238, 238, 238);
    this.color_2 = Color.fromARGB(255, 217, 217, 217);
    this.color_3 = Color.fromARGB(255, 255, 80, 80);
    this.color_4 = Color.fromARGB(255, 99, 124, 255);
    this.color_5 = Color.fromARGB(255, 243, 99, 255);
    this.color_6 = Color.fromARGB(255, 99, 255, 255);
    this.color_7 = Color.fromARGB(255, 255, 230, 99);
    this.color_8 = Color.fromARGB(255, 249, 184, 184);
    this.color_9 = Color.fromARGB(255, 225, 239, 202);
    this.color_10 = Color.fromARGB(255, 148, 229, 255);
    this.color_11 = Color.fromARGB(255, 255, 227, 155);
    this.color_12 = Color.fromARGB(255, 255, 193, 72);
    this.color_13 = Color.fromARGB(255, 68, 193, 140);
    this.color_14 = Color.fromARGB(255, 196, 160, 134);
    this.color_15 = Color.fromARGB(255, 183, 216, 150);
    this.color_16 = Color.fromARGB(150, 255, 255, 255);
    this.color_17 = Color.fromARGB(255, 255, 237, 190);
    this.color_18 = Color.fromARGB(255, 0, 0, 0);
    this.color_19 = Color.fromARGB(0, 0, 0, 0);
    this.color_20 = Color.fromARGB(255, 138, 183, 93);
    this.color_21 = Color.fromARGB(255, 162, 89, 255);
    this.color_22 = Color.fromARGB(255, 10, 207, 131);
    this.color_23 = Color.fromARGB(255, 26, 188, 254);
    this.color_24 = Color.fromARGB(255, 242, 78, 30);
    this.color_25 = Color.fromARGB(255, 255, 114, 98);
  }

  Color color_0;

  Color color_1;

  Color color_2;

  Color color_3;

  Color color_4;

  Color color_5;

  Color color_6;

  Color color_7;

  Color color_8;

  Color color_9;

  Color color_10;

  Color color_11;

  Color color_12;

  Color color_13;

  Color color_14;

  Color color_15;

  Color color_16;

  Color color_17;

  Color color_18;

  Color color_19;

  Color color_20;

  Color color_21;

  Color color_22;

  Color color_23;

  Color color_24;

  Color color_25;

  static final _ColorCatalog instance = _ColorCatalog();
}

class _TextStyleCatalog {
  _TextStyleCatalog() {
    this.ui_TextStyle_0 = ui.TextStyle(
      fontFamily: 'Roboto',
      color: _ColorCatalog.instance.color_18,
      fontSize: 11.0000000000,
      fontWeight: FontWeight.w400,
    );
    this.ui_TextStyle_1 = ui.TextStyle(
      fontFamily: 'Roboto',
      color: _ColorCatalog.instance.color_3,
      fontSize: 11.0000000000,
      fontWeight: FontWeight.w400,
    );
    this.ui_TextStyle_2 = ui.TextStyle(
      fontFamily: 'Roboto',
      color: _ColorCatalog.instance.color_12,
      fontSize: 14.0000000000,
      fontWeight: FontWeight.w700,
    );
    this.ui_TextStyle_3 = ui.TextStyle(
      fontFamily: 'Roboto',
      color: _ColorCatalog.instance.color_0,
      fontSize: 36.0000000000,
      fontWeight: FontWeight.w100,
    );
  }

  ui.TextStyle ui_TextStyle_0;

  ui.TextStyle ui_TextStyle_1;

  ui.TextStyle ui_TextStyle_2;

  ui.TextStyle ui_TextStyle_3;

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
