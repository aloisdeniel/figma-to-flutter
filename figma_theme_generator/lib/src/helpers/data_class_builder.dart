import 'package:code_builder/code_builder.dart';
import 'package:meta/meta.dart';

class DataClassBuilder {
  final String fallbackConstructorName;
  final ClassBuilder builder;
  final Map<String, String> _defaultValues = {};
  ConstructorBuilder _defaultConstructor;

  DataClassBuilder({
    @required String name,
    this.fallbackConstructorName = 'fallback',
  }) : this.builder = ClassBuilder()..name = name {
    _defaultConstructor = ConstructorBuilder()..constant = true;
  }

  void addField(
    String type,
    String name,
    String fallbackValue, {
    bool notNull = true,
  }) {
    _defaultValues[name] = fallbackValue;

    final parameter = ParameterBuilder()
      ..name = name
      ..annotations.add(CodeExpression(Code("required")))
      ..named = true
      ..toThis = true;

    _defaultConstructor.optionalParameters.add(parameter.build());

    if (notNull) {
      _defaultConstructor.initializers.add(Code('assert($name != null)'));
    }

    final field = FieldBuilder()
      ..name = name
      ..modifier = FieldModifier.final$
      ..type = refer(type);
    builder.fields.add(field.build());
  }

  Method _buildCopyWith() {
    final result = MethodBuilder()
      ..returns = refer(builder.name)
      ..name = 'copyWith';

    result.optionalParameters.addAll(
      builder.fields.build().map(
            (e) => Parameter(
              (x) => x
                ..name = e.name
                ..type = e.type
                ..named = true,
            ),
          ),
    );

    final properties = _defaultValues.entries
        .map((e) => '${e.key}: ${e.key} ?? this.${e.key},')
        .join('');
    result.body = Code('${builder.name}($properties)');
    result.lambda = true;
    return result.build();
  }

  Method _buildEquals() {
    final result = MethodBuilder()
      ..annotations.add(CodeExpression(Code("override")))
      ..returns = refer('bool')
      ..name = 'operator ==';

    result.requiredParameters.add(
      Parameter(
        (x) => x
          ..name = 'other'
          ..type = refer('Object'),
      ),
    );

    final properties = _defaultValues.entries
        .map((e) => '${e.key} == other.${e.key}')
        .join(' && ');
    result.body = Code(
        'identical(this, other) || (other is ${builder.name} && $properties)');
    result.lambda = true;
    return result.build();
  }

  Method _buildHash() {
    final result = MethodBuilder()
      ..annotations.add(CodeExpression(Code("override")))
      ..returns = refer('int')
      ..type = MethodType.getter
      ..name = 'hashCode';

    result.requiredParameters.add(
      Parameter(
        (x) => x
          ..name = 'other'
          ..type = refer('Object'),
      ),
    );

    final properties = _defaultValues.entries
        .map((e) => 'const DeepCollectionEquality().hash(${e.key})')
        .join(' ^ ');
    result.body = Code('runtimeType.hashCode ^ $properties');
    result.lambda = true;
    return result.build();
  }

  Class build([bool constantFallback = true]) {
    builder.constructors.add(_defaultConstructor.build());
    final fallbackConstructor = ConstructorBuilder()
      ..name = fallbackConstructorName
      ..factory = true;

    final fallbackProperties =
        _defaultValues.entries.map((e) => '${e.key}: ${e.value},').join('');
    fallbackConstructor.lambda = true;
    fallbackConstructor.body = Code(
        '${constantFallback ? 'const' : ''} ${builder.name}($fallbackProperties)');
    builder.constructors.add(fallbackConstructor.build());
    builder.methods.add(_buildCopyWith());
    builder.methods.add(_buildEquals());
    builder.methods.add(_buildHash());
    return builder.build();
  }
}
