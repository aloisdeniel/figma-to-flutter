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

  builder.methods.add(
    buildWidgetBuildMethod(buildBody),
  );

  return builder;
}

ClassBuilder buildWidgetWithVariantFactories({
  required String name,
  required List<String> variantNames,
}) {
  final builder = ClassBuilder();
  builder.abstract = true;
  builder.name = name.asClassName();
  builder.extend = refer('StatelessWidget');

  for (var variant in variantNames) {
    builder.constructors.add(
      Constructor(
        (c) => c
          ..name = variant.asFieldName()
          ..redirect = refer(variant),
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
