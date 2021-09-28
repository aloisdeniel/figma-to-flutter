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
      ? buildThemeColorData(
          name: name,
          values: values['colors'],
        )
      : null;
  builder.constructors.add(
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
                  ..required = true
                  ..defaultTo = Code('const ${colorClass.name}()'),
              ),
          ],
        ),
    ),
  );

  builder.fields.addAll([
    if (colorClass != null)
      Field(
        (b) => b
          ..name = 'color'
          ..modifier = FieldModifier.final$
          ..type = refer(colorClass.name),
      ),
  ]);

  return [builder.build(), if (colorClass != null) colorClass];
}

Class? buildThemeColorData({
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
                    ..required = true
                    ..defaultTo = Code(buildColor(entry.value)!),
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
