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

// 106:0 : Logo (COMPONENT)
    var draw_106_0 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          30.0,
          18.0,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:30.0,t:18.0,r:-30.0,b:-18.0,w:73.28427124023438,h:106.2843017578125) */;
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
          (Paint()..color = _ColorCatalog.instance.color_0));

// 105:43 : Group (GROUP)
      var draw_105_43 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            34.14213562011719,
            92.2843017578125,
            20.000003814697266,
            20.000003814697266) /* H:SCALE V:SCALE F:(l:34.14213562011719,t:92.2843017578125,r:19.142131805419922,b:-6.000003814697266,w:20.000003814697266,h:20.000003814697266) */;
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

// 105:44 : Ellipse (ELLIPSE)
        var draw_105_44 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              20.000003814697266,
              3.216245934129728e-15,
              20.000003814697266,
              20.000003814697266) /* H:SCALE V:SCALE F:(l:20.000003814697266,t:3.216245934129728e-15,r:-20.000003814697266,b:-3.552713678800501e-15,w:20.000003814697266,h:20.000003814697266) */;
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
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_105_44(canvas, frame);

// 105:45 : Rectangle 3 (RECTANGLE)
        var draw_105_45 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              1.1368683772161603e-13,
              10.000001907348633,
              20.000011444091797,
              10.000005722045898) /* H:SCALE V:SCALE F:(l:1.1368683772161603e-13,t:10.000001907348633,r:-0.000007629394644936838,b:-0.000003814697265625,w:20.000011444091797,h:10.000005722045898) */;
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
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          canvas.restore();
        };
        draw_105_45(canvas, frame);
        canvas.restore();
      };
      draw_105_43(canvas, frame);

// 105:47 : Group (GROUP)
      var draw_105_47 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            48.14213562011719,
            106.2843017578125,
            20.000003814697266,
            20.000003814697266) /* H:SCALE V:SCALE F:(l:48.14213562011719,t:106.2843017578125,r:5.142131805419922,b:-20.000003814697266,w:20.000003814697266,h:20.000003814697266) */;
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

// 105:48 : Ellipse (ELLIPSE)
        var draw_105_48 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              20.000003814697266,
              3.216245934129728e-15,
              20.000003814697266,
              20.000003814697266) /* H:SCALE V:SCALE F:(l:20.000003814697266,t:3.216245934129728e-15,r:-20.000003814697266,b:-3.552713678800501e-15,w:20.000003814697266,h:20.000003814697266) */;
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
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_105_48(canvas, frame);

// 105:49 : Rectangle 3 (RECTANGLE)
        var draw_105_49 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              9.1680269241333,
              9.999984741210938,
              10.831965446472168,
              10.000005722045898) /* H:SCALE V:SCALE F:(l:9.1680269241333,t:9.999984741210938,r:0.000011444091796875,b:0.0000133514404296875,w:10.831965446472168,h:10.000005722045898) */;
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
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_1);
          });
          canvas.restore();
        };
        draw_105_49(canvas, frame);
        canvas.restore();
      };
      draw_105_47(canvas, frame);

// 105:46 : Ellipse (ELLIPSE)
      var draw_105_46 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(34.0, 64.14215087890625, 20.000003814697266,
            20.000003814697266) /* H:SCALE V:SCALE F:(l:34.0,t:64.14215087890625,r:19.28426742553711,b:22.142147064208984,w:20.000003814697266,h:20.000003814697266) */;
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
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_2);
        });
        canvas.restore();
      };
      draw_105_46(canvas, frame);
      if (this.topBar?.isVisible ?? true) {
// 186:0 : $topBar (GROUP)
        var draw_186_0 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(0.0, 0.0, 73.28427124023438,
              73.2843017578125) /* H:LEFT V:TOP F:(l:0.0,t:0.0,r:0.0,b:33.0,w:73.28427124023438,h:73.2843017578125) */;
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

// 105:21 : Group (GROUP)
          var draw_105_21 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                14.142135620117188,
                73.2843017578125,
                20.000003814697266,
                20.000003814697266) /* H:SCALE V:SCALE F:(l:14.142135620117188,t:73.2843017578125,r:39.14213180541992,b:-20.000003814697266,w:20.000003814697266,h:20.000003814697266) */;
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

