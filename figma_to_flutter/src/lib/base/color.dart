import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/tools/code_catalog.dart';

/**
 * A code generator that translates Figma color nodes into
 * Flutter [Color] equivalents.
 * 
 * Since Figma color components are doubles (from 0.0 to 1.0),
 * a byte representation (from 0 to 255) is calculated.
 */
class ColorGenerator {
  CodeCatalog catalog = CodeCatalog("_ColorCatalog", "Color");

  Code generate(dynamic map, {double opacity = 1.0}) {
    var r = map["r"].toDouble();
    var g = map["g"].toDouble();
    var b = map["b"].toDouble();
    var a = map["a"].toDouble();

    var ir = (r * 255).toInt();
    var ig = (g * 255).toInt();
    var ib = (b * 255).toInt();
    var ia = (a * opacity * 255).toInt();

    return catalog.get("Color.fromARGB($ia, $ir, $ig, $ib)");
  }
}
