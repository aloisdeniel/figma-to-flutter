import 'package:figma_to_flutter/tools/code_catalog.dart';

import 'color.dart';
import 'package:code_builder/code_builder.dart';

/**
 * A code generator that translates Figma effect nodes into
 * Flutter [Paint] equivalents.
 * 
 * Warning: It only supports **drop shadows** at the moment.
 */
class EffectsGenerator {
  final ColorGenerator _color;

  CodeCatalog catalog = CodeCatalog("_EffectCatalog", "Paint");

  EffectsGenerator(this._color);

  Code generate(dynamic map) {
    var type = map["type"];

    if (type.startsWith("DROP_SHADOW")) {
      var color = _color.generate(map["color"]);
      var radius = map["radius"].toDouble();

      return catalog.get("(Paint()\n" +
          "..color = $color\n" +
          "..maskFilter = MaskFilter.blur(BlurStyle.normal, BoxShadow.convertRadiusToSigma($radius))" +
          ")");
    }

    return catalog.get("Paint()");
  }
}