// 105:22 : Ellipse (ELLIPSE)
            var draw_105_22 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  20.000003814697266,
                  3.216245934129728e-15,
                  20.000003814697266,
                  20.000003814697266) /* H:SCALE V:SCALE F:(l:20.000003814697266,t:3.216245934129728e-15,r:-20.000003814697266,b:-3.552713678800501e-15,w:20.000003814697266,h:20.000003814697266) */;
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
              fillGeometry.forEach((path) {
                canvas.drawPath(path, _PaintCatalog.instance.paint_3);
              });
              canvas.restore();
            };
            draw_105_22(canvas, frame);

// 105:23 : Rectangle 3 (RECTANGLE)
            var draw_105_23 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  1.1368683772161603e-13,
                  10.000001907348633,
                  20.000011444091797,
                  10.000005722045898) /* H:SCALE V:SCALE F:(l:1.1368683772161603e-13,t:10.000001907348633,r:-0.000007629394644936838,b:-0.000003814697265625,w:20.000011444091797,h:10.000005722045898) */;
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
              fillGeometry.forEach((path) {
                canvas.drawPath(path, _PaintCatalog.instance.paint_3);
              });
              canvas.restore();
            };
            draw_105_23(canvas, frame);
            canvas.restore();
          };
          draw_105_21(canvas, frame);

// 105:40 : Group (GROUP)
          var draw_105_40 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                59.14213562011719,
                0.0,
                20.000003814697266,
                63.7269401550293) /* H:SCALE V:SCALE F:(l:59.14213562011719,t:0.0,r:-5.857868194580078,b:9.557361602783203,w:20.000003814697266,h:63.7269401550293) */;
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

// 105:41 : Ellipse (ELLIPSE)
            var draw_105_41 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  20.000003814697266,
                  3.216245934129728e-15,
                  20.000003814697266,
                  20.000003814697266) /* H:SCALE V:SCALE F:(l:20.000003814697266,t:3.216245934129728e-15,r:-20.000003814697266,b:43.72693634033203,w:20.000003814697266,h:20.000003814697266) */;
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
              fillGeometry.forEach((path) {
                canvas.drawPath(path, _PaintCatalog.instance.paint_4);
              });
              canvas.restore();
            };
            draw_105_41(canvas, frame);

// 105:42 : Rectangle 3 (RECTANGLE)
            var draw_105_42 = (Canvas canvas, Rect container) {
              var frame = Rect.fromLTWH(
                  1.1368683772161603e-13,
                  10.000001907348633,
                  20.000011444091797,
                  53.726959228515625) /* H:SCALE V:SCALE F:(l:1.1368683772161603e-13,t:10.000001907348633,r:-0.000007629394644936838,b:-0.0000209808349609375,w:20.000011444091797,h:53.726959228515625) */;
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

// 186:39 : AddTodo (COMPONENT)
    var draw_186_39 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          66.0,
          324.0,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:66.0,t:324.0,r:-66.0,b:-324.0,w:589.0,h:81.0) */;
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
          (Paint()..color = _ColorCatalog.instance.color_0));

// 186:29 : Rectangle (RECTANGLE)
      var draw_186_29 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            0.0,
            0.0,
            (container.width - (0.0)),
            (container.height -
                (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:0.0,t:0.0,r:0.0,b:0.0,w:589.0,h:81.0) */;
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
          (frame.height / 81.0),
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
          var effectPaint = _EffectCatalog.instance.paint_0;
          canvas.save();
          canvas.translate(0.0, 2.0);
          canvas.drawPath(path, effectPaint);
          canvas.restore();
        });
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_5);
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

// 186:20 : TodoItem (COMPONENT)
    var draw_186_20 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          66.0,
          463.0,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:66.0,t:463.0,r:-66.0,b:-463.0,w:589.0,h:63.0) */;
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
          (Paint()..color = _ColorCatalog.instance.color_0));

// 186:16 : Rectangle (RECTANGLE)
      var draw_186_16 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            0.0,
            0.0,
            (container.width - (0.0)),
            (container.height -
                (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:0.0,t:0.0,r:0.0,b:0.0,w:589.0,h:63.0) */;
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
          var effectPaint = _EffectCatalog.instance.paint_1;
          canvas.save();
          canvas.translate(0.0, 2.0);
          canvas.drawPath(path, effectPaint);
          canvas.restore();
        });
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_6);
        });
        canvas.restore();
      };
      draw_186_16(canvas, frame);

