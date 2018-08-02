import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Card1 extends StatelessWidget {
  Card1(
      {this.rectangleProvider,
      this.imageProvider,
      this.title,
      this.description,
      this.loveCount});

  final ImageProvider rectangleProvider;

  final ImageProvider imageProvider;

  final TextData title;

  final TextData description;

  final TextData loveCount;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: Card1Painter(
            rectangleProvider, imageProvider, title, description, loveCount));
  }
}

class Card1Painter extends ChangeNotifier implements CustomPainter {
  Card1Painter(ImageProvider rectangleProvider, ImageProvider imageProvider,
      this.title, this.description, this.loveCount) {
    this.rectangleProvider = (rectangleProvider != null)
        ? DecorationImage(image: rectangleProvider, fit: BoxFit.cover)
            .createPainter(_onUpdate)
        : null;
    this.imageProvider = (imageProvider != null)
        ? DecorationImage(image: imageProvider, fit: BoxFit.cover)
            .createPainter(_onUpdate)
        : null;
  }

  DecorationImagePainter rectangleProvider;

  DecorationImagePainter imageProvider;

  final TextData title;

  final TextData description;

  final TextData loveCount;

  void _onUpdate() => this.notifyListeners();
  bool hitTest(Offset offset) => false;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.transparent, BlendMode.screen);
    var frame = Offset.zero & size;
    canvas.translate(-19.0000000000, -17.0000000000);

// 267:46 : Card1 (COMPONENT)
    var draw_267_46 = (Canvas canvas, Rect container) {
      var frame = Rect.fromLTWH(
          19.0000000000,
          17.0000000000,
          (container.width - (0.0)),
          (container.height -
              (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:19.0,t:17.0,r:-19.0,b:-19.0,w:378.0,h:114.0) */;
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

// 267:39 : Group (GROUP)
      var draw_267_39 = (Canvas canvas, Rect container) {
// 267:36 : Rectangle (RECTANGLE)
        var mask = Path();
        var clipTransform = Float64List.fromList([
          (frame.width / 378.0000000000),
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
        var clipGeometry = [
          Path()
            ..addRRect(RRect.fromRectAndRadius(
                Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                Radius.circular(4.0)))
        ];
        clipGeometry.forEach((p) => mask.addPath(p, Offset.zero));
        canvas.clipPath(mask);
        var draw_267_36 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              0.0,
              (container.width - (0.0)),
              (container.height -
                  (0.0))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:0.0,t:0.0,r:0.0,b:0.0,w:378.0,h:114.0) */;
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
            (frame.width / 378.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(4.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_0);
          });
          fillGeometry.forEach((path) {
            if (rectangleProvider != null) {
              rectangleProvider.paint(
                  canvas, path.getBounds(), path, ImageConfiguration());
            }
          });
          canvas.restore();
        };
        draw_267_36(canvas, frame);

// 267:35 : image (RECTANGLE)
        var draw_267_35 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              -0.0000000000,
              -171.0000000000,
              (container.width - (0.0)),
              (container.height -
                  (-274.0000000000))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:-1.1368683772161603e-13,t:-171.0,r:1.1368683772161603e-13,b:1.1368683772161603e-13,w:378.0,h:388.0) */;
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
            (frame.width / 378.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 388.0000000000),
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
            if (imageProvider != null) {
              imageProvider.paint(
                  canvas, path.getBounds(), path, ImageConfiguration());
            }
          });
          canvas.restore();
        };
        draw_267_35(canvas, frame);

// 284:0 : Rectangle (RECTANGLE)
        var draw_284_0 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              0.0,
              -2.0000000000,
              (container.width - (0.0)),
              (container.height -
                  (-2.0000000000))) /* H:LEFT_RIGHT V:TOP_BOTTOM F:(l:0.0,t:-2.0,r:0.0,b:0.0,w:378.0,h:116.0) */;
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
            (frame.width / 378.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 116.0000000000),
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
        draw_284_0(canvas, frame);

