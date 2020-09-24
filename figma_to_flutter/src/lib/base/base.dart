import 'dart:math';

/**
 * Converts a Figma point node or size reference to a [Point].
 * 
 * If given value is `null`, then returns `(0.0, 0.0)`.
 */
Point toPoint(dynamic map) {
  if (map == null) {
    return Point(0.0, 0.0);
  }

  var w = map["width"] ?? map["x"];
  var h = map["height"] ?? map["y"];
  return Point(w.toDouble(), h.toDouble());
}