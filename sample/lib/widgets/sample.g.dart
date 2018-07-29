import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LogoData {
  LogoData({this.topBar});

  final Data topBar;
}

class Logo extends StatelessWidget {
  Logo([this.data]);

  final LogoData data;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: LogoPainter(data));
  }
}

class LogoPainter extends CustomPainter {
  LogoPainter([this.data]);

  final LogoData data;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-30.0, -18.0);

// Logo
    var draw_106_0 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          30.0, 18.0, (container.width - (0.0)), (container.height - (0.0)));
      canvas.save();
      canvas.transform(Float64List.fromList([
        1.0,
        0.0,
        0.0,
        0.0,
        0.0,
        1.0,
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
          (Paint()..color = Color.fromARGB(0, 0, 0, 0)));

// Group
      var draw_105_43 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(34.14213562011719, 92.2843017578125,
            20.000003814697266, 20.000003814697266);
        canvas.save();
        canvas.transform(Float64List.fromList([
          -0.7071067094802856,
          -0.7071067094802856,
          0.0,
          0.0,
          0.7071067094802856,
          -0.7071067094802856,
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

// Ellipse
        var draw_105_44 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(20.000003814697266, 3.216245934129728e-15,
              20.000003814697266, 20.000003814697266);
          canvas.save();
          canvas.transform(Float64List.fromList([
            -1.6081226229577292e-16,
            1.0,
            0.0,
            0.0,
            -1.0,
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
          var fills = [(Paint()..color = Color.fromARGB(255, 162, 89, 255))];
          var fillGeometry = [
            _PathCatalog.instance.path_0.transform(transform)
          ];
          fills.forEach((paint) {
            fillGeometry.forEach((path) {
              canvas.drawPath(path, paint);
            });
          });
          canvas.restore();
        };
        draw_105_44(canvas, frame);

// Rectangle 3
        var draw_105_45 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(1.1368683772161603e-13, 10.000001907348633,
              20.000011444091797, 10.000005722045898);
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
          var fills = [(Paint()..color = Color.fromARGB(255, 162, 89, 255))];
          var fillGeometry = [
            _PathCatalog.instance.path_1.transform(transform)
          ];
          fills.forEach((paint) {
            fillGeometry.forEach((path) {
              canvas.drawPath(path, paint);
            });
          });
          canvas.restore();
        };
        draw_105_45(canvas, frame);
        canvas.restore();
      };
      draw_105_43(canvas, frame);

// Group
      var draw_105_47 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(48.14213562011719, 106.2843017578125,
            20.000003814697266, 20.000003814697266);
        canvas.save();
        canvas.transform(Float64List.fromList([
          -0.7071067094802856,
          -0.7071067094802856,
          0.0,
          0.0,
          0.7071067094802856,
          -0.7071067094802856,
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

// Ellipse
        var draw_105_48 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(20.000003814697266, 3.216245934129728e-15,
              20.000003814697266, 20.000003814697266);
          canvas.save();
          canvas.transform(Float64List.fromList([
            -1.6081226229577292e-16,
            1.0,
            0.0,
            0.0,
            -1.0,
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
          var fills = [(Paint()..color = Color.fromARGB(255, 10, 207, 131))];
          var fillGeometry = [
            _PathCatalog.instance.path_2.transform(transform)
          ];
          fills.forEach((paint) {
            fillGeometry.forEach((path) {
              canvas.drawPath(path, paint);
            });
          });
          canvas.restore();
        };
        draw_105_48(canvas, frame);

// Rectangle 3
        var draw_105_49 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(9.1680269241333, 9.999984741210938,
              10.831965446472168, 10.000005722045898);
          canvas.save();
          canvas.transform(Float64List.fromList([
            0.9999996423721313,
            0.0,
            0.0,
            0.0,
            0.0,
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
          var fills = [(Paint()..color = Color.fromARGB(255, 10, 207, 131))];
          var fillGeometry = [
            _PathCatalog.instance.path_3.transform(transform)
          ];
          fills.forEach((paint) {
            fillGeometry.forEach((path) {
              canvas.drawPath(path, paint);
            });
          });
          canvas.restore();
        };
        draw_105_49(canvas, frame);
        canvas.restore();
      };
      draw_105_47(canvas, frame);

// Ellipse
      var draw_105_46 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            34.0, 64.14215087890625, 20.000003814697266, 20.000003814697266);
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
        var fills = [(Paint()..color = Color.fromARGB(255, 26, 188, 254))];
        var fillGeometry = [_PathCatalog.instance.path_4.transform(transform)];
        fills.forEach((paint) {
          fillGeometry.forEach((path) {
            canvas.drawPath(path, paint);
          });
        });
        canvas.restore();
      };
      draw_105_46(canvas, frame);
      if (this.data?.topBar?.isVisible ?? true) {
// $topBar
        var draw_186_0 = (Canvas canvas, Rect container) {
          var frame =
              Rect.fromLTWH(0.0, 0.0, 73.28427124023438, 73.2843017578125);
          canvas.save();
          canvas.transform(Float64List.fromList([
            1.0,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
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

// Group
          var draw_105_21 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(14.142135620117188, 73.2843017578125,
                20.000003814697266, 20.000003814697266);
            canvas.save();
            canvas.transform(Float64List.fromList([
              -0.7071067094802856,
              -0.7071067094802856,
              0.0,
              0.0,
              0.7071067094802856,
              -0.7071067094802856,
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

// Ellipse
            var draw_105_22 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  20.000003814697266,
                  3.216245934129728e-15,
                  20.000003814697266,
                  20.000003814697266);
              canvas.save();
              canvas.transform(Float64List.fromList([
                -1.6081226229577292e-16,
                1.0,
                0.0,
                0.0,
                -1.0,
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
              var fills = [(Paint()..color = Color.fromARGB(255, 242, 78, 30))];
              var fillGeometry = [
                _PathCatalog.instance.path_5.transform(transform)
              ];
              fills.forEach((paint) {
                fillGeometry.forEach((path) {
                  canvas.drawPath(path, paint);
                });
              });
              canvas.restore();
            };
            draw_105_22(canvas, frame);

// Rectangle 3
            var draw_105_23 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(1.1368683772161603e-13,
                  10.000001907348633, 20.000011444091797, 10.000005722045898);
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
              var fills = [(Paint()..color = Color.fromARGB(255, 242, 78, 30))];
              var fillGeometry = [
                _PathCatalog.instance.path_6.transform(transform)
              ];
              fills.forEach((paint) {
                fillGeometry.forEach((path) {
                  canvas.drawPath(path, paint);
                });
              });
              canvas.restore();
            };
            draw_105_23(canvas, frame);
            canvas.restore();
          };
          draw_105_21(canvas, frame);

// Group
          var draw_105_40 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                59.14213562011719, 0.0, 20.000003814697266, 63.7269401550293);
            canvas.save();
            canvas.transform(Float64List.fromList([
              0.7071067690849304,
              0.7071067690849304,
              0.0,
              0.0,
              -0.7071067690849304,
              0.7071067690849304,
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

// Ellipse
            var draw_105_41 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  20.000003814697266,
                  3.216245934129728e-15,
                  20.000003814697266,
                  20.000003814697266);
              canvas.save();
              canvas.transform(Float64List.fromList([
                -1.6081226229577292e-16,
                1.0,
                0.0,
                0.0,
                -1.0,
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
              var fills = [
                (Paint()..color = Color.fromARGB(255, 255, 114, 98))
              ];
              var fillGeometry = [
                _PathCatalog.instance.path_7.transform(transform)
              ];
              fills.forEach((paint) {
                fillGeometry.forEach((path) {
                  canvas.drawPath(path, paint);
                });
              });
              canvas.restore();
            };
            draw_105_41(canvas, frame);

// Rectangle 3
            var draw_105_42 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(1.1368683772161603e-13,
                  10.000001907348633, 20.000011444091797, 53.726959228515625);
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
              var fills = [
                (Paint()..color = Color.fromARGB(255, 255, 114, 98))
              ];
              var fillGeometry = [
                _PathCatalog.instance.path_8.transform(transform)
              ];
              fills.forEach((paint) {
                fillGeometry.forEach((path) {
                  canvas.drawPath(path, paint);
                });
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
    return false;
  }

  @override
  bool shouldRepaint(LogoPainter oldDelegate) {
    return false;
  }
}

class TodoItemData {
  TodoItemData({this.title, this.selected});

  final TextData title;

  final VectorData selected;
}

class TodoItem extends StatelessWidget {
  TodoItem([this.data]);

  final TodoItemData data;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: TodoItemPainter(data));
  }
}

class TodoItemPainter extends CustomPainter {
  TodoItemPainter([this.data]);

  final TodoItemData data;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-66.0, -463.0);

// TodoItem
    var draw_186_20 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          66.0, 463.0, (container.width - (0.0)), (container.height - (0.0)));
      canvas.save();
      canvas.transform(Float64List.fromList([
        1.0,
        0.0,
        0.0,
        0.0,
        0.0,
        1.0,
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
          (Paint()..color = Color.fromARGB(0, 0, 0, 0)));

// Rectangle
      var draw_186_16 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(0.0, 0.0, 589.0, 87.0);
        canvas.save();
        canvas.transform(Float64List.fromList([
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
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
          (frame.width / 589.0),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 87.0),
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
        var fills = [(Paint()..color = Color.fromARGB(255, 242, 242, 242))];
        var fillGeometry = [_PathCatalog.instance.path_9.transform(transform)];
        fills.forEach((paint) {
          fillGeometry.forEach((path) {
            canvas.drawPath(path, paint);
          });
        });
        canvas.restore();
      };
      draw_186_16(canvas, frame);
      if (this.data?.title?.isVisible ?? true) {
// $title
        var draw_186_18 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(96.0, 18.0, (container.width - (120.0)),
              (container.height - (37.0)));
          canvas.save();
          canvas.transform(Float64List.fromList([
            1.0,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
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
          var style_0 = ui.TextStyle(
            fontFamily: 'Roboto',
            color: Color.fromARGB(255, 98, 98, 98),
            fontSize: 20.0,
            wordSpacing: 20.0,
            fontWeight: FontWeight.w400,
          );
          var paragraphStyle = ui.ParagraphStyle(
            fontFamily: 'Roboto',
            textAlign: TextAlign.left,
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          );
          var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
            ..pushStyle(style_0);
          if (this.data?.title?.text == null) {
            paragraphBuilder.addText("I need to do something");
          } else {
            paragraphBuilder.addText(this.data.title.text);
          }
          var paragraph = paragraphBuilder.build();
          paragraph.layout(new ui.ParagraphConstraints(width: frame.width));
          canvas.drawParagraph(paragraph, Offset.zero);
          canvas.restore();
        };
        draw_186_18(canvas, frame);
      }

// Checkbox
      var draw_186_27 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(22.0, 18.0, 50.0, 50.0);
        canvas.save();
        canvas.transform(Float64List.fromList([
          1.0,
          0.0,
          0.0,
          0.0,
          0.0,
          1.0,
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

// Ellipse
        var draw_186_17 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(((container.width / 2.0) - 0.0 - 25.0),
              ((container.height / 2.0) - 0.0 - 25.0), 50.0, 50.0);
          canvas.save();
          canvas.transform(Float64List.fromList([
            1.0,
            0.0,
            0.0,
            0.0,
            0.0,
            1.0,
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
            (frame.width / 50.0),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 50.0),
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
          var fills = [(Paint()..color = Color.fromARGB(255, 255, 255, 255))];
          var fillGeometry = [
            _PathCatalog.instance.path_10.transform(transform)
          ];
          fills.forEach((paint) {
            fillGeometry.forEach((path) {
              canvas.drawPath(path, paint);
            });
          });
          canvas.restore();
        };
        draw_186_17(canvas, frame);
        if (this.data?.selected?.isVisible ?? true) {
// $selected
          var draw_186_21 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(((container.width / 2.0) - 0.0 - 15.0),
                ((container.height / 2.0) - 0.0 - 15.0), 30.0, 30.0);
            canvas.save();
            canvas.transform(Float64List.fromList([
              1.0,
              0.0,
              0.0,
              0.0,
              0.0,
              1.0,
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
              (frame.width / 30.0),
              0.0,
              0.0,
              0.0,
              0.0,
              (frame.height / 30.0),
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
            var fills = [(Paint()..color = Color.fromARGB(255, 80, 182, 255))];
            var fillGeometry = [
              _PathCatalog.instance.path_11.transform(transform)
            ];
            fills.forEach((paint) {
              fillGeometry.forEach((path) {
                canvas.drawPath(path, paint);
              });
            });
            canvas.restore();
          };
          draw_186_21(canvas, frame);
        }
        canvas.restore();
      };
      draw_186_27(canvas, frame);
      canvas.restore();
    };
    draw_186_20(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(TodoItemPainter oldDelegate) {
    return false;
  }

  @override
  bool shouldRepaint(TodoItemPainter oldDelegate) {
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

  static final _PathCatalog instance = new _PathCatalog();

  static Path _build_0() {
    var path = Path();
    path.moveTo(20.000003814697266, 10.000001907348633);
    path.cubicTo(20.000003814697266, 15.522850036621094, 15.522850036621094,
        20.000003814697266, 10.000001907348633, 20.000003814697266);
    path.cubicTo(4.477153301239014, 20.000003814697266, 0.0, 15.522850036621094,
        0.0, 10.000001907348633);
    path.cubicTo(0.0, 4.477153301239014, 4.477153301239014, 0.0,
        10.000001907348633, 0.0);
    path.cubicTo(15.522850036621094, 0.0, 20.000003814697266, 4.477153301239014,
        20.000003814697266, 10.000001907348633);
    path.close();
    return path;
  }

  static Path _build_1() {
    var path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(20.000011444091797, 0.0);
    path.lineTo(20.000011444091797, 10.000005722045898);
    path.lineTo(0.0, 10.000005722045898);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  static Path _build_2() {
    var path = Path();
    path.moveTo(20.000003814697266, 10.000001907348633);
    path.cubicTo(20.000003814697266, 15.522850036621094, 15.522850036621094,
        20.000003814697266, 10.000001907348633, 20.000003814697266);
    path.cubicTo(4.477153301239014, 20.000003814697266, 0.0, 15.522850036621094,
        0.0, 10.000001907348633);
    path.cubicTo(0.0, 4.477153301239014, 4.477153301239014, 0.0,
        10.000001907348633, 0.0);
    path.cubicTo(15.522850036621094, 0.0, 20.000003814697266, 4.477153301239014,
        20.000003814697266, 10.000001907348633);
    path.close();
    return path;
  }

  static Path _build_3() {
    var path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(10.831965446472168, 0.0);
    path.lineTo(10.831965446472168, 10.000005722045898);
    path.lineTo(0.0, 10.000005722045898);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  static Path _build_4() {
    var path = Path();
    path.moveTo(20.000003814697266, 10.000001907348633);
    path.cubicTo(20.000003814697266, 15.522850036621094, 15.522850036621094,
        20.000003814697266, 10.000001907348633, 20.000003814697266);
    path.cubicTo(4.477153301239014, 20.000003814697266, 0.0, 15.522850036621094,
        0.0, 10.000001907348633);
    path.cubicTo(0.0, 4.477153301239014, 4.477153301239014, 0.0,
        10.000001907348633, 0.0);
    path.cubicTo(15.522850036621094, 0.0, 20.000003814697266, 4.477153301239014,
        20.000003814697266, 10.000001907348633);
    path.close();
    return path;
  }

  static Path _build_5() {
    var path = Path();
    path.moveTo(20.000003814697266, 10.000001907348633);
    path.cubicTo(20.000003814697266, 15.522850036621094, 15.522850036621094,
        20.000003814697266, 10.000001907348633, 20.000003814697266);
    path.cubicTo(4.477153301239014, 20.000003814697266, 0.0, 15.522850036621094,
        0.0, 10.000001907348633);
    path.cubicTo(0.0, 4.477153301239014, 4.477153301239014, 0.0,
        10.000001907348633, 0.0);
    path.cubicTo(15.522850036621094, 0.0, 20.000003814697266, 4.477153301239014,
        20.000003814697266, 10.000001907348633);
    path.close();
    return path;
  }

  static Path _build_6() {
    var path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(20.000011444091797, 0.0);
    path.lineTo(20.000011444091797, 10.000005722045898);
    path.lineTo(0.0, 10.000005722045898);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  static Path _build_7() {
    var path = Path();
    path.moveTo(20.000003814697266, 10.000001907348633);
    path.cubicTo(20.000003814697266, 15.522850036621094, 15.522850036621094,
        20.000003814697266, 10.000001907348633, 20.000003814697266);
    path.cubicTo(4.477153301239014, 20.000003814697266, 0.0, 15.522850036621094,
        0.0, 10.000001907348633);
    path.cubicTo(0.0, 4.477153301239014, 4.477153301239014, 0.0,
        10.000001907348633, 0.0);
    path.cubicTo(15.522850036621094, 0.0, 20.000003814697266, 4.477153301239014,
        20.000003814697266, 10.000001907348633);
    path.close();
    return path;
  }

  static Path _build_8() {
    var path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(20.000011444091797, 0.0);
    path.lineTo(20.000011444091797, 53.726959228515625);
    path.lineTo(0.0, 53.726959228515625);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  static Path _build_9() {
    var path = Path();
    path.moveTo(0.0, 9.0);
    path.cubicTo(0.0, 4.02943754196167, 4.02943754196167, 0.0, 9.0, 0.0);
    path.lineTo(580.0, 0.0);
    path.cubicTo(584.9705810546875, 0.0, 589.0, 4.02943754196167, 589.0, 9.0);
    path.lineTo(589.0, 78.0);
    path.cubicTo(
        589.0, 82.97056579589844, 584.9705810546875, 87.0, 580.0, 87.0);
    path.lineTo(9.0, 87.0);
    path.cubicTo(4.02943754196167, 87.0, 0.0, 82.97056579589844, 0.0, 78.0);
    path.lineTo(0.0, 9.0);
    path.close();
    return path;
  }

  static Path _build_10() {
    var path = Path();
    path.moveTo(50.0, 25.0);
    path.cubicTo(50.0, 38.8071174621582, 38.8071174621582, 50.0, 25.0, 50.0);
    path.cubicTo(11.19288158416748, 50.0, 0.0, 38.8071174621582, 0.0, 25.0);
    path.cubicTo(0.0, 11.19288158416748, 11.19288158416748, 0.0, 25.0, 0.0);
    path.cubicTo(38.8071174621582, 0.0, 50.0, 11.19288158416748, 50.0, 25.0);
    path.close();
    return path;
  }

  static Path _build_11() {
    var path = Path();
    path.moveTo(30.0, 15.0);
    path.cubicTo(
        30.0, 23.284271240234375, 23.284271240234375, 30.0, 15.0, 30.0);
    path.cubicTo(6.715728759765625, 30.0, 0.0, 23.284271240234375, 0.0, 15.0);
    path.cubicTo(0.0, 6.715728759765625, 6.715728759765625, 0.0, 15.0, 0.0);
    path.cubicTo(23.284271240234375, 0.0, 30.0, 6.715728759765625, 30.0, 15.0);
    path.close();
    return path;
  }
}

class Data {
  Data({this.isVisible});

  final bool isVisible;
}

class TextData extends Data {
  TextData({isVisible, this.text}) : super(isVisible: isVisible);

  final String text;
}

class VectorData extends Data {
  VectorData({isVisible}) : super(isVisible: isVisible);
}
