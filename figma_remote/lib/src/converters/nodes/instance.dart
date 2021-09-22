import 'package:collection/collection.dart';
import 'package:figma/figma.dart' as figma;
import 'package:figma_remote/src/converters/context/context.dart';
import 'package:figma_remote/src/converters/library/library.dart';
import 'package:rfw/rfw.dart';

import 'frame.dart' as frame;

BlobNode convert(FigmaComponentContext context, figma.Instance node) {
  final variantName = context.response.components?[node.componentId]?.name;
  final componentSet = context.componentSets.firstWhereOrNull((x) =>
      x is figma.Frame &&
      (x.children?.any((x) => x?.id == node.componentId) ?? false));
  final componentName = componentSet?.name ?? variantName;
  final variants = VariantDefinition.parseProperties(variantName ?? '');
  return ConstructorCall(
    'ComponentRenderer',
    {
      'name': componentName,
      'instanceName': node.name,
      'variants': [
        ...variants.entries.map((e) => {
              'name': e.key,
              'value': e.value,
            }),
      ],
      'child': frame.convert(context, node),
    },
  );
}
