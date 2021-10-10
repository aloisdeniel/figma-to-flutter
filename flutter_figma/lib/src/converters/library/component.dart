import 'package:figma/figma.dart';
import 'package:rfw/rfw.dart';

abstract class FigmaComponentBase {
  const FigmaComponentBase({
    required this.figmaNode,
  });
  String get name;
  String get figmaName => figmaNode.name ?? name;
  final Node figmaNode;
}

class FigmaComponent extends FigmaComponentBase {
  const FigmaComponent({
    required Node figmaNode,
    required this.declaration,
    required this.defaultData,
    required this.defaultTheme,
  }) : super(figmaNode: figmaNode);
  final WidgetDeclaration declaration;

  @override
  String get name => declaration.name;

  final Map<String, Object?> defaultData;
  final Map<String, Object?> defaultTheme;
}

class FigmaComponentSet extends FigmaComponentBase {
  const FigmaComponentSet({
    required Node figmaNode,
    required this.name,
    required this.variants,
  }) : super(figmaNode: figmaNode);

  @override
  final String name;
  final List<FigmaComponentVariant> variants;
}

class FigmaComponentVariant extends FigmaComponentBase {
  const FigmaComponentVariant({
    required Node figmaNode,
    required this.variants,
    required this.declaration,
    required this.defaultData,
    required this.defaultTheme,
    required this.componentName,
  }) : super(figmaNode: figmaNode);

  @override
  String get name => declaration.name;
  final String componentName;
  final Map<String, String> variants;
  final WidgetDeclaration declaration;
  final Map<String, Object?> defaultData;
  final Map<String, Object?> defaultTheme;
}
