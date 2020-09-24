import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/tools/format.dart';
import 'package:path_parsing/path_parsing.dart';

/**
 * A code generator that translates Figma path data 
 * into Flutter [Path] equivalents.
 */
class PathGenerator {
  int _index = 0;
  ClassBuilder _catalog = new ClassBuilder()..name = "_PathCatalog";

  PathGenerator() {}

  Class buildCatalog() {
    var constructorBody = BlockBuilder();

    for (var i = 0; i < _index; i++) {
      _catalog.fields.add(Field((b) => b
        ..name = "path_$i"
        ..type = refer("Path")));
      constructorBody.statements..add(Code("this.path_$i = _build_$i();"));
    }

    _catalog.fields.add(Field((b) => b
      ..name = "instance"
      ..static = true
      ..modifier = FieldModifier.final$
      ..type = refer(_catalog.name)
      ..assignment = Code(_catalog.name + "()")));

    _catalog.constructors
        .add(Constructor((b) => b..body = constructorBody.build()));

    return _catalog.build();
  }

  int _addPath(map) {
    var statement = List<Code>();
    var svg = map["path"] as String;

    if (svg == null) {
      statement = [Code("Path()")];
    } else if (svg == '') {
      statement = [Code("Path()")];
    } else {
      var code = _CodePath(statement);
      writeSvgPathDataToPath(svg, code);
    }
    var method = Method((b) => b
      ..name = "_build_$_index"
      ..static = true
      ..returns = refer("Path")
      ..body = Block((c) => c.statements
        ..add(new Code("var path = Path();"))
        ..addAll(statement)
        ..add(new Code("return path;"))));

    _catalog.methods.add(method);

    _index++;
    return _index - 1;
  }

  Code generate(map) {
    var index = _addPath(map);
    return Code("${_catalog.name}.instance.path_${index}");
  }
}

class _CodePath extends PathProxy {
  final List<Code> statements;

  _CodePath(this.statements);

  @override
  void close() => statements.add(Code("path.close();"));

  @override
  void cubicTo(
          double x1, double y1, double x2, double y2, double x3, double y3) =>
      statements.add(Code(
          "path.cubicTo(${toFixedDouble(x1)}, ${toFixedDouble(y1)}, ${toFixedDouble(
              x2)}, ${toFixedDouble(y2)}, ${toFixedDouble(x3)}, ${toFixedDouble(y3)});"));

  @override
  void lineTo(double x, double y) => statements
      .add(Code("path.lineTo(${toFixedDouble(x)}, ${toFixedDouble(y)});"));

  @override
  void moveTo(double x, double y) => statements
      .add(Code("path.moveTo(${toFixedDouble(x)}, ${toFixedDouble(y)});"));
}
