import 'dart:math';

import 'package:figma/figma.dart' as figma;
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_figma/src/rendering/decoration.dart';
import 'package:flutter_figma/src/rendering/effect.dart';
import 'package:flutter_figma/src/rendering/paint.dart';
import 'package:path_drawing/path_drawing.dart';

extension NodeExtension on figma.Node {
  /// Extract all children for nodes that have children, else return
  /// an empty list.
  List<figma.Node> getChildren() {
    final $this = this;
    List<figma.Node?>? children;
    if ($this is figma.Canvas) {
      children = $this.children;
    } else if ($this is figma.Document) {
      children = $this.children;
    } else if ($this is figma.Frame) {
      children = $this.children;
    }
    return children?.whereNotNull().toList() ?? const <figma.Node>[];
  }

  /// Find the descendent node with the given [id].
  ///
  /// Returns `null` if not found.
  figma.Node? findNodeWithId(String id) {
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

  /// Replaces the text for the text node with the given [name].
  figma.Node replaceText(String name, String value) {
    final $this = this;
    if ($this is figma.Text && $this.name == name) {
      return $this.copyWith(
        characters: value,
      );
    }
    if ($this is figma.Canvas) {
      return $this.copyWith(
        children: $this.children
            ?.where((x) => x != null)
            .map((x) => x!.replaceText(name, value))
            .toList(),
      );
    } else if ($this is figma.Document) {
      return $this.copyWith(
        children: $this.children
            ?.where((x) => x != null)
            .map((x) => x!.replaceText(name, value))
            .toList(),
      );
    } else if ($this is figma.Frame) {
      return $this.copyWith(
        children: $this.children
            ?.where((x) => x != null)
            .map((x) => x!.replaceText(name, value))
            .toList(),
      );
    }

    return this;
  }

  /// Replaces the given [color] by the [replacement] in all
  /// fills, strokes and effects in the tree.
  ///
  /// This considers that color is the same even if alpha different,
  /// and it will apply the original alpha to the [replacement].
  figma.Node replaceColor(Color color, Color replacement) {
    final $this = this;

    if ($this is figma.Rectangle) {
      return $this.copyWith(
        fills: $this.fills
            ?.map((x) => x.replaceColor(color, replacement))
            .toList(),
        strokes: $this.strokes
            ?.map((x) => x.replaceColor(color, replacement))
            .toList(),
        effects: $this.effects
            ?.map((x) => x.replaceColor(color, replacement))
            .toList(),
      );
    }
    if ($this is figma.Vector) {
      return $this.copyWith(
        fills: $this.fills
            ?.map((x) => x.replaceColor(color, replacement))
            .toList(),
        strokes: $this.strokes
            ?.map((x) => x.replaceColor(color, replacement))
            .toList(),
        effects: $this.effects
            ?.map((x) => x.replaceColor(color, replacement))
            .toList(),
      );
    }
    if ($this is figma.Text) {
      return $this.copyWith(
        fills: $this.fills
            ?.map((x) => x.replaceColor(color, replacement))
            .toList(),
        strokes: $this.strokes
            ?.map((x) => x.replaceColor(color, replacement))
            .toList(),
        effects: $this.effects
            ?.map((x) => x.replaceColor(color, replacement))
            .toList(),
      );
    }
    if ($this is figma.Canvas) {
      return $this.copyWith(
        children: $this.children
            ?.where((x) => x != null)
            .map((x) => x!.replaceColor(color, replacement))
            .toList(),
      );
    } else if ($this is figma.Document) {
      return $this.copyWith(
        children: $this.children
            ?.where((x) => x != null)
            .map((x) => x!.replaceColor(color, replacement))
            .toList(),
      );
    } else if ($this is figma.Frame) {
      return $this.copyWith(
        fills: $this.fills
            ?.map(
              (x) => x.replaceColor(color, replacement),
            )
            .toList(),
        strokes: $this.strokes
            ?.map(
              (x) => x.replaceColor(color, replacement),
            )
            .toList(),
        effects: $this.effects
            ?.map(
              (x) => x.replaceColor(color, replacement),
            )
            .toList(),
        children: $this.children
            ?.where((x) => x != null)
            .map((x) => x!.replaceColor(color, replacement))
            .toList(),
      );
    }

    return this;
  }

  /// Find the descendent node with the given [name].
  ///
  /// Returns `null` if not found.
  figma.Node? findNodeWithName(String name) {
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

  /// Finds all descendent instances of the component with the [componentId].
  List<figma.Instance> findInstances(String componentId) {
    final $this = this;
    if ($this is figma.Instance && $this.componentId == componentId) {
      return [$this];
    }
    if ($this.type?.toUpperCase() == 'COMPONENT') {
      return const <figma.Instance>[];
    }

    return getChildren()
        .map(
          (e) => e.findInstances(componentId),
        )
        .expand((x) => x)
        .toList();
  }

  Size designSize() {
    final $this = this;
    if ($this is figma.Vector) {
      return Size($this.size?.x.toDouble() ?? 0, $this.size?.y.toDouble() ?? 0);
    }
    if ($this is figma.Frame) {
      return Size($this.size?.x.toDouble() ?? 0, $this.size?.y.toDouble() ?? 0);
    }
    return Size.zero;
  }
}

extension FileResponseExtension on figma.FileResponse {
  /// Find the node associated to the component with the given [name].
  ///
  /// Returns `null` if not found.
  figma.Node? findComponentWithName(String name) {
    if (components == null) return null;
    final node = components?.entries
        .cast<MapEntry<String, figma.Component>?>()
        .firstWhere(
          (e) => e!.value.name == name,
          orElse: () => null,
        );
    if (node == null) return null;
    return document?.findNodeWithId(node.key);
  }
}

extension NumExtension on num {
  bool isAlmostSame(num other) {
    return (this > other - 0.001) && (this < other + 0.001);
  }
}

extension ListNumExtension on List<num>? {
  /// Converts the list of values to a border radius.
  BorderRadius toBorderRadius() {
    if (this == null) return BorderRadius.zero;
    final topLeft = this![0];
    final topRight = this![1];
    final bottomLeft = this![2];
    final bottomRight = this![3];
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft.toDouble()),
      topRight: Radius.circular(topRight.toDouble()),
      bottomLeft: Radius.circular(bottomLeft.toDouble()),
      bottomRight: Radius.circular(bottomRight.toDouble()),
    );
  }
}

