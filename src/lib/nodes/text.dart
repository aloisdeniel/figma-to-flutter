import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/context.dart';
import 'package:figma_to_flutter/parsing/declaration.dart';
import '../base/paint.dart';
import '../base/color.dart';
import '../tools/format.dart';
import '../base/text_styles.dart';

class TextGenerator {

  final ColorGenerator _color;
  final TextStyleGenerator _textStyle;
  final ParagraphStyleGenerator _paragraphStyle;

  TextGenerator(this._color, this._textStyle, this._paragraphStyle);

  void generate(BuildContext context,dynamic map) {
 
    var declaration = Declaration.parse(map["name"]);
    var varName = toVariableName(declaration.name);
    
    var characters = map["characters"] as String;

    // Styles
    var color = _color.generate(map["fills"].first["color"]); // TODO manage other fills

    var defaultStyle = map["style"];
    var style0 = this._textStyle.generate(defaultStyle, color.toString());
    context.addPaint(["var style_0 = $style0;"]);

    map["styleOverrideTable"].forEach((key, value) {
      var map = {}..addAll(defaultStyle)..addAll(value);
      var color = _color.generate(value["fills"].first["color"]); // TODO manage other fills
      var style = this._textStyle.generate(map, color.toString());
      context.addPaint(["var style_$key = $style;"]);
    });

    var paragraphStyle = this._paragraphStyle.generate(defaultStyle);
    context.addPaint([
      "var paragraphStyle = $paragraphStyle;",
      "var paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)..pushStyle(style_0);",
    ]);

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

      

    if(declaration is DynamicItem) {
      context.addPaint(["if(this?.$varName?.text == null) {"]);
    }

    if(characterStyleOverrides.isEmpty) {
      context.addPaint(["paragraphBuilder.addText(\"$characters\");"]);
    }
    else {
      var styleId = "0";
      var slice = "";
      for (var i = 0; i < characters.length; i++) {
        var newStyleId = i < characterStyleOverrides.length ? characterStyleOverrides[i].toString() : "0";

        if(newStyleId != styleId) {
          if(!slice.isEmpty) {
            context.addPaint(["paragraphBuilder.addText(\"$slice\");"]);
          }
          styleId = newStyleId.toString();
          context.addPaint(["paragraphBuilder.pushStyle(style_$styleId);"]);
          slice = "";
        }
        slice += characters[i];
      }
      if(!slice.isEmpty) {
        context.addPaint(["paragraphBuilder.addText(\"$slice\");"]);
      }
    }

    if(declaration is DynamicItem) {
      context.addPaint(["} else {"]);
      // We take the style of the first character for our variable text
      if(!characterStyleOverrides.isEmpty) {
        context.addPaint(["paragraphBuilder.pushStyle(style_${characterStyleOverrides[0]});"]);
      }
      context.addPaint([
        "paragraphBuilder.addText(this.$varName.text);", 
        "}"
      ]);
    }
    context.addPaint([
      "var paragraph = paragraphBuilder.build();",
      "paragraph.layout(new ui.ParagraphConstraints(width: frame.width));",
      "canvas.drawParagraph(paragraph, Offset.zero);",
    ]);
  }
}