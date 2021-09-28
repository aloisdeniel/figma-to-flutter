import 'dart:math' as math;

extension RoundExtensions on num {
  double roundFixed([int places = 2]) {
    final mod = math.pow(10.0, places);
    return ((this * mod).round().toDouble() / mod);
  }
}
