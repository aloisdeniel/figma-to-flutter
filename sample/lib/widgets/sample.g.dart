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
          var fillGeometry = [
            _PathCatalog.instance.path_0.transform(transform)
          ];
          var fills = [(Paint()..color = Color.fromARGB(255, 162, 89, 255))];
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
          var fillGeometry = [
            _PathCatalog.instance.path_1.transform(transform)
          ];
          var fills = [(Paint()..color = Color.fromARGB(255, 162, 89, 255))];
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
          var fillGeometry = [
            _PathCatalog.instance.path_2.transform(transform)
          ];
          var fills = [(Paint()..color = Color.fromARGB(255, 10, 207, 131))];
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
          var fillGeometry = [
            _PathCatalog.instance.path_3.transform(transform)
          ];
          var fills = [(Paint()..color = Color.fromARGB(255, 10, 207, 131))];
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
        var fillGeometry = [_PathCatalog.instance.path_4.transform(transform)];
        var fills = [(Paint()..color = Color.fromARGB(255, 26, 188, 254))];
        fills.forEach((paint) {
          fillGeometry.forEach((path) {
            canvas.drawPath(path, paint);
          });
        });
        canvas.restore();
      };
      draw_105_46(canvas, frame);
      if (this.topBar?.isVisible ?? true) {
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
              var fillGeometry = [
                _PathCatalog.instance.path_5.transform(transform)
              ];
              var fills = [(Paint()..color = Color.fromARGB(255, 242, 78, 30))];
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
              var fillGeometry = [
                _PathCatalog.instance.path_6.transform(transform)
              ];
              var fills = [(Paint()..color = Color.fromARGB(255, 242, 78, 30))];
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
              var fillGeometry = [
                _PathCatalog.instance.path_7.transform(transform)
              ];
              var fills = [
                (Paint()..color = Color.fromARGB(255, 255, 114, 98))
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
              var fillGeometry = [
                _PathCatalog.instance.path_8.transform(transform)
              ];
              var fills = [
                (Paint()..color = Color.fromARGB(255, 255, 114, 98))
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
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(LogoPainter oldDelegate) {
    return oldDelegate.topBar != this.topBar;
  }
}

class AddTodo extends StatelessWidget {
  AddTodo({this.value});

  final Widget value;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: AddTodoPainter(),
        child: Material(
            type: MaterialType.transparency,
            child: Container(
                child: Stack(
                    children: [
              Positioned(
                child: this.value,
                left: 21.0,
                right: 18.0,
                top: -1.1368683772161603e-13,
                bottom: 1.1368683772161603e-13,
              )
            ].where((x) => x != null).toList()))));
  }
}

class AddTodoPainter extends CustomPainter {
  AddTodoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-66.0, -324.0);

// AddTodo
    var draw_186_39 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          66.0, 324.0, (container.width - (0.0)), (container.height - (0.0)));
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
      var draw_186_29 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            0.0, 0.0, (container.width - (0.0)), (container.height - (0.0)));
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
          (frame.height / 96.0),
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
          var effectPaint = (Paint()
            ..color = Color.fromARGB(26, 0, 0, 0)
            ..maskFilter = MaskFilter.blur(
                BlurStyle.normal, BoxShadow.convertRadiusToSigma(8.0)));
          canvas.save();
          canvas.translate(0.0, 2.0);
          canvas.drawPath(path, effectPaint);
          canvas.restore();
        });
        var fills = [(Paint()..color = Color.fromARGB(255, 255, 255, 255))];
        fills.forEach((paint) {
          fillGeometry.forEach((path) {
            canvas.drawPath(path, paint);
          });
        });
        canvas.restore();
      };
      draw_186_29(canvas, frame);
      canvas.restore();
    };
    draw_186_39(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(AddTodoPainter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(AddTodoPainter oldDelegate) {
    return false;
  }
}

class TodoItem extends StatelessWidget {
  TodoItem({this.selected, this.onSelect, this.title});

  final VectorData selected;

  final GestureTapCallback onSelect;

  final TextData title;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: TodoItemPainter(selected, title),
        child: Material(
            type: MaterialType.transparency,
            child: Container(
                child: Stack(
                    children: [
              Positioned(
                child: InkWell(
                    onTap: onSelect,
                    borderRadius: BorderRadius.all(Radius.circular(9.0))),
                left: 0.0,
                right: 0.0,
                top: 0.0,
                bottom: 0.0,
              )
            ].where((x) => x != null).toList()))));
  }
}

