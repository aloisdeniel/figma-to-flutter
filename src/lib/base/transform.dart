import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/tools/format.dart';

/**
 * A code generator that translates Figma transform matrix nodes 
 * into Flutter [Float64List] equivalents.
 */
class TransformGenerator {
  Code generate(dynamic map) {
    var row0 = map[0];
    var row1 = map[1];

    var a = row0[0].toDouble();
    var b = row0[1].toDouble();
    var d = row1[0].toDouble();
    var e = row1[1].toDouble();

    var values = [
      toFixedDouble(a),
      toFixedDouble(d),
      "0.0",
      "0.0",
      toFixedDouble(b),
      toFixedDouble(e),
      "0.0",
      "0.0",
      "0.0",
      "0.0",
      "1.0",
      "0.0",
      "frame.left",
      "frame.top",
      "0.0",
      "1.0",
    ];

    return new Code("Float64List.fromList([" + values.join(", ") + "])");
  }
}
