import 'package:figma/figma.dart';
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:flutter_figma/src/converters/nodes/node.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';
import 'package:flutter_figma/src/helpers/naming.dart';
import 'package:flutter_figma/src/remote/figma.dart';
import 'package:rfw/dart/model.dart';
import 'package:collection/collection.dart';
import 'package:rfw/rfw.dart';

import 'component.dart';

class FigmaRemoteLibrary extends RemoteWidgetLibrary {
  FigmaRemoteLibrary.fromDetails({
    required List<Import> imports,
    required List<WidgetDeclaration> widgets,
    required this.images,
    required this.components,
    required this.componentSets,
  }) : super(imports, widgets);

  final Map<String, String>? images;
  final List<FigmaComponent> components;
  final List<FigmaComponentSet> componentSets;

  factory FigmaRemoteLibrary({
    required FileResponse file,
    required Map<String, String>? images,
  }) {
    final componentNodes = file.components?.entries
            .map(
              (x) => file.document!.findNodeWithId(x.key),
            )
            .whereNotNull()
            .toList() ??
        const <Node>[];
    final componentSetNodes = file.componentSets?.entries
            .map(
              (x) => file.document!.findNodeWithId(x.key),
            )
            .whereNotNull()
            .toList() ??
        const <Node>[];

    var index = 0;
    final imports = [
      const Import(
        LibraryName(<String>['core', 'widgets']),
      ),
      const Import(
        LibraryName(<String>['addons', 'widgets']),
      ),
    ];

    final componentSets =
        componentSetNodes.whereType<Frame>().whereNotNull().map(
      (frame) {
        final variants = <FigmaComponentVariant>[];

        final componentName =
            frame.name?.asClassName() ?? 'Component${index++}';

        if (frame.children != null) {
          for (var child in frame.children!.whereNotNull()) {
            final context = FigmaComponentContext(
              response: file,
              componentSets: componentSetNodes,
              components: componentNodes,
            );

            final properties = VariantDefinition.parseProperties(
              child.name ?? '',
            );
            final variantName = FigmaRemote.nameForVariants(
              componentName,
              properties,
            );

            final defaultData = context.data.toMap();
            final defaultTheme = context.theme.toMap();
            variants.add(
              FigmaComponentVariant(
                figmaNode: child,
                variants: properties,
                defaultData: defaultData,
                defaultTheme: defaultTheme,
                declaration: WidgetDeclaration(
                  variantName,
                  {
                    'data': defaultData,
                    'theme': defaultTheme,
                  },
                  convertNode(context, child, true)!,
                ),
              ),
            );
          }
        }

        return FigmaComponentSet(
          figmaNode: frame,
          name: componentName,
          variants: variants,
        );
      },
    );

    final components = componentNodes
        .whereNotNull()
        .where(
          (node) => !componentSets.any(
            (cset) => cset.variants.any(
              (variant) => variant.figmaNode.id == node.id,
            ),
          ),
        )
        .map(
      (node) {
        final name = node.name?.asClassName() ?? 'Component${index++}';
        final context = FigmaComponentContext(
          response: file,
          componentSets: componentSetNodes,
          components: componentNodes,
        );
        final defaultData = context.data.toMap();
        final defaultTheme = context.theme.toMap();
        final declaration = WidgetDeclaration(
          name,
          {
            'data': defaultData,
            'theme': defaultTheme,
          },
          convertNode(context, node, true)!,
        );

        return FigmaComponent(
          figmaNode: node,
          defaultData: defaultData,
          defaultTheme: defaultTheme,
          declaration: declaration,
        );
      },
    );

    final widgets = [
      ...components.map((e) => e.declaration),
      ...componentSets
          .map((e) => e.variants.map((e) => e.declaration))
          .expand((element) => element),
    ];

    return FigmaRemoteLibrary.fromDetails(
      widgets: widgets,
      imports: imports,
      images: images,
      componentSets: componentSets.toList(),
      components: components.toList(),
    );
  }
}

class VariantDefinition {
  const VariantDefinition({
    required this.child,
    required this.properties,
  });

  final Map<String, String> properties;
  final BlobNode child;

  /// Extract properties from a node name
  static Map<String, String> parseProperties(String name) {
    final result = <String, String>{};
    final properties = name.split(',').map((x) => x.trim());
    for (var property in properties) {
      final parts = property.split('=');
      if (parts.length < 2) return const <String, String>{};
      final name = parts[0].trim();
      final value = parts[1].trim();
      result[name] = value;
    }

    return result;
  }

  static String createKey(Map<String, String> values) {
    if (values.isEmpty) return '';
    final entries = [
      ...values.entries.map((e) => '${e.key}=${e.value}'),
    ]..sort((x, y) => x.compareTo(y));
    return '{${entries.join(',')}}';
  }
}
