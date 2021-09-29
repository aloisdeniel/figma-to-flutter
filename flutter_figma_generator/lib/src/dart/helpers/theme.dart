import 'package:code_builder/code_builder.dart';
import 'package:flutter_figma_generator/src/helpers/naming.dart';

import 'arguments.dart';

List<Class> buildThemeData({
  required String name,
  required Object? values,
}) {
  final builder = ClassBuilder();
  builder.name = '${name}ThemeData'.asClassName();

  final colorClass = values is Map
      ? _buildThemeColorData(
          name: name,
          values: values['color'],
        )
      : null;

  final spacingClass = values is Map
      ? _buildThemeSpacingData(
          name: name,
          values: values['spacing'],
        )
      : null;
  builder.constructors.addAll(
    [
      Constructor(
        (c) => c
          ..constant = true
          ..optionalParameters.addAll(
            [
              if (colorClass != null)
                Parameter(
                  (b) => b
                    ..name = 'this.color'
                    ..named = true
                    ..defaultTo = Code('const ${colorClass.name}()'),
                ),
              if (spacingClass != null)
                Parameter(
                  (b) => b
                    ..name = 'this.spacing'
                    ..named = true
                    ..defaultTo = Code('const ${spacingClass.name}()'),
                ),
            ],
          ),
      ),
    ],
  );

  builder.fields.addAll([
    if (colorClass != null)
      Field(
        (b) => b
          ..name = 'color'
          ..modifier = FieldModifier.final$
          ..type = refer(colorClass.name),
      ),
    if (spacingClass != null)
      Field(
        (b) => b
          ..name = 'spacing'
          ..modifier = FieldModifier.final$
          ..type = refer(spacingClass.name),
      ),
  ]);

  return [
    builder.build(),
    if (colorClass != null) colorClass,
    if (spacingClass != null) spacingClass,
  ];
}

Class? _buildThemeColorData({
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
                    ..defaultTo = Code(ArgumentEncoders.color(entry.value)!),
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

Class? _buildThemeSpacingData({
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
                    ..defaultTo = Code(ArgumentEncoders.size(entry.value)!),
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
