import 'dart:math';

import 'package:figma/figma.dart' as figma;
import 'package:flutter/material.dart';

extension NodeExtension on figma.Node {
  /// Extract all children for nodes that have children, else return
  /// an empty list.
  List<figma.Node> getChildren() {
    final $this = this;
    if ($this is figma.Canvas) {
      return $this.children;
    } else if ($this is figma.Document) {
      return $this.children;
    } else if ($this is figma.Frame) {
      return $this.children;
    }
    return const <figma.Node>[];
  }

  /// Find the descendent node with the given [id].
  ///
  /// Returns `null` if not found.
  figma.Node findNodeWithId(String id) {
    if (this.id == id) {
      return this;
    }

    return getChildren()
        .map(
          (e) => e.findNodeWithId(id),
        )
        .firstWhere(
          (x) => x != null,
          orElse: () => null,
        );
  }

  /// Find the descendent node with the given [name].
  ///
  /// Returns `null` if not found.
  figma.Node findNodeWithName(String name) {
    if (this.name == name) {
      return this;
    }

    return getChildren()
        .map(
          (e) => e.findNodeWithName(name),
        )
        .firstWhere(
          (x) => x != null,
          orElse: () => null,
        );
  }

  Size designSize() {
    final $this = this;
    if ($this is figma.Vector) {
      return Size($this.size.x, $this.size.y);
    }
    if ($this is figma.Frame) {
      return Size($this.size.x, $this.size.y);
    }
    return Size.zero;
  }
}

extension FileResponseExtension on figma.FileResponse {
  /// Find the node associated to the component with the given [name].
  ///
  /// Returns `null` if not found.
  figma.Node findComponentWithName(String name) {
    if (components == null) return null;
    final node = components.entries.firstWhere(
      (e) => e.value.name == name,
      orElse: () => null,
    );
    if (node == null) return null;
    return document.findNodeWithId(node.key);
  }
}

extension NumExtension on num {
  bool isAlmostSame(num other) {
    return (this > other - 0.001) && (this < other + 0.001);
  }
}

extension ListNumExtension on List<num> {
  /// Converts the list of values to a border radius.
  BorderRadius toBorderRadius() {
    if (this == null) return BorderRadius.zero;
    final topLeft = this[0] ?? 0.0;
    final topRight = this[1] ?? 0.0;
    final bottomLeft = this[2] ?? 0.0;
    final bottomRight = this[3] ?? 0.0;
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft.toDouble()),
      topRight: Radius.circular(topRight.toDouble()),
      bottomLeft: Radius.circular(bottomLeft.toDouble()),
      bottomRight: Radius.circular(bottomRight.toDouble()),
    );
  }
}

extension ListListNumExtension on List<List<num>> {
  Offset get position => Offset(this[0][2], this[1][2]);

  double get rotation => atan2(-this[0][1], this[0][0]);

  bool get isRotated {
    final r00 = this[0][0];
    final r01 = this[0][1];
    final r10 = this[1][0];
    final r11 = this[1][1];
    return !(r00.isAlmostSame(1.0) &&
        r01.isAlmostSame(0.0) &&
        r10.isAlmostSame(0.0) &&
        r11.isAlmostSame(1.0));
  }
}

extension ColorExtension on figma.Color {
  Color toFlutterColor([double opacity = 1.0]) {
    var ir = ((r ?? 0.0) * 255).toInt();
    var ig = ((g ?? 0.0) * 255).toInt();
    var ib = ((b ?? 0.0) * 255).toInt();
    var ia = (opacity * (a ?? 1.0) * 255).toInt();
    return Color.fromARGB(ia, ir, ig, ib);
  }
}

extension TypeStyleExtension on figma.TypeStyle {
  TextStyle toFlutterTextStyle() {
    final color = fills
        ?.firstWhere(
          (x) => x.color != null,
          orElse: () => null,
        )
        ?.color
        ?.toFlutterColor();
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      fontSize: fontSize?.toDouble(),
      fontWeight: FontWeight.values.firstWhere(
        (x) => x.index == (fontWeight.toInt() / 100) - 1,
        orElse: () => FontWeight.w400,
      ),
    );
  }
}