// 226:3 : Group (GROUP)
      var draw_226_3 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(17.0, 16.0, 31.0,
            31.0) /* H:LEFT V:TOP F:(l:17.0,t:16.0,r:541.0,b:16.0,w:31.0,h:31.0) */;
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

// 186:17 : Ellipse (ELLIPSE)
        var draw_186_17 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              ((container.height / 2.0) - 15.5),
              31.0,
              31.0) /* H:LEFT V:CENTER F:(l:0.0,t:0.0,r:0.0,b:0.0,w:31.0,h:31.0) */;
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
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_5);
          });
          canvas.restore();
        };
        draw_186_17(canvas, frame);
        if (this.selected?.isVisible ?? true) {
// 186:21 : $selected (ELLIPSE)
          var draw_186_21 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                6.199951171875,
                ((container.height / 2.0) - 9.29998779296875),
                18.600000381469727,
                18.600000381469727) /* H:LEFT V:CENTER F:(l:6.199951171875,t:6.20001220703125,r:6.200048446655273,b:6.199987411499023,w:18.600000381469727,h:18.600000381469727) */;
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
              var effectPaint = _EffectCatalog.instance.paint_2;
              canvas.drawPath(path, effectPaint);
            });
            fillGeometry.forEach((path) {
              canvas.drawPath(path, _PaintCatalog.instance.paint_7);
            });
            canvas.restore();
          };
          draw_186_21(canvas, frame);
        }
        canvas.restore();
      };
      draw_226_3(canvas, frame);
      if (this.title?.isVisible ?? true) {
// 204:67 : $title (TEXT)
        var draw_204_67 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              59.0,
              18.0,
              (container.width - (107.0)),
              (container.height -
                  (35.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:59.0,t:18.0,r:48.0,b:17.0,w:482.0,h:28.0) */;
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
          var style_0 = _TextStyleCatalog.instance.ui_TextStyle_0;
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
  TodoLogo(this.imageProvider);

  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: TodoLogoPainter(imageProvider));
  }
}

class TodoLogoPainter extends ChangeNotifier implements CustomPainter {
  TodoLogoPainter([ImageProvider imageProvider]) {
    this.imageProvider = (imageProvider != null)
        ? DecorationImage(image: imageProvider).createPainter(_onUpdate)
        : null;
  }

  DecorationImagePainter imageProvider;

  void _onUpdate() => this.notifyListeners();
  bool hitTest(Offset offset) => false;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-66.0, -41.0);

// 186:44 : TodoLogo (COMPONENT)
    var draw_186_44 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          66.0,
          41.0,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:66.0,t:41.0,r:-66.0,b:-41.0,w:589.0,h:239.0) */;
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
          (Paint()..color = _ColorCatalog.instance.color_0));

// 186:40 : Rectangle (RECTANGLE)
      var draw_186_40 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (42.5)),
            ((container.height / 2.0) - 0.0),
            60.10407638549805,
            60.10407638549805) /* H:CENTER V:CENTER F:(l:252.0,t:119.5,r:276.89592361450195,b:59.39592361450195,w:60.10407638549805,h:60.10407638549805) */;
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
          var effectPaint = _EffectCatalog.instance.paint_2;
          canvas.drawPath(path, effectPaint);
        });
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_7);
        });
        canvas.restore();
      };
      draw_186_40(canvas, frame);

// 186:42 : Vector (VECTOR)
      var draw_186_42 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (12.97705078125)),
            ((container.height / 2.0) - 1.365966796875),
            39.272552490234375,
            26.295534133911133) /* H:CENTER V:CENTER F:(l:281.52294921875,t:118.134033203125,r:268.2044982910156,b:94.57043266296387,w:39.272552490234375,h:26.295534133911133) */;
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
        var strokes = [_PaintCatalog.instance.paint_5];
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

// 186:45 : TODO (TEXT)
      var draw_186_45 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (11.5)),
            ((container.height / 2.0) - 7.73297119140625),
            29.369037628173828,
            12.97701644897461) /* H:CENTER V:CENTER F:(l:283.0,t:111.76702880859375,r:276.6309623718262,b:114.25595474243164,w:29.369037628173828,h:12.97701644897461) */;
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
        var style_0 = _TextStyleCatalog.instance.ui_TextStyle_1;
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

