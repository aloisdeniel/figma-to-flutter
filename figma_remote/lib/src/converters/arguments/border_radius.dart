import 'package:rfw/dart/model.dart';

DynamicList convertBorderRadius(
    List<num>? rectangleCornerRadii, num? smoothing) {
  if (rectangleCornerRadii == null) return [];

  final topLeft =
      rectangleCornerRadii.isNotEmpty ? rectangleCornerRadii[0] : 0.0;
  final topRight =
      rectangleCornerRadii.length > 1 ? rectangleCornerRadii[1] : 0.0;
  final bottomLeft =
      rectangleCornerRadii.length > 2 ? rectangleCornerRadii[2] : 0.0;
  final bottomRight =
      rectangleCornerRadii.length > 3 ? rectangleCornerRadii[3] : 0.0;
  return [
    convertRadius(topLeft, smoothing),
    convertRadius(topRight, smoothing),
    convertRadius(bottomRight, smoothing),
    convertRadius(bottomLeft, smoothing),
  ];
}

Object? convertRadius(num radius, num? smoothing) {
  return {'x': radius, if (smoothing != null) 'smoothing': smoothing};
}
