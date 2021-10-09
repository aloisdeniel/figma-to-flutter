import 'package:code_builder/code_builder.dart';
import 'package:flutter_figma_generator/src/dart/context.dart';
import 'package:flutter_figma_generator/src/dart/encoders/arguments.dart';
import 'package:flutter_figma_generator/src/helpers/naming.dart';

List<Class> buildWidgetData(
  DartGeneratorContext context, {
  required String name,
  required Map<String, Object?> initialState,
}) {
  final data = initialState['data'] as Map<String, Object?>?;
  final text = data?['text'] as Map<String, Object?>?;

  return [
    if (context.options.data.text && text != null && text.isNotEmpty)
      _buildTextData(
        context,
        name: name,
        values: text,
      )!,
  ];
}

Class? _buildTextData(
  DartGeneratorContext context, {
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
                    ..defaultTo =
                        Code(ArgumentEncoders.string(context, entry.value)!),
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
