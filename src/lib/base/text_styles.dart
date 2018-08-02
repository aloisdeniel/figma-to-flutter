import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/tools/code_catalog.dart';
import 'package:figma_to_flutter/tools/format.dart';

/**
 * A code generator that translates Figma text style nodes 
 * into Flutter [TextStyle] equivalents.
 */
class TextStyleGenerator {
  CodeCatalog catalog = CodeCatalog("_TextStyleCatalog", "ui.TextStyle");

  Code generate(dynamic map, String color) {
    var fontSize = map["fontSize"].toDouble();
    var textAlignHorizontal = map["textAlignHorizontal"] as String;
    var textAlignVertical = map["textAlignVertical"] as String;
    var fontFamily = map["fontFamily"] as String;
    var letterSpacing = map["letterSpacing"].toDouble();
    var lineHeightPx = map["lineHeightPx"].toDouble();
    var lineHeightPercent = map["letterSpacing"].toDouble();
    var fontWeight = map["fontWeight"].toInt();

    return catalog.get("ui.TextStyle(" +
        "fontFamily: '$fontFamily'," +
        "color: $color," +
        "fontSize: ${toFixedDouble(fontSize)}," +
        "fontWeight: FontWeight.w$fontWeight," +
        ")");
  }
}

/**
 * A code generator that translates Figma text style nodes 
 * into Flutter [ParagraphStyle] equivalents.
 */
class ParagraphStyleGenerator {
  String _generateTextAlign(String value) {
    switch (value) {
      case "RIGHT":
        return "TextAlign.right";
      case "CENTER":
        return "TextAlign.center";
      case "JUSTIFIED":
        return "TextAlign.justify";
      default:
        return "TextAlign.left";
    }
  }

  Code generate(dynamic map) {
    var fontSize = map["fontSize"].toDouble();
    var textAlignHorizontal =
        _generateTextAlign(map["textAlignHorizontal"] as String);
    var textAlignVertical = map["textAlignVertical"] as String;
    var fontFamily = map["fontFamily"] as String;
    var letterSpacing = map["letterSpacing"].toDouble();
    var lineHeightPx = map["lineHeightPx"].toDouble();
    var lineHeightPercent = map["letterSpacing"].toDouble();
    var fontWeight = map["fontWeight"].toInt();

    return new Code("ui.ParagraphStyle(" +
        "fontFamily: '$fontFamily'," +
        "textAlign: $textAlignHorizontal," +
        "fontSize: ${toFixedDouble(fontSize)}," +
        "fontWeight: FontWeight.w$fontWeight," +
        ")");
  }
}
