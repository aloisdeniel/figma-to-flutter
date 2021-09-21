import 'package:figma/figma.dart';
import 'package:figma_remote/src/converters/context/context.dart';
import 'package:figma_remote/src/converters/context/data.dart';
import 'package:figma_remote/src/converters/context/theme.dart';
import 'package:figma_remote/src/converters/nodes/node.dart';
import 'package:figma_remote/src/helpers/api_extensions.dart';
import 'package:rfw/dart/model.dart';
import 'package:collection/collection.dart';

class FigmaRemoteLibrary {
  FigmaRemoteLibrary._({
    required this.library,
    required this.componentDefaultData,
    required this.componentDefaultTheme,
  });

  final Map<String, FigmaComponentData> componentDefaultData;
  final Map<String, FigmaComponentTheme> componentDefaultTheme;

  factory FigmaRemoteLibrary({
    required FileResponse file,
    required String componentName,
  }) {
    final components = file.components?.entries.map(
      (x) => file.document!.findNodeWithId(x.key),
    );
    final componentSets = file.componentSets?.entries.map(
      (x) => file.document!.findNodeWithId(x.key),
    );

    var index = 0;
    final componentDefaultData = <String, FigmaComponentData>{};
    final componentDefaultTheme = <String, FigmaComponentTheme>{};
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
        if (components != null)
          ...components.whereNotNull().map(
            (node) {
              final name = node.name ?? 'Component${index++}';
              final context = FigmaComponentContext(response: file);
              final declaration = WidgetDeclaration(
                name,
                null,
                convertNode(context, node)!,
              );

              componentDefaultData[name] = context.data;
              componentDefaultTheme[name] = context.theme;

              return declaration;
            },
          ),
        if (componentSets != null)
          ...componentSets.whereType<Frame>().whereNotNull().map(
            (frame) {
              final context = FigmaComponentContext(response: file);
              final variants = <VariantDefinition>[];

              if (frame.children != null) {
                for (var child in frame.children!.whereNotNull()) {
                  final properties = VariantDefinition.parseProperties(
                    child.name ?? '',
                  );

                  variants.add(
                    VariantDefinition(
                      properties: properties,
                      child: convertNode(context, child)!,
                    ),
                  );
                }
              }

              final name = frame.name ?? 'Component${index++}';
              final declaration = WidgetDeclaration(
                name,
                null,
                ConstructorCall(
                  'Variants',
                  {
                    'variants': const DataReference([
                      'variants',
                    ]),
                    'definitions': [
                      ...variants.map(
                        (v) => {
                          'properties': [
                            ...v.properties.entries.map((e) => {
                                  'name': e.key,
                                  'value': e.value,
                                }),
                          ],
                          'child': v.child,
                        },
                      ),
                    ],
                  },
                ),
              );

              componentDefaultData[name] = context.data;
              componentDefaultTheme[name] = context.theme;

              return declaration;
            },
          ),
      ],
    );
    return FigmaRemoteLibrary._(
      library: library,
      componentDefaultData: componentDefaultData,
      componentDefaultTheme: componentDefaultTheme,
    );
  }
  final RemoteWidgetLibrary library;
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
      final name = parts[0].trim();
      final value = parts[1].trim();
      result[name] = value;
    }

    return result;
  }
}