class TodoItemPainter extends CustomPainter {
  TodoItemPainter(this.selected, this.title);

  final VectorData selected;

  final TextData title;

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
        var frame = Rect.fromLTWH(
            0.0, 0.0, (container.width - (0.0)), (container.height - (0.0)));
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
          (frame.height / 63.0),
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
          var effectPaint = (Paint()
            ..color = Color.fromARGB(41, 0, 0, 0)
            ..maskFilter = MaskFilter.blur(
                BlurStyle.normal, BoxShadow.convertRadiusToSigma(6.0)));
          canvas.save();
          canvas.translate(0.0, 2.0);
          canvas.drawPath(path, effectPaint);
          canvas.restore();
        });
        var fills = [(Paint()..color = Color.fromARGB(255, 242, 242, 242))];
        fills.forEach((paint) {
          fillGeometry.forEach((path) {
            canvas.drawPath(path, paint);
          });
        });
        canvas.restore();
      };
      draw_186_16(canvas, frame);

// Group
      var draw_226_3 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(17.0, 16.0, 31.0, 31.0);
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
          var frame = Rect.fromLTWH(
              0.0, ((container.height / 2.0) - 0.0 - 15.5), 31.0, 31.0);
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
            (frame.width / 31.0),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 31.0),
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
            _PathCatalog.instance.path_11.transform(transform)
          ];
          var fills = [(Paint()..color = Color.fromARGB(255, 255, 255, 255))];
          fills.forEach((paint) {
            fillGeometry.forEach((path) {
              canvas.drawPath(path, paint);
            });
          });
          canvas.restore();
        };
        draw_186_17(canvas, frame);
        if (this.selected?.isVisible ?? true) {
// $selected
          var draw_186_21 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                6.199951171875,
                ((container.height / 2.0) -
                    -0.00001239776611328125 -
                    9.300000190734863),
                18.600000381469727,
                18.600000381469727);
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
              (frame.width / 18.600000381469727),
              0.0,
              0.0,
              0.0,
              0.0,
              (frame.height / 18.600000381469727),
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
              _PathCatalog.instance.path_12.transform(transform)
            ];
            fillGeometry.forEach((path) {
              var effectPaint = (Paint()
                ..color = Color.fromARGB(255, 80, 182, 255)
                ..maskFilter = MaskFilter.blur(
                    BlurStyle.normal, BoxShadow.convertRadiusToSigma(10.0)));
              canvas.drawPath(path, effectPaint);
            });
            var fills = [(Paint()..color = Color.fromARGB(255, 80, 182, 255))];
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
      draw_226_3(canvas, frame);
      if (this.title?.isVisible ?? true) {
// $title
        var draw_204_67 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(59.0, 18.0, (container.width - (107.0)),
              (container.height - (35.0)));
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
            color: Color.fromARGB(255, 85, 85, 85),
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          );
          var paragraphStyle = ui.ParagraphStyle(
            fontFamily: 'Roboto',
            textAlign: TextAlign.left,
            fontSize: 16.0,
            fontWeight: FontWeight.w300,
          );
          var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
            ..pushStyle(style_0);
          if (this?.title?.text == null) {
            paragraphBuilder.addText("I need to do something");
          } else {
            paragraphBuilder.addText(this.title.text);
          }
          var paragraph = paragraphBuilder.build();
          paragraph.layout(new ui.ParagraphConstraints(width: frame.width));
          canvas.drawParagraph(paragraph, Offset.zero);
          canvas.restore();
        };
        draw_204_67(canvas, frame);
      }
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
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(TodoItemPainter oldDelegate) {
    return oldDelegate.selected != this.selected ||
        oldDelegate.title != this.title;
  }
}

class TodoLogo extends StatelessWidget {
  TodoLogo();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: TodoLogoPainter());
  }
}

class TodoLogoPainter extends CustomPainter {
  TodoLogoPainter();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-66.0, -41.0);

