import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/tools/format.dart' as format;

class DataProperty {
  final String type;
  final String name;
  final String defaultsTo;
  DataProperty(this.type,this.name, this.defaultsTo);
}

class BuildContext {

  bool _hasData;

  ClassBuilder _widget;
  ClassBuilder _customPainter;
  ClassBuilder _customPainterData;
  ConstructorBuilder _customPainterDataConstructor;
  BlockBuilder _paintBody;

  ClassBuilder get widget => _widget;
  ClassBuilder get customPainter => _customPainter;
  ClassBuilder get customPainterData => _customPainterData;

  BuildContext(componentName) {
    var widgetName = format.toClassName(componentName);
    _widget = ClassBuilder()
                ..name = widgetName
                ..extend = refer('StatelessWidget');

    _customPainter = ClassBuilder()
                ..name = "${widgetName}Painter"
                ..extend = refer("CustomPainter");

    _paintBody = BlockBuilder();

    _customPainterData = ClassBuilder()
                ..name = "${widgetName}Data";

    _customPainterDataConstructor = ConstructorBuilder();
  }

  BuildContext addData(String name, String type) {
      var propertyName = format.toVariableName(name);

      String className;

      switch(type)
      {
        case 'RECT':
        case 'VECTOR':
        case 'ELLIPSE':
        case 'RECTANGLE':
        case 'REGULAR_POLYGON':
        case 'BOOLEAN_OPERATION':
        case 'STAR':
          className = "VectorData";
          break;

        case 'TEXT':
          className = "TextData";
          break;

        default:
          className = "Data";
          break;
      }

      // Painter

      _customPainterData.fields.add(Field((b) => b
        ..name = propertyName
        ..modifier = FieldModifier.final$
        ..type = refer(className)
      ));

      _customPainterDataConstructor
        ..optionalParameters.add(Parameter((p) => p
        ..name = "this.$propertyName"
        ..named = true));
     
      _hasData = true;

      return this;
  }

  Class _buildCustomPainterData() {
    _customPainterData.constructors.add(_customPainterDataConstructor.build());
    return _customPainterData.build();
  }

  BuildContext addPaint(List<String> statements) {
    _paintBody.statements.addAll(statements.map((c) => Code(c)));
    return this;
  }

/**
 *   final LogoData data;

  Logo(this.data);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LogoPainter(data),
    );
  }
 */

  Class _buildWidget() {
    var constructor = ConstructorBuilder();

    if(_hasData) {
      constructor.optionalParameters.add(Parameter((p) => p
        ..name = "this.data"
        ..toThis));

      _widget.fields.add(Field((b) => b
        ..name = "data"
        ..modifier = FieldModifier.final$
        ..type = refer(customPainterData.name)
      ));
    }
    _widget.constructors.add(constructor.build());

    var body = BlockBuilder();

    var args = _hasData ? "data" : "";
    body.statements.add(Code("return CustomPaint(painter: ${_customPainter.name}($args));"));

    var build = Method((b) => b
      ..name = "build"
      ..annotations.add(CodeExpression(Code("override")))
      ..returns = refer("Widget")
      ..requiredParameters.add(Parameter((b) => b
        ..name = "context"
        ..type = refer("BuildContext")
      ))
      ..body = body.build()
    );

    _widget.methods.add(build);

    return _widget.build();
  }

  Class _buildCustomPainter() {
    
    var semanticsBuilder = Method((b) => b
      ..name = "semanticsBuilder"
      ..annotations.add(CodeExpression(Code("override")))
      ..type = MethodType.getter
      ..returns = refer("SemanticsBuilderCallback")
      ..body = Code("return (Size size) => [];")
    );

    var shouldRepaint = Method((b) => b
      ..name = "shouldRepaint"
      ..annotations.add(CodeExpression(Code("override")))
      ..returns = refer("bool")
      ..requiredParameters.add(Parameter((b) => b
        ..name = "oldDelegate"
        ..type = refer(_customPainter.name)
      ))
      ..body = Code("return false;")
    );

    var shouldRebuildSemantics = Method((b) => b
      ..name = "shouldRebuildSemantics"
      ..annotations.add(CodeExpression(Code("override")))
      ..returns = refer("bool")
      ..requiredParameters.add(Parameter((b) => b
        ..name = "oldDelegate"
        ..type = refer(_customPainter.name)
      ))
      ..body = Code("return false;")
    );

    var paint = Method((b) => b
      ..name = 'paint'
      ..annotations.add(CodeExpression(Code("override")))
      ..returns = refer("void")
      ..body = _paintBody.build()
      ..requiredParameters.add(Parameter((p) => p
            ..name="canvas"
            ..type=refer("Canvas")))
      ..requiredParameters.add(Parameter((p) => p
            ..name="size"
            ..type=refer("Size"))));

    var constructor = ConstructorBuilder();

    if(_hasData) {
      constructor.optionalParameters.add(Parameter((p) => p
        ..name = "this.data"
        ..toThis));

      _customPainter.fields.add(Field((b) => b
        ..name = "data"
        ..modifier = FieldModifier.final$
        ..type = refer(customPainterData.name)
      ));
    }

    _customPainter.constructors.add(constructor.build());
    _customPainter.methods.addAll([
        paint, 
        semanticsBuilder,
        shouldRebuildSemantics,
        shouldRepaint,
      ]);
    return _customPainter.build();
  }

  List<Class> build() {
    List<Class> result = [];
    if(_hasData) {
      var dataClass = _buildCustomPainterData();
      result.add(dataClass);
    }
    var widgetClass = _buildWidget();
    result.add(widgetClass);

    var painterClass = _buildCustomPainter();
    result.add(painterClass);

    return result;
  }
}