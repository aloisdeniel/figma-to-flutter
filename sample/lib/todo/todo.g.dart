import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
    canvas.translate(-66.0000000000, -324.0000000000);

// 186:39 : AddTodo (COMPONENT)
    var draw_186_39 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          66.0000000000,
          324.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:66.0,t:324.0,r:-66.0,b:-66.0,w:589.0,h:81.0) */;
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
          (frame.width / 589.0000000000),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 81.0000000000),
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
                Radius.circular(1.0)))
        ];
        fillGeometry.forEach((path) {
          var effectPaint = _EffectCatalog.instance.paint_0;
          canvas.save();
          canvas.translate(0.0, 2.0000000000);
          canvas.drawPath(path, effectPaint);
          canvas.restore();
        });
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_0);
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
    canvas.translate(-66.0000000000, -463.0000000000);

// 186:20 : TodoItem (COMPONENT)
    var draw_186_20 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          66.0000000000,
          463.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:66.0,t:463.0,r:-66.0,b:-66.0,w:589.0,h:63.0) */;
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
          (frame.width / 589.0000000000),
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
          Path()
            ..addRRect(RRect.fromRectAndRadius(
                Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                Radius.circular(9.0)))
        ];
        fillGeometry.forEach((path) {
          var effectPaint = _EffectCatalog.instance.paint_1;
          canvas.save();
          canvas.translate(0.0, 2.0000000000);
          canvas.drawPath(path, effectPaint);
          canvas.restore();
        });
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_1);
        });
        canvas.restore();
      };
      draw_186_16(canvas, frame);

// 226:3 : Group (GROUP)
      var draw_226_3 = (Canvas canvas, Rect container) {
// 186:17 : Ellipse (ELLIPSE)
        var draw_186_17 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              17.0000000000,
              ((container.height / 2.0) - 15.5000000000),
              31.0000000000,
              31.0000000000) /* H:LEFT V:CENTER F:(l:17.0,t:16.0,r:541.0,b:541.0,w:31.0,h:31.0) */;
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
            (frame.width / 31.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 31.0000000000),
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
        draw_186_17(canvas, frame);
        if (this.selected?.isVisible ?? true) {
// 186:21 : $selected (ELLIPSE)
          var draw_186_21 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                23.1999511719,
                ((container.height / 2.0) - 9.2999877930),
                18.6000003815,
                18.6000003815) /* H:LEFT V:CENTER F:(l:23.199951171875,t:22.20001220703125,r:547.2000484466553,b:547.2000484466553,w:18.600000381469727,h:18.600000381469727) */;
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
              (frame.width / 18.6000003815),
              0.0,
              0.0,
              0.0,
              0.0,
              (frame.height / 18.6000003815),
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
              var effectPaint = _EffectCatalog.instance.paint_2;
              canvas.drawPath(path, effectPaint);
            });
            fillGeometry.forEach((path) {
              canvas.drawPath(path, _PaintCatalog.instance.paint_2);
            });
            canvas.restore();
          };
          draw_186_21(canvas, frame);
        }
      };
      draw_226_3(canvas, frame);
      if (this.title?.isVisible ?? true) {
// 204:67 : $title (TEXT)
        var draw_204_67 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              59.0000000000,
              18.0000000000,
              (container.width - (107.0000000000)),
              (container.height -
                  (35.0000000000))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:59.0,t:18.0,r:48.0,b:48.0,w:482.0,h:28.0) */;
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
          var paragraphStyle = ui.ParagraphStyle(
            fontFamily: 'Roboto',
            textAlign: TextAlign.left,
            fontSize: 16.0000000000,
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
    canvas.translate(-66.0000000000, -41.0000000000);

// 186:44 : TodoLogo (COMPONENT)
    var draw_186_44 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          66.0000000000,
          41.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:66.0,t:41.0,r:-66.0,b:-66.0,w:589.0,h:239.0) */;
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

// 186:40 : Rectangle (RECTANGLE)
      var draw_186_40 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (42.5000000000)),
            ((container.height / 2.0) - 0.0),
            60.1040763855,
            60.1040763855) /* H:CENTER V:CENTER F:(l:252.0,t:119.5,r:276.89592361450195,b:276.89592361450195,w:60.10407638549805,h:60.10407638549805) */;
        canvas.save();
        canvas.transform(Float64List.fromList([
          0.7071067691,
          -0.7071067691,
          0.0,
          0.0,
          0.7071067691,
          0.7071067691,
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
          (frame.width / 60.1040763855),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 60.1040763855),
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
          var effectPaint = _EffectCatalog.instance.paint_2;
          canvas.drawPath(path, effectPaint);
        });
        fillGeometry.forEach((path) {
          canvas.drawPath(path, _PaintCatalog.instance.paint_2);
        });
        canvas.restore();
      };
      draw_186_40(canvas, frame);