// 267:37 : Rectangle 2 (RECTANGLE)
        var draw_267_37 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              -0.0000000000,
              (container.height - (31.0000305176)),
              (container.width - (0.0)),
              31.0000000000) /* H:LEFT_RIGHT V:BOTTOM F:(l:-1.1368683772161603e-13,t:82.99996948242188,r:1.1368683772161603e-13,b:1.1368683772161603e-13,w:378.0,h:31.0) */;
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
            (frame.width / 378.0000000000),
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
            (Path()
              ..addRect(Rect.fromLTWH(0.0, 0.0, frame.width, frame.height)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_2);
          });
          canvas.restore();
        };
        draw_267_37(canvas, frame);
        if (this.title?.isVisible ?? true) {
// 267:38 : $title (TEXT)
          var draw_267_38 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                9.9999952316,
                (container.height - (25.0000305176)),
                (container.width - (62.0000000000)),
                14.0000000000) /* H:LEFT_RIGHT V:BOTTOM F:(l:9.999995231628418,t:88.99996948242188,r:52.00000476837158,b:52.00000476837158,w:316.0,h:14.0) */;
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
              fontSize: 9.0000000000,
              fontWeight: FontWeight.w700,
            );
            var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
              ..pushStyle(style_0);
            if (this?.title?.text == null) {
              paragraphBuilder.addText("My item");
            } else {
              paragraphBuilder.addText(this.title.text);
            }
            var paragraph = paragraphBuilder.build();
            paragraph.layout(new ui.ParagraphConstraints(width: frame.width));
            canvas.drawParagraph(paragraph, Offset.zero);
            canvas.restore();
          };
          draw_267_38(canvas, frame);
        }
        if (this.description?.isVisible ?? true) {
// 267:40 : $description (TEXT)
          var draw_267_40 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                9.9999952316,
                (container.height - (13.9999694824)),
                (container.width - (62.0000000000)),
                14.0000000000) /* H:LEFT_RIGHT V:BOTTOM F:(l:9.999995231628418,t:100.00003051757812,r:52.00000476837158,b:52.00000476837158,w:316.0,h:14.0) */;
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
            var style_0 = _TextStyleCatalog.instance.ui_TextStyle_1;
            var paragraphStyle = ui.ParagraphStyle(
              fontFamily: 'Roboto',
              textAlign: TextAlign.left,
              fontSize: 7.0000000000,
              fontWeight: FontWeight.w400,
            );
            var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
              ..pushStyle(style_0);
            if (this?.description?.text == null) {
              paragraphBuilder.addText("A bried description of the item");
            } else {
              paragraphBuilder.addText(this.description.text);
            }
            var paragraph = paragraphBuilder.build();
            paragraph.layout(new ui.ParagraphConstraints(width: frame.width));
            canvas.drawParagraph(paragraph, Offset.zero);
            canvas.restore();
          };
          draw_267_40(canvas, frame);
        }
      };
      draw_267_39(canvas, frame);

// 267:42 : Group (GROUP)
      var draw_267_42 = (Canvas canvas, Rect container) {
// 267:41 : Rectangle (RECTANGLE)
        var draw_267_41 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (47.0000000000)),
              (container.height - (25.0000000000)),
              38.0000000000,
              18.0000000000) /* H:RIGHT V:BOTTOM F:(l:331.0,t:89.0,r:9.0,b:9.0,w:38.0,h:18.0) */;
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
            (frame.width / 38.0000000000),
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
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                  Rect.fromLTWH(0.0, 0.0, frame.width, frame.height),
                  Radius.circular(23.0)))
          ];
          fillGeometry.forEach((path) {
            canvas.drawPath(path, _PaintCatalog.instance.paint_3);
          });
          canvas.restore();
        };
        draw_267_41(canvas, frame);