extension ListListNumExtension on List<List<num>> {
  Offset get position => Offset(
        this[0][2].toDouble(),
        this[1][2].toDouble(),
      );

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

  figma.Color replaceColor(Color color, Color replacement) {
    final thisFlutter = toFlutterColor();

    if (thisFlutter.red == color.red &&
        thisFlutter.blue == color.blue &&
        thisFlutter.green == color.green) {
      return figma.Color(
        r: replacement.red / 255.0,
        g: replacement.green / 255.0,
        b: replacement.blue / 255.0,
        a: replacement.alpha / 255.0,
      );
    }

    return this;
  }
}

extension TypeStyleExtension on figma.TypeStyle {
  static figma.Paint defaultPaint = figma.Paint(
    visible: true,
    color: figma.Color(),
  );
  TextStyle toFlutterTextStyle([String? package]) {
    final color = fills
        ?.firstWhere(
          (x) => x.color != null,
          orElse: () => defaultPaint,
        )
        .color
        ?.toFlutterColor();
    return TextStyle(
      color: color,
      fontFamily: fontFamily,
      package: package,
      fontSize: fontSize?.toDouble(),
      decoration: textDecoration == figma.TextDecoration.underline
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: color,
      decorationStyle: textDecoration == figma.TextDecoration.underline
          ? TextDecorationStyle.solid
          : null,
      decorationThickness:
          textDecoration == figma.TextDecoration.underline ? 1 : null,
      fontWeight: FontWeight.values.firstWhere(
        (x) => x.index == ((fontWeight?.toInt() ?? 400) / 100) - 1,
        orElse: () => FontWeight.w400,
      ),
    );
  }
}

extension PaintExtension on figma.Paint {
  figma.Paint replaceColor(Color color, Color replacement) {
    return figma.Paint(
        color: this.color?.replaceColor(color, replacement),
        gradientStops: gradientStops
            ?.map((x) => x.replaceColor(color, replacement))
            .toList(),
        opacity: opacity,
        blendMode: blendMode,
        gifRef: gifRef,
        gradientHandlePositions: gradientHandlePositions,
        imageRef: imageRef,
        imageTransform: imageTransform,
        scaleMode: scaleMode,
        scalingFactor: scalingFactor,
        type: type,
        visible: visible);
  }
}

extension EffectExtension on figma.Effect {
  figma.Effect replaceColor(Color color, Color replacement) {
    return figma.Effect(
      color: this.color?.replaceColor(color, replacement),
      blendMode: blendMode,
      type: type,
      visible: visible,
      offset: offset,
      radius: radius,
    );
  }
}

extension ColorStopExtension on figma.ColorStop {
  figma.ColorStop replaceColor(Color color, Color replacement) {
    return figma.ColorStop(
      position: position,
      color: this.color?.replaceColor(color, replacement),
    );
  }
}

extension Vector2DExtension on figma.Vector2D? {
  Offset toOffset() {
    return Offset(
      this?.x.toDouble() ?? 0.0,
      this?.y.toDouble() ?? 0.0,
    );
  }
}

extension ListPaintExtension on List<figma.Paint>? {
  /// Converts the list of values to a border radius.
  List<FigmaPaint> toFlutter() {
    return this
            ?.where((x) => x.visible)
            .map((x) => FigmaPaint.api(x))
            .toList() ??
        const <FigmaPaint>[];
  }
}

extension ListEffectsExtension on List<figma.Effect>? {
  /// Converts the list of values to a border radius.
  List<FigmaEffect> toFlutter() {
    return this
            ?.where((x) => x.visible)
            .map((x) => FigmaEffect.api(x))
            .toList() ??
        const <FigmaEffect>[];
  }
}

extension ListGeometryExtension on List<dynamic>? {
  /// Converts the list of values to a border radius.
  List<Path> toPaths() {
    return this
            ?.map(
              (x) => parseSvgPathData(x['path']),
            )
            .toList() ??
        const <Path>[];
  }
}
