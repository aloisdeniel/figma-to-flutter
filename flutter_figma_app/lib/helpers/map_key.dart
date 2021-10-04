import 'package:collection/collection.dart';

class MapKey<K, V> {
  const MapKey(this.map);
  final Map<K, V> map;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is MapKey<K, V> && const MapEquality().equals(other.map, map);
  }

  @override
  int get hashCode => const MapEquality().hash(map);
}
