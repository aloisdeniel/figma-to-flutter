
import 'package:code_builder/code_builder.dart';

class TextStyleGenerator {

  Code generate(dynamic map, String color) {

    var fontSize = map["fontSize"].toDouble();
    var textAlignHorizontal = map["textAlignHorizontal"] as String;
    var textAlignVertical = map["textAlignVertical"] as String;
    var fontFamily = map["fontFamily"] as String;
    var letterSpacing = map["letterSpacing"].toDouble();
    var lineHeightPx = map["lineHeightPx"].toDouble();
    var lineHeightPercent = map["letterSpacing"].toDouble();
    var fontWeight = map["fontWeight"].toInt();

    return new Code("ui.TextStyle(" +
      "fontFamily: '$fontFamily'," +
      "color: $color," +
      "fontSize: $fontSize," +
      "wordSpacing: $fontSize,"
      "fontWeight: FontWeight.w$fontWeight," +
    ")");
  }
}

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
    var textAlignHorizontal = _generateTextAlign(map["textAlignHorizontal"] as String);
    var textAlignVertical = map["textAlignVertical"] as String;
    var fontFamily = map["fontFamily"] as String;
    var letterSpacing = map["letterSpacing"].toDouble();
    var lineHeightPx = map["lineHeightPx"].toDouble();
    var lineHeightPercent = map["letterSpacing"].toDouble();
    var fontWeight = map["fontWeight"].toInt();

    return new Code("ui.ParagraphStyle(" +
      "fontFamily: '$fontFamily'," +
      "textAlign: $textAlignHorizontal," +
      "fontSize: $fontSize," +
      "fontWeight: FontWeight.w$fontWeight," +
    ")");
  }
}