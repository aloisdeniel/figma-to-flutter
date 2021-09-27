import 'package:figma/figma.dart';
import 'package:flutter_figma/src/converters/context/context.dart';
import 'package:flutter_figma/src/converters/nodes/node.dart';
import 'package:flutter_figma/src/helpers/api_extensions.dart';
import 'package:flutter_figma/src/helpers/naming.dart';
import 'package:flutter_figma/src/remote/figma.dart';
import 'package:rfw/dart/model.dart';
import 'package:collection/collection.dart';
import 'package:rfw/rfw.dart';

class FigmaRemoteLibrary extends RemoteWidgetLibrary {
  FigmaRemoteLibrary._({
    required List<Import> imports,
    required List<WidgetDeclaration> widgets,
    required this.images,
    required this.components,
    required this.componentSets,
  }) : super(imports, widgets);

  final Map<String, String>? images;
  final List<Node> components;
  final List<Node> componentSets;

  factory FigmaRemoteLibrary({
    required FileResponse file,
    required Map<String, String>? images,
  }) {
    final components = file.components?.entries
            .map(
              (x) => file.document!.findNodeWithId(x.key),
            )
            .whereNotNull()
            .toList() ??
        const <Node>[];
    final componentSets = file.componentSets?.entries
            .map(
              (x) => file.document!.findNodeWithId(x.key),
            )
            .whereNotNull()
            .toList() ??
        const <Node>[];

    var index = 0;
    final library = RemoteWidgetLibrary(
      [
        const Import(
          LibraryName(<String>['core', 'widgets']),
        ),
        const Import(
          LibraryName(<String>['addons', 'widgets']),
        ),
      ],
      [
        ...components.whereNotNull().map(
          (node) {
            final name = node.name?.asClassName() ?? 'Component${index++}';
            final context = FigmaComponentContext(
              response: file,
              componentSets: componentSets,
              components: components,
            );
            final declaration = WidgetDeclaration(
              name,
              {
                'data': context.data.toMap(),
                'theme': context.theme.toMap(),
              },
              convertNode(context, node, true)!,
            );

            return declaration;
          },
        ),
        ...componentSets.whereType<Frame>().whereNotNull().map(
          (frame) {
            final variants = <WidgetDeclaration>[];

            final componentName =
                frame.name?.asClassName() ?? 'Component${index++}';

            if (frame.children != null) {
              for (var child in frame.children!.whereNotNull()) {
                final context = FigmaComponentContext(
                  response: file,
                  componentSets: componentSets,
                  components: components,
                );

                final properties = VariantDefinition.parseProperties(
                  child.name ?? '',
                );
                final variantName = FigmaRemote.nameForVariants(
                  componentName,
                  properties,
                );

                variants.add(
                  WidgetDeclaration(
                    variantName,
                    {
                      'data': context.data.toMap(),
                      'theme': context.theme.toMap(),
                    },
                    convertNode(context, child, true)!,
                  ),
                );
              }
            }

            return variants;
          },
        ).expand((element) => element),
      ],
    );

    return FigmaRemoteLibrary._(
      widgets: library.widgets,
      imports: library.imports,
      images: images,
      componentSets: componentSets,
      components: components,
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
