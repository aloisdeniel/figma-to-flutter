abstract class ValueBuilder {
  const ValueBuilder();
  String build([int level = 0]);
}

class InstanceBuilder extends ValueBuilder {
  final String name;
  final List<ArgumentsBuilder> arguments;
  const InstanceBuilder(this.name, this.arguments);
  @override
  String build([int level = 0]) {
    final result = StringBuffer();
    result.write(name);
    result.write('(');
    for (var argument in arguments) {
      final childLevel = level + 1;
      for (var i = 0; i < childLevel; i++) {
        result.write('  ');
      }
      result.write(argument.build(childLevel));
      result.write(',');
    }
    if (arguments.isNotEmpty) {
      for (var i = 0; i < level; i++) {
        result.write('  ');
      }
      result.writeln();
    }
    result.write(')');
    return result.toString();
  }
}

abstract class ArgumentsBuilder {
  const ArgumentsBuilder();
  String build([int level]);
}

class RequiredArgument extends ArgumentsBuilder {
  final ValueBuilder value;
  RequiredArgument(Object value)
      : value = value is ValueBuilder ? value : ConstantBuilder(value);

  @override
  String build([int level = 0]) {
    return value.build();
  }
}

class NamedArgument extends ArgumentsBuilder {
  final String name;
  final ValueBuilder value;
  NamedArgument(this.name, Object value)
      : value = value is ValueBuilder ? value : ConstantBuilder(value);

  @override
  String build([int level]) {
    return '$name: ${value.build()}';
  }
}

class ListValueBuilder extends ValueBuilder {
  final List<ValueBuilder> values;
  const ListValueBuilder(this.values);

  @override
  String build([int level = 0]) {
    final result = StringBuffer();
    result.write('(');
    for (var value in values) {
      final childLevel = level + 1;
      for (var i = 0; i < childLevel; i++) {
        result.write('  ');
      }
      result.write(value.build(childLevel));
      result.write(',');
    }
    if (values.isNotEmpty) {
      for (var i = 0; i < level; i++) {
        result.write('  ');
      }
      result.writeln();
    }
    result.write(']');
    return result.toString();
  }
}

class ConstantBuilder extends ValueBuilder {
  final Object value;
  const ConstantBuilder(this.value);

  @override
  String build([int level = 0]) {
    final value = this.value;

    if (value == null) {
      return 'null';
    }

    if (value is String) {
      return "'$value'";
    }

    return value?.toString();
  }
}

class RawValueBuilder extends ValueBuilder {
  final String value;
  const RawValueBuilder(this.value);

  @override
  String build([int level = 0]) {
    return value?.toString();
  }
}