// 186:42 : Vector (VECTOR)
      var draw_186_42 = (Canvas canvas, Rect container) {
        var frame = Rect.fromLTWH(
            ((container.width / 2.0) - (12.9770507813)),
            ((container.height / 2.0) - 1.3659667969),
            39.2725524902,
            26.2955341339) /* H:CENTER V:CENTER F:(l:281.52294921875,t:118.134033203125,r:268.2044982910156,b:268.2044982910156,w:39.272552490234375,h:26.295534133911133) */;
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
          (frame.width / 39.2725524902),
          0.0,
          0.0,
          0.0,
          0.0,
          (frame.height / 26.2955341339),
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
        var strokes = [_PaintCatalog.instance.paint_0];
        var strokeGeometry = [
          _PathCatalog.instance.path_2.transform(transform)
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
            ((container.width / 2.0) - (11.5000000000)),
            ((container.height / 2.0) - 7.7329711914),
            29.3690376282,
            12.9770164490) /* H:CENTER V:CENTER F:(l:283.0,t:111.76702880859375,r:276.6309623718262,b:276.6309623718262,w:29.369037628173828,h:12.97701644897461) */;
        canvas.save();
        canvas.transform(Float64List.fromList([
          0.7071067691,
          -0.7071067691,
          0.0,
          0.0,
          0.7071067691,
          0.7071067691,
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
          fontSize: 16.0000000000,
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
  }

  Path path_0;

  Path path_1;

  Path path_2;

  static final _PathCatalog instance = _PathCatalog();

  static Path _build_0() {
    var path = Path();
    path.moveTo(31.0000000000, 15.5000000000);
    path.cubicTo(31.0000000000, 24.0604133606, 24.0604133606, 31.0000000000,
        15.5000000000, 31.0000000000);
    path.cubicTo(
        6.9395861626, 31.0000000000, 0.0, 24.0604133606, 0.0, 15.5000000000);
    path.cubicTo(0.0, 6.9395861626, 6.9395861626, 0.0, 15.5000000000, 0.0);
    path.cubicTo(24.0604133606, 0.0, 31.0000000000, 6.9395861626, 31.0000000000,
        15.5000000000);
    path.close();
    return path;
  }

  static Path _build_1() {
    var path = Path();
    path.moveTo(18.6000003815, 9.3000001907);
    path.cubicTo(18.6000003815, 14.4362487793, 14.4362487793, 18.6000003815,
        9.3000001907, 18.6000003815);
    path.cubicTo(
        4.1637520790, 18.6000003815, 0.0, 14.4362487793, 0.0, 9.3000001907);
    path.cubicTo(0.0, 4.1637520790, 4.1637520790, 0.0, 9.3000001907, 0.0);
    path.cubicTo(14.4362487793, 0.0, 18.6000003815, 4.1637520790, 18.6000003815,
        9.3000001907);
    path.close();
    return path;
  }

  static Path _build_2() {
    var path = Path();
    path.moveTo(2.1213202477, 11.1971969604);
    path.cubicTo(0.9497473836, 10.0256242752, -0.9497475028, 10.0256242752,
        -2.1213204861, 11.1971969604);
    path.cubicTo(-3.2928931713, 12.3687696457, -3.2928931713, 14.2682647705,
        -2.1213202477, 15.4398374557);
    path.lineTo(2.1213202477, 11.1971969604);
    path.close();
    path.moveTo(12.9770174026, 26.2955341339);
    path.lineTo(10.8556966782, 28.4168548584);
    path.lineTo(12.9770174026, 30.5381755829);
    path.lineTo(15.0983371735, 28.4168548584);
    path.lineTo(12.9770174026, 26.2955341339);
    path.close();
    path.moveTo(41.3938713074, 2.1213204861);
    path.cubicTo(42.5654449463, 0.9497475028, 42.5654449463, -0.9497473836,
        41.3938713074, -2.1213202477);
    path.cubicTo(40.2223014832, -3.2928931713, 38.3228034973, -3.2928931713,
        37.1512336731, -2.1213204861);
    path.lineTo(41.3938713074, 2.1213204861);
    path.close();
    path.moveTo(-2.1213202477, 15.4398374557);
    path.lineTo(10.8556966782, 28.4168548584);
    path.lineTo(15.0983371735, 24.1742134094);
    path.lineTo(2.1213202477, 11.1971969604);
    path.lineTo(-2.1213202477, 15.4398374557);
    path.close();
    path.moveTo(15.0983371735, 28.4168548584);
    path.lineTo(41.3938713074, 2.1213204861);
    path.lineTo(37.1512336731, -2.1213204861);
    path.lineTo(10.8556966782, 24.1742134094);
    path.lineTo(15.0983371735, 28.4168548584);
    path.close();
    return path;
  }
}

class _PaintCatalog {
  _PaintCatalog() {
    this.paint_0 = (Paint()..color = _ColorCatalog.instance.color_2);
    this.paint_1 = (Paint()..color = _ColorCatalog.instance.color_4);
    this.paint_2 = (Paint()..color = _ColorCatalog.instance.color_5);
  }

  Paint paint_0;

  Paint paint_1;

  Paint paint_2;

  static final _PaintCatalog instance = _PaintCatalog();
}

class _EffectCatalog {
  _EffectCatalog() {
    this.paint_0 = (Paint()
      ..color = _ColorCatalog.instance.color_1
      ..maskFilter = MaskFilter.blur(
          BlurStyle.normal, BoxShadow.convertRadiusToSigma(8.0)));
    this.paint_1 = (Paint()
      ..color = _ColorCatalog.instance.color_3
      ..maskFilter = MaskFilter.blur(
          BlurStyle.normal, BoxShadow.convertRadiusToSigma(6.0)));
    this.paint_2 = (Paint()
      ..color = _ColorCatalog.instance.color_5
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
    this.color_1 = Color.fromARGB(26, 0, 0, 0);
    this.color_2 = Color.fromARGB(255, 255, 255, 255);
    this.color_3 = Color.fromARGB(41, 0, 0, 0);
    this.color_4 = Color.fromARGB(255, 242, 242, 242);
    this.color_5 = Color.fromARGB(255, 80, 182, 255);
    this.color_6 = Color.fromARGB(255, 85, 85, 85);
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
      fontSize: 16.0000000000,
      fontWeight: FontWeight.w300,
    );
    this.ui_TextStyle_1 = ui.TextStyle(
      fontFamily: 'Roboto',
      color: _ColorCatalog.instance.color_2,
      fontSize: 16.0000000000,
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