// TodoLogo
    var draw_186_44 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          66.0, 41.0, (container.width - (0.0)), (container.height - (0.0)));
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
      var draw_186_40 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - 12.447961807250977 - 30.052038192749023),
            ((container.height / 2.0) -
                -30.052038192749023 -
                30.052038192749023),
            60.10407638549805,
            60.10407638549805);
        canvas.save();
        canvas.transform(Float64List.fromList([
          0.7071067690849304,
          -0.7071067690849304,
          0.0,
          0.0,
          0.7071067690849304,
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
        var transform = Float64List.fromList([
          (frame.width / 60.10407638549805),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 60.10407638549805),
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
          var effectPaint = (Paint()
            ..color = Color.fromARGB(255, 80, 182, 255)
            ..maskFilter = MaskFilter.blur(
                BlurStyle.normal, BoxShadow.convertRadiusToSigma(10.0)));
          canvas.drawPath(path, effectPaint);
        });
        var fills = [(Paint()..color = Color.fromARGB(255, 80, 182, 255))];
        fills.forEach((paint) {
          fillGeometry.forEach((path) {
            canvas.drawPath(path, paint);
          });
        });
        canvas.restore();
      };
      draw_186_40(canvas, frame);

// Vector
      var draw_186_42 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) -
                -6.6592254638671875 -
                19.636276245117188),
            ((container.height / 2.0) -
                -11.781800270080566 -
                13.147767066955566),
            39.272552490234375,
            26.295534133911133);
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
          (frame.width / 39.272552490234375),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 26.295534133911133),
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
        var fillGeometry = [];
        var strokes = [(Paint()..color = Color.fromARGB(255, 255, 255, 255))];
        var strokeGeometry = [
          _PathCatalog.instance.path_14.transform(transform)
        ];
        strokes.forEach((paint) {
          strokeGeometry.forEach((path) {
            canvas.drawPath(path, paint);
          });
        });
        canvas.restore();
      };
      draw_186_42(canvas, frame);