// 267:43 : Vector (VECTOR)
        var draw_267_43 = (Canvas canvas, Rect container) {
          var frame = Rect.fromLTWH(
              (container.width - (24.0000000000)),
              (container.height - (19.0000000000)),
              8.0000000000,
              7.0000000000) /* H:RIGHT V:BOTTOM F:(l:354.0,t:95.0,r:16.0,b:16.0,w:8.0,h:7.0) */;
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
            (frame.width / 8.0000000000),
            0.0,
            0.0,
            0.0,
            0.0,
            (frame.height / 7.0000000000),
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
          var strokes = [_PaintCatalog.instance.paint_4];
          var strokeGeometry = [
            _PathCatalog.instance.path_0.transform(transform)
          ];
          strokes.forEach((paint) {
            strokeGeometry.forEach((path) {
              canvas.drawPath(path, paint);
            });
          });
          canvas.restore();
        };
        draw_267_43(canvas, frame);
        if (this.loveCount?.isVisible ?? true) {
// 267:44 : $loveCount (TEXT)
          var draw_267_44 = (Canvas canvas, Rect container) {
            var frame = Rect.fromLTWH(
                (container.width - (41.0000000000)),
                (container.height - (20.0000000000)),
                14.0000000000,
                11.0000000000) /* H:RIGHT V:BOTTOM F:(l:337.0,t:94.0,r:27.0,b:27.0,w:14.0,h:11.0) */;
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
            var style_0 = _TextStyleCatalog.instance.ui_TextStyle_2;
            var paragraphStyle = ui.ParagraphStyle(
              fontFamily: 'Roboto',
              textAlign: TextAlign.right,
              fontSize: 9.0000000000,
              fontWeight: FontWeight.w700,
            );
            var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
              ..pushStyle(style_0);
            if (this?.loveCount?.text == null) {
              paragraphBuilder.addText("26");
            } else {
              paragraphBuilder.addText(this.loveCount.text);
            }
            var paragraph = paragraphBuilder.build();
            paragraph.layout(new ui.ParagraphConstraints(width: frame.width));
            canvas.drawParagraph(paragraph, Offset.zero);
            canvas.restore();
          };
          draw_267_44(canvas, frame);
        }
      };
      draw_267_42(canvas, frame);
      canvas.restore();
    };
    draw_267_46(canvas, frame);
  }

  @override
  SemanticsBuilderCallback get semanticsBuilder {
    return (Size size) => [];
  }

  @override
  bool shouldRebuildSemantics(Card1Painter oldDelegate) {
    return shouldRepaint(oldDelegate);
  }

  @override
  bool shouldRepaint(Card1Painter oldDelegate) {
    return oldDelegate.rectangleProvider != this.rectangleProvider ||
        oldDelegate.imageProvider != this.imageProvider ||
        oldDelegate.title != this.title ||
        oldDelegate.description != this.description ||
        oldDelegate.loveCount != this.loveCount;
  }
}

class _PathCatalog {
  _PathCatalog() {
    this.path_0 = _build_0();
  }

  Path path_0;

  static final _PathCatalog instance = _PathCatalog();

