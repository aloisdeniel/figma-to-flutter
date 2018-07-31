import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/tools/format.dart';

class CodeCatalog {

  final String name, itemType, prefix;

  CodeCatalog(this.name, this.itemType) : this.prefix = toVariableName(itemType);

  Map<String,String> _catalog = {};

  Code get(String code) {
    var name = "${prefix}_${_catalog.length}";

    if(_catalog.containsKey(code)) {
      name = _catalog[code];
    }
    else {
      _catalog[code] = name;
    }
      
    return Code("${this.name}.instance.${name}");
  }

  Class build() {
    var constructorBody = BlockBuilder();
    var builder = ClassBuilder()
    ..name = this.name;
    _catalog.forEach((k,v) {
      builder.fields.add(Field((b) => b
        ..name = v
        ..type = refer(this.itemType)
      )); 
      constructorBody.statements
        ..add(Code("this.$v = $k;")); 
    });

    builder.fields.add(Field((b) => b
        ..name = "instance"
        ..static = true
        ..modifier = FieldModifier.final$
        ..type = refer(builder.name)
        ..assignment = Code(builder.name + "()")
      ));

    builder.constructors.add(Constructor((b) => b
      ..body = constructorBody.build()
    ));

    return builder.build();
  }
}