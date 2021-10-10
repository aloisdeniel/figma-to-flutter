import 'package:rfw/rfw.dart';

List<String> findComponentDependencies(BlobNode node) {
  if (node is ConstructorCall) {
    return constructorCall(node);
  }

  return const <String>[];
}

List<String> constructorCall(ConstructorCall node) {
  switch (node.name) {
    case 'Instance':
      final componentName = node.arguments['name'] as String?;
      return [
        if (componentName != null) componentName,
      ];

    default:
      final children = node.arguments['children'] as List?;
      if (children != null && children.isNotEmpty) {
        return [
          ...children
              .map((e) => findComponentDependencies(e as BlobNode))
              .expand((element) => element)
        ];
      }
      final child = node.arguments['child'] as BlobNode?;
      if (child != null) {
        return findComponentDependencies(child);
      }

      return const <String>[];
  }
}
