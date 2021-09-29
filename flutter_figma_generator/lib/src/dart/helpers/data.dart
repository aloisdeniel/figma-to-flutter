import 'package:code_builder/code_builder.dart';
import 'package:flutter_figma_generator/src/helpers/naming.dart';

import 'arguments.dart';

List<Class> buildWidgetData({
  required String name,
  required Object? values,
}) {
  final builder = ClassBuilder();
  builder.name = '${name}Data'.asClassName();

  final textClass = values is Map
      ? _buildTextData(
          name: name,
          values: values['text'],
        )
      : null;
  builder.constructors.add(
    Constructor(
      (c) => c
        ..constant = true
        ..optionalParameters.addAll(
          [
            if (textClass != null)
              Parameter(
                (b) => b
                  ..name = 'this.text'
                  ..named = true
                  ..defaultTo = Code('const ${textClass.name}()'),
              ),
          ],
        ),
    ),
  );

  builder.fields.addAll([
    if (textClass != null)
      Field(
        (b) => b
          ..name = 'text'
          ..modifier = FieldModifier.final$
          ..type = refer(textClass.name),
      ),
  ]);

  return [
    builder.build(),
    if (textClass != null) textClass,
  ];
}

Class? _buildTextData({
  required String name,
  required Object? values,
}) {
  if (values is! Map) {
    return null;
  }

  final builder = ClassBuilder();
  builder.name = '${name}TextData'.asClassName();

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
                    ..defaultTo = Code(ArgumentEncoders.string(entry.value)!),
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
            ..type = refer('String'),
        )),
  ]);

  return builder.build();
}
