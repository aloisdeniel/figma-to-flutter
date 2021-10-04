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

  var r1 = row0[0].toDouble();
  var r2 = row0[1].toDouble();
  var r3 = row1[0].toDouble();
  var r4 = row1[1].toDouble();

  // Absolute matrix
  final noRotation = (r1 == 1 && r2 == 0) && (r3 == 0 && r4 == 1);
  if (noRotation) {
    return child;
  }

  final values = <double>[r1, r3, 0, 0, r2, r4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1];

  return ConstructorCall(
    'Transform',
    {
      'transform': values,
      'child': child,
    },
  );
}
