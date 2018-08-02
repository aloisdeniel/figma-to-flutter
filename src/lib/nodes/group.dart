import 'dart:math';
import 'package:figma_to_flutter/context.dart';
import 'node.dart';

/**
 * A code generator that translates Figma group nodes into
 * Flutter equivalents.
 * 
 * Group nodes doesn't apply a transform to canvas (like
 * frames), but combine its relative transform with each
 * child one and adds children to its parent.
 * 
 * TODO Add center relative positionning for group children
 * 
 */
class GroupGenerator {
  final NodeGenerator _node;

  GroupGenerator(this._node);

  dynamic _normalizeTransform(dynamic transform1, dynamic transform2) {
    var cos1 = transform1[0][0].toDouble();
    var angle1 = acos(cos1);
    var x1 = transform1[0][2];
    var y1 = transform1[1][2];

    var cos2 = transform2[0][0].toDouble();
    var sin2 = transform2[1][0].toDouble();
    var angle2 = acos(cos2);
    var x2 = transform2[0][2];
    var y2 = transform2[1][2];

    var newAngle = angle1 + angle2;
    var newCos = cos(newAngle);
    var newSin = sin(newAngle);
    var newX = x2 + (x1 * cos2 - y1 * sin2);
    var newY = y2 + (x1 * sin2 + y1 * cos2);

    return [
      [newCos, -newSin, newX],
      [newSin, newCos, newY],
    ];
  }

  /**
  * Indicates whether this generator supports the given node (based on its type).
  */
  bool isSupported(dynamic map) {
    const supported = ['GROUP'];
    return supported.contains(map["type"]);
  }

  void generate(
      BuildContext context, dynamic map, dynamic parent, dynamic transform) {
    map["children"].forEach((child) {
      var normalized =
          _normalizeTransform(child["relativeTransform"], transform);
      this._node.generate(context, child, parent, normalized);
    });
  }
}
