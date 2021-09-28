import 'package:code_builder/code_builder.dart';
import 'package:flutter_figma_generator/src/helpers/naming.dart';

ClassBuilder buildStatelessWidget({
  required String name,
  required Block buildBody,
  bool isPrivate = false,
}) {
  final builder = ClassBuilder();
  builder.name = name.asClassName(isPrivate: isPrivate);
  // It has variants ? Then inherits from parent widget.
  final nameSpits = name.split('_');
  if (nameSpits.length > 1) {
    builder.extend = refer(nameSpits.first);
  } else {
    builder.extend = refer('StatelessWidget');
  }

  final dataName = '${name}Data'.asClassName();
  final themeDataName = '${name}ThemeData'.asClassName();

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
                ..defaultTo = Code('const $dataName()')
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
    Field(
      (b) => b
        ..name = 'data'
        ..modifier = FieldModifier.final$
        ..type = refer(dataName),
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
}) {
  name = name.asClassName();
  final builder = ClassBuilder();
  builder.abstract = true;
  builder.name = name;
  builder.extend = refer('StatelessWidget');

  for (var variant in variantNames) {
    final variantName = name + variant.asClassName();
    final dataName = '${variantName}Data';
    final themeDataName = '${variantName}ThemeData';
    builder.constructors.add(
      Constructor(
        (c) => c
          ..name = variant.asFieldName()
          ..factory = true
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
                  ..required = true
                  ..type = refer(dataName)
                  ..defaultTo = Code('const $dataName()')
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
  bool isPrivate = false,
}) {
  final builder = ClassBuilder();
  builder.name = name.asClassName(isPrivate: isPrivate);
  builder.extend = refer('InheritedWidget');

  final dataName = '${name}ThemeData'.asClassName();

  builder.constructors.add(
    Constructor(
      (c) => c
        ..constant = true
        ..optionalParameters.addAll(
          [
            Parameter(
              (b) => b
                ..name = 'Key'
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
            'return context.dependOnInheritedWidgetOfExactType<$name>()?.data ?? const $name();'),
    ),
    Method(
      (b) => b
        ..name = 'updateShouldNotify'
        ..returns = refer('bool')
        ..requiredParameters.addAll([
          Parameter(
            (b) => b
              ..name = 'context'
              ..covariant = true
              ..type = refer('oldWidget'),
          ),
        ])
        ..body = const Code(' return data != oldWidget.data;'),
    ),
  ]);

  return builder;
}
