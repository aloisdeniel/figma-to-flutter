import 'package:code_builder/code_builder.dart';
import 'package:flutter_figma_generator/flutter_figma_generator.dart';
import 'package:flutter_figma_generator/src/helpers/naming.dart';

ClassBuilder buildStatelessWidget(
  DartGeneratorContext context, {
  required String name,
  required Map<String, Object?> initialState,
  required Block buildBody,
  List<String> documentation = const <String>[],
  bool isPrivate = false,
}) {
  final builder = ClassBuilder();
  builder.name = name.asClassName(isPrivate: isPrivate);
  builder.docs.addAll(documentation.map((x) => '/// $x'));
  // It has variants ? Then inherits from parent widget.
  final nameSpits = name.split('_');
  if (nameSpits.length > 1) {
    builder.extend = refer(nameSpits.first);
  } else {
    builder.extend = refer('StatelessWidget');
  }

  final dataTextName = '${name}TextData'.asClassName();
  final themeDataName = '${name}ThemeData'.asClassName();

  final data = initialState['data'] as Map<String, Object?>?;
  final text = data?['text'] as Map<String, Object?>?;

  builder.constructors.add(
    Constructor(
      (c) => c
        ..constant = true
        ..optionalParameters.addAll(
          [
            Parameter(
              (b) => b
                ..name = 'key'
                ..type = refer('Key?')
                ..named = true,
            ),
            if (context.options.data.text && text != null && text.isNotEmpty)
              Parameter(
                (b) => b
                  ..name = 'this.text'
                  ..defaultTo = Code('const $dataTextName()')
                  ..named = true,
              ),
            Parameter(
              (b) => b
                ..name = 'this.theme'
                ..named = true,
            ),
          ],
        )
        ..initializers.add(const Code('super(key: key)')),
    ),
  );

  builder.fields.addAll([
    Field(
      (b) => b
        ..name = 'theme'
        ..modifier = FieldModifier.final$
        ..type = refer(themeDataName + '?'),
    ),
    if (context.options.data.text && text != null && text.isNotEmpty)
      Field(
        (b) => b
          ..name = 'text'
          ..modifier = FieldModifier.final$
          ..type = refer(dataTextName),
      ),
  ]);

  builder.methods.add(
    buildWidgetBuildMethod(buildBody),
  );

  return builder;
}

ClassBuilder buildWidgetWithVariantFactories({
  required String name,
  required List<String> variantNames,
  List<String> documentation = const <String>[],
}) {
  name = name.asClassName();
  final builder = ClassBuilder();
  builder.abstract = true;
  builder.name = name;
  builder.docs.addAll(documentation.map((x) => '/// $x'));
  builder.extend = refer('StatelessWidget');

  builder.constructors.add(
    Constructor(
      (c) => c
        ..constant = true
        ..optionalParameters.addAll([
          Parameter(
            (b) => b
              ..name = 'key'
              ..named = true
              ..type = refer('Key?'),
          ),
        ])
        ..initializers.addAll([
          const Code('super(key: key)'),
        ]),
    ),
  );

  for (var variant in variantNames) {
    final variantName = name + variant.asClassName();
    final dataName = '${variantName}Data';
    final themeDataName = '${variantName}ThemeData';
    builder.constructors.add(
      Constructor(
        (c) => c
          ..name = variant.asFieldName()
          ..factory = true
          ..constant = true
          ..optionalParameters.addAll(
            [
              Parameter(
                (b) => b
                  ..name = 'key'
                  ..type = refer('Key?')
                  ..named = true,
              ),
              Parameter(
                (b) => b
                  ..name = 'data'
                  ..type = refer(dataName)
                  ..named = true,
              ),
              Parameter(
                (b) => b
                  ..name = 'theme'
                  ..named = true
                  ..type = refer(themeDataName),
              ),
            ],
          )
          ..redirect = refer(variantName),
      ),
    );
  }

  return builder;
}

Method buildWidgetBuildMethod(Block buildBody) {
  return Method(
    (b) => b
      ..name = "build"
      ..annotations.add(const CodeExpression(Code("override")))
      ..returns = refer("Widget")
      ..body = buildBody
      ..requiredParameters.add(
        Parameter(
          (b) => b
            ..name = "context"
            ..type = refer('BuildContext'),
        ),
      ),
  );
}

ClassBuilder buildInheritedWidget({
  required String name,
  List<String> documentation = const <String>[],
  bool isPrivate = false,
}) {
  final builder = ClassBuilder();
  builder.name = name.asClassName(isPrivate: isPrivate);
  builder.docs.addAll(documentation.map((x) => '/// $x'));
  builder.extend = refer('InheritedWidget');

  final dataName = '${name}Data'.asClassName();

  builder.constructors.add(
    Constructor(
      (c) => c
        ..constant = true
        ..optionalParameters.addAll(
          [
            Parameter(
              (b) => b
                ..name = 'key'
                ..type = refer('Key?')
                ..named = true,
            ),
            Parameter(
              (b) => b
                ..name = 'this.data'
                ..required = true
                ..named = true,
            ),
            Parameter(
              (b) => b
                ..name = 'child'
                ..type = refer('Widget')
                ..required = true
                ..named = true,
            ),
          ],
        )
        ..initializers.add(const Code('super(key: key, child: child,)')),
    ),
  );

  builder.fields.addAll([
    Field(
      (b) => b
        ..name = 'data'
        ..modifier = FieldModifier.final$
        ..type = refer(dataName),
    ),
  ]);

  builder.methods.addAll([
    Method(
      (b) => b
        ..name = 'of'
        ..static = true
        ..returns = refer(dataName)
        ..requiredParameters.addAll([
          Parameter(
            (b) => b
              ..name = 'context'
              ..type = refer('BuildContext'),
          ),
        ])
        ..body = Code(
            'return context.dependOnInheritedWidgetOfExactType<$name>()?.data ?? const $dataName();'),
    ),
    Method(
      (b) => b
        ..name = 'updateShouldNotify'
        ..returns = refer('bool')
        ..requiredParameters.addAll([
          Parameter(
            (b) => b
              ..name = 'oldWidget'
              ..covariant = true
              ..type = refer(builder.name!),
          ),
        ])
        ..body = const Code(' return data != oldWidget.data;'),
    ),
  ]);

  return builder;
}
