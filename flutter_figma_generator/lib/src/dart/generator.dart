import 'package:code_builder/code_builder.dart';
import 'package:code_builder/code_builder.dart' as cb;
import 'package:dart_style/dart_style.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_generator/src/dart/context.dart';
import 'package:flutter_figma_generator/src/generator.dart';
import 'package:flutter_figma_generator/src/helpers/naming.dart';
import 'package:rfw/rfw.dart';

import 'encoders/nodes.dart';
import 'helpers/data.dart';
import 'helpers/read_dependencies.dart';
import 'helpers/theme.dart';
import 'helpers/widget.dart';
import 'options.dart';

class DartFigmaCodeGenerator extends FigmaCodeGenerator<DartGeneratorOptions> {
  @override
  String generate({
    required FigmaRemoteLibrary library,
    required FigmaComponentBase component,
    DartGeneratorOptions options = const DartGeneratorOptions(),
  }) {
    final context = DartGeneratorContext(
      component: component,
      options: options,
    );
    final fileName = component.name.asFileName();
    final dartLibrary = cb.Library(
      (b) => b
        ..body.addAll([
          if (component is FigmaComponentSet)
            ..._widgetWithVariantsClasses(component.variants, component),
          if (component is FigmaComponentVariant)
            ..._simpleWidgetClass(context, component.declaration, component),
          if (component is FigmaComponent)
            ..._simpleWidgetClass(context, component.declaration, component),
        ])
        ..directives.addAll([
          if (component is! FigmaComponentVariant) ...[
            Directive.import('package:flutter/widgets.dart'),
            Directive.import('package:flutter_figma/flutter_figma.dart'),
          ],
          if (component is FigmaComponentVariant) ...[
            ...findComponentDependencies(component.declaration).map(
              (e) => Directive.import('${e.asFileName()}.dart'),
            ),
            Directive.partOf('${component.componentName.asFileName()}.dart'),
          ],
          if (component is FigmaComponentSet) ...[
            /// Files for components
            ...component.variants
                .map((e) => findComponentDependencies(e.declaration))
                .expand((e) => e)
                .toSet()
                .map((e) => Directive.import('${e.asFileName()}.dart')),

            /// Variant part files
            ...component.variants.map(
              (v) => Directive.part(
                  '$fileName.${v.name.asVariantClassName().asFileName()}.dart'),
            ),
          ],
        ]),
    );

    final emitter = DartEmitter(useNullSafetySyntax: true);

    final source = '${dartLibrary.accept(emitter)}';
    return DartFormatter().format(source);
  }

  List<Class> _widgetWithVariantsClasses(
      List<FigmaComponentVariant> widgets, FigmaComponentSet component) {
    final variantSets = <String, List<String>>{};

    for (var item in widgets) {
      final variantClassname = item.name.asVariantClassName();
      final names =
          variantSets.putIfAbsent(item.componentName, () => <String>[]);
      names.add(variantClassname);
    }

    return [
      ...variantSets.entries.map(
        (e) => buildWidgetWithVariantFactories(
          name: e.key,
          variantNames: e.value,
          documentation: [
            'Based on `${component.figmaName}` figma component',
          ],
        ).build(),
      ),
    ];
  }

  /// A stateless widget with no variants.
  List<Class> _simpleWidgetClass(DartGeneratorContext context,
      WidgetDeclaration declaration, FigmaComponentBase component) {
    final themeName = '${declaration.name}Theme'.asClassName();
    final block = BlockBuilder();
    block.statements
        .add(Code('final theme = this.theme ?? $themeName.of(context);'));
    block.statements
        .add(Code('return ${NodeEncoder.node(context, declaration.root)};'));

    return [
      buildStatelessWidget(
        context,
        name: declaration.name,
        initialState: declaration.initialState ?? {},
        buildBody: block.build(),
        documentation: [
          'Based on `${component.figmaName}` figma component',
        ],
      ).build(),
      if (declaration.initialState != null) ...[
        ..._widgetDataClass(context, declaration),
        ..._widgetThemeClass(context, declaration),
      ],
    ];
  }

  List<Class> _widgetDataClass(
      DartGeneratorContext context, WidgetDeclaration declaration) {
    return buildWidgetData(
      context,
      name: declaration.name,
      initialState: declaration.initialState ?? {},
    );
  }

  List<Class> _widgetThemeClass(
      DartGeneratorContext context, WidgetDeclaration declaration) {
    final theme = declaration.initialState!['theme'];

    final builder =
        buildInheritedWidget(name: '${declaration.name}Theme'.asClassName());
    final dataBuilder =
        buildThemeData(context, name: declaration.name, values: theme);
    return [
      builder.build(),
      ...dataBuilder,
    ];
  }
}
