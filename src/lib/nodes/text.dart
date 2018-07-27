
import 'dart:math';

import 'package:code_builder/code_builder.dart';
import '../base/paint.dart';
import '../base/color.dart';
import '../tools/case.dart';
import '../base/text_styles.dart';

class TextGenerator {

  final PaintGenerator _paint;
  final ColorGenerator _color;
  final TextStyleGenerator _textStyle;
  final ParagraphStyleGenerator _paragraphStyle;

  TextGenerator(this._paint, this._color, this._textStyle, this._paragraphStyle);

  List<Code> generate(dynamic map) {
 
    var result = List<Code>();
    
    var characters = map["characters"] as String;

    // Styles
    var color = _color.generate(map["fills"].first["color"]); // TODO manage other fills

    var defaultStyle = map["style"];
    var style0 = this._textStyle.generate(defaultStyle, color.toString());
    result.add(new Code("var style_0 = $style0;"));

    map["styleOverrideTable"].forEach((key, value) {
      var map = {}..addAll(defaultStyle)..addAll(value);
      var color = _color.generate(value["fills"].first["color"]); // TODO manage other fills
      var style = this._textStyle.generate(map, color.toString());
      result.add(new Code("var style_$key = $style;"));
    });

    var paragraphStyle = this._paragraphStyle.generate(defaultStyle);
    result.add(new Code("var paragraphStyle = $paragraphStyle;"));
    result.add(new Code("var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)..pushStyle(style_0);"));

    var characterStyleOverrides = map["characterStyleOverrides"];

    /*
          if(this.text.sUUN == null) {
          paragraphBuilder.pushStyle(style_2);
          paragraphBuilder.addText("S");
          paragraphBuilder.pushStyle(style_8);
          paragraphBuilder.addText("UU");
          paragraphBuilder.pushStyle(style_11);
          paragraphBuilder.addText("N");
        }
        else {
          paragraphBuilder.pushStyle(style_2);
          paragraphBuilder.addText(this.text.sUUN);
        }*/
    var varName = toVariableName(map["name"]);
    result.add(new Code("if(this.text.$varName == null) {"));

    if(characterStyleOverrides.isEmpty) {
      result.add(new Code("paragraphBuilder.addText(\"$characters\");"));
    }
    else {
      var styleId = "0";
      var slice = "";
      for (var i = 0; i < characters.length; i++) {
        var newStyleId = i < characterStyleOverrides.length ? characterStyleOverrides[i].toString() : "0";

        if(newStyleId != styleId) {
          if(!slice.isEmpty) {
            result.add(new Code("paragraphBuilder.addText(\"$slice\");"));
          }
          styleId = newStyleId.toString();
          result.add(new Code("paragraphBuilder.pushStyle(style_$styleId);"));
          slice = "";
        }
        slice += characters[i];
      }
      if(!slice.isEmpty) {
        result.add(new Code("paragraphBuilder.addText(\"$slice\");"));
      }
    }

    result.add(new Code("}"));
    result.add(new Code("else {"));

    // We take the style of the first character for our variable text
    if(!characterStyleOverrides.isEmpty) {
      result.add(new Code("paragraphBuilder.pushStyle(style_${characterStyleOverrides[0]});"));
    }

    result.add(new Code("paragraphBuilder.addText(this.text.$varName);"));

    result.add(new Code("}"));

    result.add(new Code("var paragraph = paragraphBuilder.build();"));
    result.add(new Code("paragraph.layout(new ui.ParagraphConstraints(width: frame.width));"));
    result.add(new Code("canvas.drawParagraph(paragraph, Offset.zero);"));

    return result;
  }
}