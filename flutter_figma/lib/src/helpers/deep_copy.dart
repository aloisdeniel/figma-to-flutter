Map<String, dynamic>? deepMergeMap(
  Map<String, dynamic>? a,
  Map<String, dynamic>? b,
) {
  if (b == null) {
    if (a == null) {
      return null;
    }
    return a;
  }
  if (a == null) {
    return b;
  }
  for (var entry in b.entries) {
    if (!a.containsKey(entry.key)) {
      a[entry.key] = entry.value;
    } else {
      final aValue = a[entry.key];
      final bValue = b[entry.key];
      if (aValue is Map && bValue is Map) {
        a[entry.key] = deepMergeMap(
          aValue as Map<String, dynamic>,
          bValue as Map<String, dynamic>,
        );
      } else {
        a[entry.key] = b[entry.key];
      }
    }
  }

  return a;
}