// TODO
      var draw_186_45 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - -3.184518814086914 - 14.684518814086914),
            ((container.height / 2.0) - 1.2444629669189453 - 6.488508224487305),
            29.369037628173828,
            12.97701644897461);
        canvas.save();
        canvas.transform(Float64List.fromList([
          0.7071067690849304,
          -0.7071067690849304,
          0.0,
          0.0,
          0.7071067690849304,
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
        var style_0 = ui.TextStyle(
          fontFamily: 'Roboto',
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        );
        var paragraphStyle = ui.ParagraphStyle(
          fontFamily: 'Roboto',
          textAlign: TextAlign.left,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        );
        var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
          ..pushStyle(style_0);
        paragraphBuilder.addText("TODO");
        var paragraph = paragraphBuilder.build();
        paragraph.layout(new ui.ParagraphConstraints(width: frame.width));
        canvas.drawParagraph(paragraph, Offset.zero);
        canvas.restore();
      };
      draw_186_45(canvas, frame);
      canvas.restore();
    };
    draw_186_44(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(TodoLogoPainter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(TodoLogoPainter oldDelegate) {
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
    path.moveTo(0.0, 1.0);
    path.cubicTo(0.0, 0.4477152526378632, 0.4477152526378632, 0.0, 1.0, 0.0);
    path.lineTo(588.0, 0.0);
    path.cubicTo(588.5523071289062, 0.0, 589.0, 0.4477152526378632, 589.0, 1.0);
    path.lineTo(589.0, 95.0);
    path.cubicTo(
        589.0, 95.55228424072266, 588.5523071289062, 96.0, 588.0, 96.0);
    path.lineTo(1.0, 96.0);
    path.cubicTo(0.4477152526378632, 96.0, 0.0, 95.55228424072266, 0.0, 95.0);
    path.lineTo(0.0, 1.0);
    path.close();
    return path;
  }

  static Path _build_10() {
    var path = Path();
    path.moveTo(0.0, 9.0);
    path.cubicTo(0.0, 4.02943754196167, 4.02943754196167, 0.0, 9.0, 0.0);
    path.lineTo(580.0, 0.0);
    path.cubicTo(584.9705810546875, 0.0, 589.0, 4.02943754196167, 589.0, 9.0);
    path.lineTo(589.0, 54.0);
    path.cubicTo(
        589.0, 58.97056198120117, 584.9705810546875, 63.0, 580.0, 63.0);
    path.lineTo(9.0, 63.0);
    path.cubicTo(4.02943754196167, 63.0, 0.0, 58.97056198120117, 0.0, 54.0);
    path.lineTo(0.0, 9.0);
    path.close();
    return path;
  }

  static Path _build_11() {
    var path = Path();
    path.moveTo(31.0, 15.5);
    path.cubicTo(
        31.0, 24.060413360595703, 24.060413360595703, 31.0, 15.5, 31.0);
    path.cubicTo(6.939586162567139, 31.0, 0.0, 24.060413360595703, 0.0, 15.5);
    path.cubicTo(0.0, 6.939586162567139, 6.939586162567139, 0.0, 15.5, 0.0);
    path.cubicTo(24.060413360595703, 0.0, 31.0, 6.939586162567139, 31.0, 15.5);
    path.close();
    return path;
  }

  static Path _build_12() {
    var path = Path();
    path.moveTo(18.600000381469727, 9.300000190734863);
    path.cubicTo(18.600000381469727, 14.436248779296875, 14.436248779296875,
        18.600000381469727, 9.300000190734863, 18.600000381469727);
    path.cubicTo(4.16375207901001, 18.600000381469727, 0.0, 14.436248779296875,
        0.0, 9.300000190734863);
    path.cubicTo(
        0.0, 4.16375207901001, 4.16375207901001, 0.0, 9.300000190734863, 0.0);
    path.cubicTo(14.436248779296875, 0.0, 18.600000381469727, 4.16375207901001,
        18.600000381469727, 9.300000190734863);
    path.close();
    return path;
  }

  static Path _build_13() {
    var path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(60.10407638549805, 0.0);
    path.lineTo(60.10407638549805, 60.10407638549805);
    path.lineTo(0.0, 60.10407638549805);
    path.lineTo(0.0, 0.0);
    path.close();
    return path;
  }

  static Path _build_14() {
    var path = Path();
    path.moveTo(2.1213202476501465, 11.197196960449219);
    path.cubicTo(0.949747383594513, 10.02562427520752, -0.9497475028038027,
        10.02562427520752, -2.1213204860687256, 11.197196960449219);
    path.cubicTo(-3.2928931713104252, 12.368769645690918, -3.2928931713104252,
        14.268264770507812, -2.1213202476501465, 15.439837455749512);
    path.lineTo(2.1213202476501465, 11.197196960449219);
    path.close();
    path.moveTo(12.977017402648926, 26.295534133911133);
    path.lineTo(10.855696678161621, 28.416854858398438);
    path.lineTo(12.977017402648926, 30.538175582885742);
    path.lineTo(15.098337173461914, 28.416854858398438);
    path.lineTo(12.977017402648926, 26.295534133911133);
    path.close();
    path.moveTo(41.39387130737305, 2.1213204860687256);
    path.cubicTo(42.56544494628906, 0.9497475028038027, 42.56544494628906,
        -0.949747383594513, 41.39387130737305, -2.1213202476501465);
    path.cubicTo(40.2223014831543, -3.2928931713104252, 38.32280349731445,
        -3.2928931713104252, 37.1512336730957, -2.1213204860687256);
    path.lineTo(41.39387130737305, 2.1213204860687256);
    path.close();
    path.moveTo(-2.1213202476501465, 15.439837455749512);
    path.lineTo(10.855696678161621, 28.416854858398438);
    path.lineTo(15.098337173461914, 24.174213409423828);
    path.lineTo(2.1213202476501465, 11.197196960449219);
    path.lineTo(-2.1213202476501465, 15.439837455749512);
    path.close();
    path.moveTo(15.098337173461914, 28.416854858398438);
    path.lineTo(41.39387130737305, 2.1213204860687256);
    path.lineTo(37.1512336730957, -2.1213204860687256);
    path.lineTo(10.855696678161621, 24.174213409423828);
    path.lineTo(15.098337173461914, 28.416854858398438);
    path.close();
    return path;
  }
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