// 255:1 : image (RECTANGLE)
      var draw_255_1 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (24.95458984375)),
            ((container.height / 2.0) - 80.5),
            36.0,
            36.0) /* H:CENTER V:CENTER F:(l:269.54541015625,t:39.0,r:283.45458984375,b:164.0,w:36.0,h:36.0) */;
        canvas.save();
        canvas.transform(Float64List.fromList([
          0.7009092569351196,
          -0.713250458240509,
          0.0,
          0.0,
          0.713250458240509,
          0.7009092569351196,
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
          (frame.width / 36.0),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 36.0),
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
        var fillGeometry = [_PathCatalog.instance.path_15.transform(transform)];
        fillGeometry.forEach((path) {
          if (imageProvider != null)
            imageProvider.paint(
                canvas, path.getBounds(), path, ImageConfiguration());
        });
        canvas.restore();
      };
      draw_255_1(canvas, frame);
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
    return oldDelegate.imageProvider != this.imageProvider;
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

  static final _PathCatalog instance = _PathCatalog();

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
    path.lineTo(589.0, 80.0);
    path.cubicTo(
        589.0, 80.55228424072266, 588.5523071289062, 81.0, 588.0, 81.0);
    path.lineTo(1.0, 81.0);
    path.cubicTo(0.4477152526378632, 81.0, 0.0, 80.55228424072266, 0.0, 80.0);
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

  static Path _build_15() {
    var path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(36.0, 0.0);
    path.lineTo(36.0, 36.0);
    path.lineTo(0.0, 36.0);
    path.lineTo(0.0, 0.0);
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
    this.paint_5 = (Paint()..color = _ColorCatalog.instance.color_7);
    this.paint_6 = (Paint()..color = _ColorCatalog.instance.color_9);
    this.paint_7 = (Paint()..color = _ColorCatalog.instance.color_10);
  }

  Paint paint_0;

  Paint paint_1;

  Paint paint_2;

  Paint paint_3;

  Paint paint_4;

  Paint paint_5;

  Paint paint_6;

  Paint paint_7;

  static final _PaintCatalog instance = _PaintCatalog();
}

class _EffectCatalog {
  _EffectCatalog() {
    this.paint_0 = (Paint()
      ..color = _ColorCatalog.instance.color_6
      ..maskFilter = MaskFilter.blur(
          BlurStyle.normal, BoxShadow.convertRadiusToSigma(8.0)));
    this.paint_1 = (Paint()
      ..color = _ColorCatalog.instance.color_8
      ..maskFilter = MaskFilter.blur(
          BlurStyle.normal, BoxShadow.convertRadiusToSigma(6.0)));
    this.paint_2 = (Paint()
      ..color = _ColorCatalog.instance.color_10
      ..maskFilter = MaskFilter.blur(
          BlurStyle.normal, BoxShadow.convertRadiusToSigma(10.0)));
  }

  Paint paint_0;

  Paint paint_1;

  Paint paint_2;

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
    this.color_6 = Color.fromARGB(26, 0, 0, 0);
    this.color_7 = Color.fromARGB(255, 255, 255, 255);
    this.color_8 = Color.fromARGB(41, 0, 0, 0);
    this.color_9 = Color.fromARGB(255, 242, 242, 242);
    this.color_10 = Color.fromARGB(255, 80, 182, 255);
    this.color_11 = Color.fromARGB(255, 85, 85, 85);
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

  static final _ColorCatalog instance = _ColorCatalog();
}

class _TextStyleCatalog {
  _TextStyleCatalog() {
    this.ui_TextStyle_0 = ui.TextStyle(
      fontFamily: 'Roboto',
      color: _ColorCatalog.instance.color_11,
      fontSize: 16.0,
      fontWeight: FontWeight.w300,
    );
    this.ui_TextStyle_1 = ui.TextStyle(
      fontFamily: 'Roboto',
      color: _ColorCatalog.instance.color_7,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    );
  }

  ui.TextStyle ui_TextStyle_0;

  ui.TextStyle ui_TextStyle_1;

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
