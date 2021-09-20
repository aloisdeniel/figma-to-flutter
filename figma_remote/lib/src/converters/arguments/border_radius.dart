import 'package:rfw/dart/model.dart';

DynamicList convertBorderRadius(List<num>? rectangleCornerRadii) {
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
    convertRadius(topLeft),
    convertRadius(topRight),
    convertRadius(bottomRight),
    convertRadius(bottomLeft),
  ];
}

Object? convertRadius(num radius) {
  return {
    'x': radius,
  };
}
