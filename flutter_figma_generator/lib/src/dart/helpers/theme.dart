import 'package:code_builder/code_builder.dart';
import 'package:flutter_figma_generator/src/dart/context.dart';
import 'package:flutter_figma_generator/src/dart/encoders/arguments.dart';
import 'package:flutter_figma_generator/src/helpers/naming.dart';

List<Class> buildThemeData(
  DartGeneratorContext context, {
  required String name,
  required Object? values,
}) {
  final builder = ClassBuilder();
  builder.name = '${name}ThemeData'.asClassName();

  final colorClass = values is Map
      ? _buildThemeColorData(
          context,
          name: name,
          values: values['color'],
        )
      : null;

  final spacingClass = values is Map
      ? _buildThemeSpacingData(
          context,
          name: name,
          values: values['spacing'],
        )
      : null;

  final textStyleClass = values is Map
      ? _buildThemeTextStyleData(
          context,
          name: name,
          values: values['textStyles'],
        )
      : null;
  builder.constructors.addAll(
    [
      Constructor(
        (c) => c
          ..constant = true
          ..optionalParameters.addAll(
            [
              if (context.options.theme.color && colorClass != null)
                Parameter(
                  (b) => b
                    ..name = 'this.color'
                    ..named = true
                    ..defaultTo = Code('const ${colorClass.name}()'),
                ),
              if (context.options.theme.spacing && spacingClass != null)
                Parameter(
                  (b) => b
                    ..name = 'this.spacing'
                    ..named = true
                    ..defaultTo = Code('const ${spacingClass.name}()'),
                ),
              if (context.options.theme.textStyle && textStyleClass != null)
                Parameter(
                  (b) => b
                    ..name = 'this.textStyle'
                    ..named = true
                    ..defaultTo = Code('const ${textStyleClass.name}()'),
                ),
            ],
          ),
      ),
    ],
  );

  builder.fields.addAll([
    if (context.options.theme.color && colorClass != null)
      Field(
        (b) => b
          ..name = 'color'
          ..modifier = FieldModifier.final$
          ..type = refer(colorClass.name),
      ),
    if (context.options.theme.spacing && spacingClass != null)
      Field(
        (b) => b
          ..name = 'spacing'
          ..modifier = FieldModifier.final$
          ..type = refer(spacingClass.name),
      ),
    if (context.options.theme.textStyle && textStyleClass != null)
      Field(
        (b) => b
          ..name = 'textStyle'
          ..modifier = FieldModifier.final$
          ..type = refer(textStyleClass.name),
      ),
  ]);

  return [
    builder.build(),
    if (context.options.theme.color && colorClass != null) colorClass,
    if (context.options.theme.textStyle && textStyleClass != null)
      textStyleClass,
    if (context.options.theme.spacing && spacingClass != null) spacingClass,
  ];
}

Class? _buildThemeColorData(
  DartGeneratorContext context, {
  required String name,
  required Object? values,
}) {
  if (values is! Map) {
    return null;
  }

  final builder = ClassBuilder();
  builder.name = '${name}ThemeColorData'.asClassName();

  builder.constructors.add(
    Constructor(
      (c) => c
        ..constant = true
        ..optionalParameters.addAll(
          [
            ...values.entries.map((entry) => Parameter(
                  (b) => b
                    ..name = 'this.' + (entry.key as String).asFieldName()
                    ..named = true
                    ..defaultTo =
                        Code(ArgumentEncoders.color(context, entry.value)!),
                ))
          ],
        ),
    ),
  );

  builder.fields.addAll([
    ...values.entries.map((entry) => Field(
          (b) => b
            ..name = (entry.key as String).asFieldName()
            ..modifier = FieldModifier.final$
            ..type = refer('Color'),
        )),
  ]);

  return builder.build();
}

Class? _buildThemeSpacingData(
  DartGeneratorContext context, {
  required String name,
  required Object? values,
}) {
  if (values is! Map) {
    return null;
  }

  final builder = ClassBuilder();
  builder.name = '${name}ThemeSpacingData'.asClassName();

  builder.constructors.add(
    Constructor(
      (c) => c
        ..constant = true
        ..optionalParameters.addAll(
          [
            ...values.entries.map((entry) => Parameter(
                  (b) => b
                    ..name = 'this.' + (entry.key as String).asFieldName()
                    ..named = true
                    ..defaultTo =
                        Code(ArgumentEncoders.size(context, entry.value)!),
                ))
          ],
        ),
    ),
  );

  builder.fields.addAll([
    ...values.entries.map((entry) => Field(
          (b) => b
            ..name = (entry.key as String).asFieldName()
            ..modifier = FieldModifier.final$
            ..type = refer('double'),
        )),
  ]);

  return builder.build();
}

Class? _buildThemeTextStyleData(
  DartGeneratorContext context, {
  required String name,
  required Object? values,
}) {
  if (values is! Map) {
    return null;
  }

  final builder = ClassBuilder();
  builder.name = '${name}ThemeTextStyleData'.asClassName();

  builder.constructors.add(
    Constructor(
      (c) => c
        ..constant = true
        ..optionalParameters.addAll(
          [
            ...values.entries.map((entry) => Parameter(
                  (b) => b
                    ..name = 'this.' + (entry.key as String).asFieldName()
                    ..named = true
                    ..defaultTo =
                        Code(ArgumentEncoders.textStyle(context, entry.value)!),
                ))
          ],
        ),
    ),
  );

  builder.fields.addAll([
    ...values.entries.map((entry) => Field(
          (b) => b
            ..name = (entry.key as String).asFieldName()
            ..modifier = FieldModifier.final$
            ..type = refer('TextStyle'),
        )),
  ]);

  return builder.build();
}
