import 'package:flutter_figma/src/code_builders/helpers/instance.dart';
import 'package:recase/recase.dart';
import 'color.dart';
import 'paint.dart';
import 'text_style.dart';

import 'package:figma/figma.dart' as figma;

class ResourcesBuilder {
  final String name;
  final Map<String, ValueBuilder> resources = {};

  ResourcesBuilder(this.name);

  RawValueBuilder value(String name) => RawValueBuilder('style.${name}');

  ValueBuilder addColor(
    String name,
    figma.Color color,
    double opacity,
  ) {
    return add(
      '${name}Color',
      color.toCodeBuilder(opacity),
    );
  }

  ValueBuilder addTextStyle(
    String name,
    figma.Text node,
  ) {
    final color = node.fills
        .firstWhere(
          (x) => x.color != null,
          orElse: () => null,
        )
        ?.color;
    final colorBuilder = addColor(name, color, node.opacity);
    var style = node.style.toCodeBuilder(
      color: colorBuilder,
    );
    return add(
      '${name}TextStyle',
      style,
    );
  }

  ValueBuilder addPaint(
    String name,
    figma.Paint node,
  ) {
    if (node.type == figma.PaintType.solid) {
      final color = addColor(name, node.color, node.opacity);
      return node.toCodeBuilder(
        paintColor: color,
      );
    }
    final gradientColors = ListValueBuilder(node.gradientStops
        .map((x) => addColor(name, x.color, node.opacity))
        .toList());

    return node.toCodeBuilder(
      gradientColors: gradientColors,
    );
  }

  ValueBuilder add(String name, Object resource) {
    var formattedName = ReCase(name).camelCase;
    var index = 1;
    while (resources.containsKey(formattedName)) {
      index++;
    }
    if (index > 1) {
      formattedName = '$formattedName$index';
    }

    resources[formattedName] = resource;

    return value(formattedName);
  }
}
