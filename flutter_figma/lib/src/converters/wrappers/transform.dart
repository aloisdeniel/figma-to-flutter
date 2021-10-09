import 'package:flutter/widgets.dart';
import 'package:rfw/formats.dart';

BlobNode wrapTransform(
  BlobNode child,
  List<List<num>>? relativeTransform,
) {
  if (relativeTransform == null) {
    return child;
  }

  var row0 = relativeTransform[0];
  var row1 = relativeTransform[1];

  var cos = row0[0].toDouble();
  var sin = row1[0].toDouble();

  // Absolute matrix
  final noRotation = (cos == 1 && sin == 0);
  if (noRotation) {
    return child;
  }

  final values = <double>[
    //c1
    cos, sin, 0, 0,
    //c2
    -sin, cos, 0, 0,
    //c3
    0, 0, 1, 0,
    //c4
    0, 0, 0, 1,
  ];

  return ConstructorCall(
    'Transform',
    {
      'transform': values,
      'alignment': {'x': 0.0, 'y': 0.0},
      'child': child,
    },
  );
}
