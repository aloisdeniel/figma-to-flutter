import 'package:code_builder/code_builder.dart';
import 'package:code_builder/code_builder.dart' as cb;
import 'package:dart_style/dart_style.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_generator/src/generator.dart';
import 'package:flutter_figma_generator/src/helpers/naming.dart';
import 'package:rfw/dart/model.dart';

import 'helpers/widget.dart';

class DartFigmaCodeGenerator extends FigmaCodeGenerator {
  @override
  String generate(FigmaRemoteLibrary library) {
    final dartLibrary = cb.Library(
      (b) => b
        ..body.addAll([
          ...library.library.widgets
              .map(
                (e) => _simpleWidgetClass(e),
              )
              .expand((element) => element),
          ..._widgetWithVariantsClasses(library.library.widgets),
        ])
        ..directives.addAll([]),
    );

    final emitter = DartEmitter();
    final source = '${dartLibrary.accept(emitter)}';
    return DartFormatter().format(source);
  }

  List<Class> _widgetWithVariantsClasses(List<WidgetDeclaration> widgets) {
    final variantSets = <String, List<String>>{};

    for (var item in widgets) {
      final splits = item.name.split('_');
      if (splits.length > 2) {
        final componentName = splits.first;
        final variantClassname = splits.skip(1).join('_').asClassName();
        final names = variantSets.putIfAbsent(componentName, () => <String>[]);
        names.add(variantClassname);
      }
    }

    return [
      ...variantSets.entries.map(
        (e) =>
            buildWidgetWithVariantFactories(name: e.key, variantNames: e.value)
                .build(),
      ),
    ];
  }

  /// A stateless widget with no variants.
  List<Class> _simpleWidgetClass(WidgetDeclaration declaration) {
    final block = BlockBuilder();
    block.statements.add(Code('return ${_node(declaration.root)};'));

    return [
      buildStatelessWidget(
        name: declaration.name,
        buildBody: block.build(),
      ).build(),
      if (declaration.initialState != null) ...[
        _widgetDataClass(declaration).build(),
        _widgetThemeClass(declaration).build(),
      ],
    ];
  }

  ClassBuilder _widgetDataClass(WidgetDeclaration declaration) {
    final data = declaration.initialState!['data'];
    return ClassBuilder();
  }

  ClassBuilder _widgetThemeClass(WidgetDeclaration declaration) {
    final theme = declaration.initialState!['theme'];
    return ClassBuilder();
  }

  String _node(BlobNode node) {
    throw Exception('TODO');
  }
}