  static Path _build_0() {
    var path = Path();
    path.moveTo(5.8943524361, 0.0);
    path.lineTo(5.8943524361, 0.5000000000);
    path.lineTo(5.8943524361, 0.0);
    path.close();
    path.moveTo(4.4055790901, 0.6188508272);
    path.lineTo(4.7596974373, 0.9718384743);
    path.lineTo(4.7597804070, 0.9717552662);
    path.lineTo(4.4055790901, 0.6188508272);
    path.close();
    path.moveTo(3.9998977184, 1.0258314610);
    path.lineTo(3.6457796097, 1.3788191080);
    path.cubicTo(3.7395932674, 1.4729332924, 3.8670125008, 1.5258314610,
        3.9998977184, 1.5258314610);
    path.cubicTo(4.1327829361, 1.5258314610, 4.2602024078, 1.4729332924,
        4.3540158272, 1.3788191080);
    path.lineTo(3.9998977184, 1.0258314610);
    path.close();
    path.moveTo(3.5942165852, 0.6188508272);
    path.lineTo(3.2400982380, 0.9718384147);
    path.lineTo(3.2400982380, 0.9718384743);
    path.lineTo(3.5942165852, 0.6188508272);
    path.close();
    path.moveTo(0.6166700721, 0.6188508272);
    path.lineTo(0.2625517845, 0.2658632398);
    path.lineTo(0.6166700721, 0.6188508272);
    path.close();
    path.moveTo(0.6166700721, 3.6059353352);
    path.lineTo(0.2625517845, 3.9589228630);
    path.lineTo(0.2625518143, 3.9589228630);
    path.lineTo(0.6166700721, 3.6059353352);
    path.close();
    path.moveTo(1.0223510265, 4.0129156113);
    path.lineTo(0.6682327986, 4.3659033775);
    path.lineTo(1.0223510265, 4.0129156113);
    path.close();
    path.moveTo(3.9998977184, 7.0000000000);
    path.lineTo(3.6457796097, 7.3529877663);
    path.cubicTo(3.7395932674, 7.4471020699, 3.8670125008, 7.5000000000,
        3.9998977184, 7.5000000000);
    path.cubicTo(4.1327829361, 7.5000000000, 4.2602024078, 7.4471015930,
        4.3540163040, 7.3529877663);
    path.lineTo(3.9998977184, 7.0000000000);
    path.close();
    path.moveTo(7.3831253052, 3.6059353352);
    path.lineTo(7.0290894508, 3.2528645992);
    path.lineTo(7.0290069580, 3.2529475689);
    path.lineTo(7.3831253052, 3.6059353352);
    path.close();
    path.moveTo(7.7373261452, 0.2659463882);
    path.cubicTo(7.4954915047, 0.0232229475, 7.2082695961, -0.1694077402,
        6.8920278549, -0.3008624911);
    path.lineTo(6.5081906319, 0.6225380898);
    path.cubicTo(6.7028460503, 0.7034522891, 6.8798079491, 0.8220912218,
        7.0289239883, 0.9717552662);
    path.lineTo(7.7373261452, 0.2659463882);
    path.close();
    path.moveTo(6.8920278549, -0.3008624911);
    path.cubicTo(6.5757832527, -0.4323185086, 6.2367649078, -0.5000000000,
        5.8943524361, -0.5000000000);
    path.lineTo(5.8943524361, 0.5000000000);
    path.cubicTo(6.1049580574, 0.5000000000, 6.3135375977, 0.5416252017,
        6.5081906319, 0.6225380898);
    path.lineTo(6.8920278549, -0.3008624911);
    path.close();
    path.moveTo(5.8943524361, -0.5000000000);
    path.cubicTo(5.5519404411, -0.5000000000, 5.2129206657, -0.4323185980,
        4.8966755867, -0.3008624911);
    path.lineTo(5.2805132866, 0.6225380898);
    path.cubicTo(5.4751658440, 0.5416253209, 5.6837463379, 0.5000000000,
        5.8943524361, 0.5000000000);
    path.lineTo(5.8943524361, -0.5000000000);
    path.close();
    path.moveTo(4.8966755867, -0.3008624911);
    path.cubicTo(4.5804338455, -0.1694076508, 4.2932124138, 0.0232231244,
        4.0513777733, 0.2659463882);
    path.lineTo(4.7597804070, 0.9717552662);
    path.cubicTo(4.9088964462, 0.8220910430, 5.0858578682, 0.7034521699,
        5.2805132866, 0.6225380898);
    path.lineTo(4.8966755867, -0.3008624911);
    path.close();
    path.moveTo(4.0514607430, 0.2658631802);
    path.lineTo(3.6457796097, 0.6728438139);
    path.lineTo(4.3540158272, 1.3788191080);
    path.lineTo(4.7596974373, 0.9718384743);
    path.lineTo(4.0514607430, 0.2658631802);
    path.close();
    path.moveTo(4.3540158272, 0.6728438139);
    path.lineTo(3.9483346939, 0.2658631802);
    path.lineTo(3.2400982380, 0.9718384743);
    path.lineTo(3.6457796097, 1.3788191080);
    path.lineTo(4.3540158272, 0.6728438139);
    path.close();
    path.moveTo(3.9483346939, 0.2658632398);
    path.cubicTo(3.4598433971, -0.2241929471, 2.7969667912, -0.4997946918,
        2.1054432392, -0.4997946918);
    path.lineTo(2.1054432392, 0.5002053380);
    path.cubicTo(2.5307164192, 0.5002053380, 2.9388952255, 0.6696705818,
        3.2400982380, 0.9718384147);
    path.lineTo(3.9483346939, 0.2658632398);
    path.close();
    path.moveTo(2.1054432392, -0.4997946918);
    path.cubicTo(1.4139198065, -0.4997946620, 0.7510432005, -0.2241929621,
        0.2625517845, 0.2658632398);
    path.lineTo(0.9707883596, 0.9718384147);
    path.cubicTo(1.2719913721, 0.6696705818, 1.6801702976, 0.5002053380,
        2.1054432392, 0.5002053380);
    path.lineTo(2.1054432392, -0.4997946918);
    path.close();
    path.moveTo(0.2625517845, 0.2658632398);
    path.cubicTo(-0.2258858830, 0.7558655143, -0.5000000000, 1.4201127291,
        -0.5000000000, 2.1123929024);
    path.lineTo(0.5000000000, 2.1123929024);
    path.cubicTo(0.5000000000, 1.6842991114, 0.6695316434, 1.2740601301,
        0.9707883596, 0.9718384147);
    path.lineTo(0.2625517845, 0.2658632398);
    path.close();
    path.moveTo(-0.5000000000, 2.1123929024);
    path.cubicTo(-0.5000000000, 2.8046729565, -0.2258859277, 3.4689204693,
        0.2625517845, 3.9589228630);
    path.lineTo(0.9707883596, 3.2529475689);
    path.cubicTo(0.6695316434, 2.9507260323, 0.5000000000, 2.5404868126,
        0.5000000000, 2.1123929024);
    path.lineTo(-0.5000000000, 2.1123929024);
    path.close();
    path.moveTo(0.2625518143, 3.9589228630);
    path.lineTo(0.6682327986, 4.3659033775);
    path.lineTo(1.3764693737, 3.6599280834);
    path.lineTo(0.9707883596, 3.2529475689);
    path.lineTo(0.2625518143, 3.9589228630);
    path.close();
    path.moveTo(0.6682327986, 4.3659033775);
    path.lineTo(3.6457796097, 7.3529877663);
    path.lineTo(4.3540163040, 6.6470122337);
    path.lineTo(1.3764693737, 3.6599280834);
    path.lineTo(0.6682327986, 4.3659033775);
    path.close();
    path.moveTo(4.3540163040, 7.3529877663);
    path.lineTo(7.3315625191, 4.3659033775);
    path.lineTo(6.6233258247, 3.6599280834);
    path.lineTo(3.6457796097, 6.6470122337);
    path.lineTo(4.3540163040, 7.3529877663);
    path.close();
    path.moveTo(7.3315625191, 4.3659033775);
    path.lineTo(7.7372431755, 3.9589228630);
    path.lineTo(7.0290069580, 3.2529475689);
    path.lineTo(6.6233258247, 3.6599280834);
    path.lineTo(7.3315625191, 4.3659033775);
    path.close();
    path.moveTo(7.7371606827, 3.9590058327);
    path.cubicTo(7.9791059494, 3.7163991928, 8.1709489822, 3.4284348488,
        8.3018083572, 3.1116054058);
    path.lineTo(7.3775420189, 2.7298574448);
    path.cubicTo(7.2967104912, 2.9255619049, 7.1782784462, 3.1032679081,
        7.0290894508, 3.2528645992);
    path.lineTo(7.7371606827, 3.9590058327);
    path.close();
    path.moveTo(8.3018083572, 3.1116054058);
    path.cubicTo(8.4326667786, 2.7947793007, 8.5000000000, 2.4552474022,
        8.5000000000, 2.1123929024);
    path.lineTo(7.5000000000, 2.1123929024);
    path.cubicTo(7.5000000000, 2.3243279457, 7.4583745003, 2.5341498852,
        7.3775420189, 2.7298574448);
    path.lineTo(8.3018083572, 3.1116054058);
    path.close();
    path.moveTo(8.5000000000, 2.1123929024);
    path.cubicTo(8.5000000000, 1.7695384026, 8.4326667786, 1.4300066233,
        8.3018083572, 1.1131805182);
    path.lineTo(7.3775420189, 1.4949283600);
    path.cubicTo(7.4583745003, 1.6906360388, 7.5000000000, 1.9004578590,
        7.5000000000, 2.1123929024);
    path.lineTo(8.5000000000, 2.1123929024);
    path.close();
    path.moveTo(8.3018083572, 1.1131805182);
    path.cubicTo(8.1709489822, 0.7963510156, 7.9791059494, 0.5083867311,
        7.7371606827, 0.2657801211);
    path.lineTo(7.0290894508, 0.9719215035);
    path.cubicTo(7.1782789230, 1.1215182543, 7.2967104912, 1.2992241383,
        7.3775420189, 1.4949283600);
    path.lineTo(8.3018083572, 1.1131805182);
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
    this.color_1 = Color.fromARGB(255, 196, 196, 196);
    this.color_2 = Color.fromARGB(165, 18, 52, 66);
    this.color_3 = Color.fromARGB(255, 18, 52, 66);
    this.color_4 = Color.fromARGB(255, 255, 255, 255);
    this.color_5 = Color.fromARGB(255, 26, 131, 255);
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
  _TextStyleCatalog() {
    this.ui_TextStyle_0 = ui.TextStyle(
      fontFamily: 'Roboto',
      color: _ColorCatalog.instance.color_4,
      fontSize: 9.0000000000,
      fontWeight: FontWeight.w700,
    );
    this.ui_TextStyle_1 = ui.TextStyle(
      fontFamily: 'Roboto',
      color: _ColorCatalog.instance.color_4,
      fontSize: 7.0000000000,
      fontWeight: FontWeight.w400,
    );
    this.ui_TextStyle_2 = ui.TextStyle(
      fontFamily: 'Roboto',
      color: _ColorCatalog.instance.color_5,
      fontSize: 9.0000000000,
      fontWeight: FontWeight.w700,
    );
  }

  ui.TextStyle ui_TextStyle_0;

  ui.TextStyle ui_TextStyle_1;

  ui.TextStyle ui_TextStyle_2;

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
