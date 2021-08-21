import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma_generator/src/code_builders/helpers/instance.dart';
import 'package:flutter_figma_generator/src/code_builders/resources/resources.dart';
import 'package:flutter_figma_generator/src/code_builders/widgets/widget.dart';

class TextCodeBuilder extends FigmaWidgetCodeBuilder<figma.Text> {
  @override
  ValueBuilder buildInstance(ResourcesBuilder resources, figma.Text node) {
    final textAlign = () {
      switch (node.style?.textAlignHorizontal) {
        case figma.TextAlignHorizontal.right:
          return 'TextAlign.right';
        case figma.TextAlignHorizontal.center:
          return 'TextAlign.center';
        case figma.TextAlignHorizontal.justified:
          return 'TextAlign.justify';
        default:
          return 'TextAlign.left';
      }
    }();

    final defaultStyle = resources.addTextStyle(node.name ?? 'style', node);

    return InstanceBuilder(
      'FigmaText',
      [
        NamedArgument('key', 'Key(${node.id})'),
        NamedArgument('defaultStyle', defaultStyle),
        NamedArgument('textAlign', textAlign),
        if (node.characterStyleOverrides?.isNotEmpty ?? false)
          NamedArgument('spans', _buildSpans(node)),
        NamedArgument(
          'characters',
          node.characters ?? ConstantBuilder(''),
        ),
        if (node.opacity != null && node.opacity! < 1)
          NamedArgument('opacity', node.opacity!),
        if (node.relativeTransform != null)
          NamedArgument(
            'relativeTransform',
            node.relativeTransform!,
          ),
      ],
    );
  }

  static ListValueBuilder _buildSpans(figma.Text node) {
    final children = <ValueBuilder>[];

    // TODO

    return ListValueBuilder(children);
  }
}
