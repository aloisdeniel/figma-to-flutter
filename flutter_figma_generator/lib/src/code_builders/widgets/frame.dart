import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma_generator/src/code_builders/helpers/instance.dart';
import 'package:flutter_figma_generator/src/code_builders/resources/resources.dart';
import 'package:flutter_figma_generator/src/code_builders/widgets/widget.dart';

class FrameBuilder extends FigmaWidgetCodeBuilder<figma.Frame> {
  @override
  ValueBuilder buildInstance(ResourcesBuilder resources, figma.Frame node) {
    return InstanceBuilder('FigmaFrame', [
      NamedArgument('key', RawValueBuilder('Key(${node.id})')),
      NamedArgument('decoration', decoration(resources, node)),
      if (node.opacity != null && node.opacity! < 1)
        NamedArgument('opacity', node.opacity!),
      if (node.relativeTransform != null)
        NamedArgument('relativeTransform', node.relativeTransform!),
    ]);
  }

  static ValueBuilder decoration(ResourcesBuilder resources, figma.Frame node) {
    if (node.fills.isNotEmpty ||
        node.strokes.isNotEmpty ||
        node.effects.isNotEmpty) {
      final fills = node.fills
          .where((x) => x.visible)
          .map((x) => resources.addPaint(node.name, x))
          .toList();
      final strokes = node.strokes
          .where((x) => x.visible)
          .map((x) => resources.addPaint(node.name, x))
          .toList();

      return InstanceBuilder('FigmaPaintDecoration', [
        if (node.strokeWeight != null && node.strokeWeight > 0)
          NamedArgument('strokeWeight', node.strokeWeight),
        if (strokes.isNotEmpty) NamedArgument('strokes', node.strokeWeight),
        if (fills.isNotEmpty) NamedArgument('fills', node.strokeWeight),
        // TODO if (effects.isNotEmpty) NamedArgument('effects', node.strokeWeight),
        NamedArgument(
          'shape',
          InstanceBuilder('FigmaRectangleShape', [
            if (node.rectangleCornerRadii.isNotEmpty)
              NamedArgument('rectangleCornerRadii', node.rectangleCornerRadii),
          ]),
        ),
      ]);
    }

    return null;
  }
}
