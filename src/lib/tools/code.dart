import 'package:code_builder/code_builder.dart';

/**
 * Generates hash code and == operator base on a comparison for all [properties].
 * 
 * The algorithm used for hashcode generation looks like :
 * 
 * ```dart
 * int hashcode = 17;
 * hashcode = 37 * hashcode + (this.$x?.hashCode ?? 0);
 * hashcode = 37 * hashcode + (this.$y?.hashCode ?? 0);
 * //...
 * ```
 */
void addEqualsAndHashcode(ClassBuilder builder, List<String> properties) {
  builder.methods.add(Method((b) => b
    ..name = "operator =="
    ..annotations.add(CodeExpression(Code("override")))
    ..lambda = true
    ..returns = refer("bool")
    ..body = Code("o is ${builder.name} && " +
        properties.map((x) => "$x == o.$x").join(" && "))
    ..requiredParameters.add(Parameter((b) => b..name = "o"))));
  builder.methods.add(Method((b) => b
    ..name = "hashcode"
    ..annotations.add(CodeExpression(Code("override")))
    ..returns = refer("int")
    ..type = MethodType.getter
    ..body = Block((b) {
      b.statements.add(Code("int result = 17;"));
      b.statements.addAll(properties.map(
          (x) => Code("result = 37 * result + (this.$x?.hashCode ?? 0);")));
      b.statements.add(Code("return result;"));
      return b;
    })));
}
