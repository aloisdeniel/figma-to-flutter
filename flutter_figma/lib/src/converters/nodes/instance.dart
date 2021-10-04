import 'package:collection/collection.dart';
import 'package:figma/figma.dart' as figma;
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:flutter_figma/src/converters/library/library.dart';
import 'package:flutter_figma/src/converters/wrappers/opacity.dart';
import 'package:flutter_figma/src/converters/wrappers/transform.dart';
import 'package:rfw/rfw.dart';

import 'frame.dart' as frame;

BlobNode convert(FigmaComponentContext context, figma.Instance node) {
  final component = context.response.components?[node.componentId];
  final variantName = component?.name;
  final componentSet = context.componentSets.firstWhereOrNull((x) =>
      x is figma.Frame &&
      (x.children?.any((x) => x?.id == node.componentId) ?? false));
  final componentName = componentSet?.name ?? variantName;
  final variants = VariantDefinition.parseProperties(variantName ?? '');

  /// If auto layout's properties aren't given we copy what's present in original component.
  if (component != null) {
    final componentNode = context.components
        .firstWhereOrNull((x) => x.id == node.componentId) as figma.Frame?;
    if (componentNode != null) {
      node = node.copyWith(
        layoutMode: node.layoutMode ?? componentNode.layoutMode,
        counterAxisSizingMode:
            node.counterAxisSizingMode ?? componentNode.counterAxisSizingMode,
        counterAxisAlignItems:
            node.counterAxisAlignItems ?? componentNode.counterAxisAlignItems,
        primaryAxisAlignItems:
            node.primaryAxisAlignItems ?? componentNode.primaryAxisAlignItems,
        primaryAxisSizingMode:
            node.primaryAxisSizingMode ?? componentNode.primaryAxisSizingMode,
        paddingBottom: node.paddingBottom ?? componentNode.paddingBottom,
        paddingTop: node.paddingTop ?? componentNode.paddingTop,
        paddingRight: node.paddingRight ?? componentNode.paddingRight,
        paddingLeft: node.paddingLeft ?? componentNode.paddingLeft,
        layoutGrow: node.layoutGrow ?? componentNode.layoutGrow,
      );
    }
  }

  BlobNode result = ConstructorCall(
    'Instance',
    {
      'name': componentName,
      'instanceName': node.name,
      'variants': [
        ...variants.entries.map((e) => {
              'name': e.key,
              'value': e.value,
            }),
      ],
      'child': frame.convert(context, node, false),
    },
  );

  result = wrapOpacity(result, node.opacity);
  result = wrapTransform(result, node.relativeTransform);

  return result;
}
