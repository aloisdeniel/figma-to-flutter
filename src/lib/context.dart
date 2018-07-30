import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:code_builder/code_builder.dart';
import 'package:figma_to_flutter/tools/code.dart';
import 'package:figma_to_flutter/tools/format.dart' as format;

class DataProperty {
  final String type;
  final String name;
  final String defaultsTo;
  DataProperty(this.type,this.name, this.defaultsTo);
}

class BuildContext {

  List<String> _dataProperties = [];

  dynamic _rootNode;

  ClassBuilder _widget;
  ClassBuilder _customPainter;
  ConstructorBuilder _widgetConstructor;
  ConstructorBuilder _customPainterConstructor;
  BlockBuilder _paintBody;
  List<Code> _childWidgets = [];

  ClassBuilder get widget => _widget;
  ClassBuilder get customPainter => _customPainter;

  BuildContext(componentName, this._rootNode) {
    var widgetName = format.toClassName(componentName);
    _widget = ClassBuilder()
                ..name = widgetName
                ..extend = refer('StatelessWidget');

    _customPainter = ClassBuilder()
                ..name = "${widgetName}Painter"
                ..extend = refer("CustomPainter");

    _paintBody = BlockBuilder();
    _widgetConstructor = ConstructorBuilder();
    _customPainterConstructor = ConstructorBuilder();
  }

  List<double> _toRectangle(dynamic map) {
    var x = map["x"].toDouble();
    var y = map["y"].toDouble();
    var w = map["width"].toDouble();
    var h = map["height"].toDouble();
    return [x,y,w,h];
  }

  BuildContext addChildWidget(String instance, dynamic map) {

    var code = "Positioned(child: $instance,";

    // Position
    var absoluteBoundingBox = _toRectangle(map["absoluteBoundingBox"]);
    var rootAbsoluteBoundingBox = _toRectangle(_rootNode["absoluteBoundingBox"]);
    var left = absoluteBoundingBox[0] - rootAbsoluteBoundingBox[0];
    var top = absoluteBoundingBox[1]  - rootAbsoluteBoundingBox[1];
    var width = absoluteBoundingBox[2];
    var height = absoluteBoundingBox[3];
    var right = rootAbsoluteBoundingBox[2] - (left + width);
    var bottom = rootAbsoluteBoundingBox[3] - (top + height);
    var constraints = map["constraints"];
    var horizontal = constraints["horizontal"];
    var vertical = constraints["vertical"];

    switch(horizontal) {
      case "RIGHT":
        code += "left: $left, width: $width,";
        break;
      case "LEFT_RIGHT":
        code += "left: $left, right: $right,";
        break;
      case "CENTER":
        code += "width: $width, height: $height,"; // TODO
        break;
    }
    
    switch(vertical) {
      case "BOTTOM":
        code += "top: $top, height: $height,";
        break;
      case "TOP_BOTTOM":
        code += "top: $top, bottom: $bottom,";
        break;
      case "CENTER":
        code += "width: $width, height: $height,"; // TODO
        break;
    }
    
    code += ")";
    this._childWidgets.add(Code(code));

    return this;
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

      _customPainter.fields.add(Field((b) => b
        ..name = propertyName
        ..modifier = FieldModifier.final$
        ..type = refer(className)
      ));

      _customPainterConstructor
        ..requiredParameters.add(Parameter((p) => p
        ..name = "this.$propertyName"
        ..named = true));

      // Widget

      this.addWidgetField(className, propertyName, false);
     
      _dataProperties.add(propertyName);

      return this;
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

  BuildContext addWidgetField(String type, String name, bool required) {

    ListBuilder<Parameter> parameters = !required ? _widgetConstructor.optionalParameters : _widgetConstructor.requiredParameters;

    parameters.add(Parameter((p) => p
      ..name = "this.$name"
      ..named = !required
      ..toThis));

    _widget.fields.add(Field((b) => b
      ..name = "$name"
      ..modifier = FieldModifier.final$
      ..type = refer(type)
    ));
    return this;
  }

  Class _buildWidget() {

    _widget.constructors.add(_widgetConstructor.build());

    var body = BlockBuilder();

    var args = _dataProperties.join(", ");
    var customPaint = "CustomPaint(painter: ${_customPainter.name}($args)";

    if(!this._childWidgets.isEmpty) {
      customPaint += ", child: Material(type: MaterialType.transparency, child: Container(child:Stack(children:[";
      customPaint += this._childWidgets.join(", ");
      customPaint += "].where((x) => x != null).toList())))";
    }

    body.statements.add(Code("return $customPaint);"));

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

    var dataComparison = this._dataProperties.map((x) => "oldDelegate.$x != this.$x").join(" || ");

    var shouldRepaint = Method((b) => b
      ..name = "shouldRepaint"
      ..annotations.add(CodeExpression(Code("override")))
      ..returns = refer("bool")
      ..requiredParameters.add(Parameter((b) => b
        ..name = "oldDelegate"
        ..type = refer(_customPainter.name)
      ))
      ..body = Code( _dataProperties.isNotEmpty ? "return $dataComparison;" : "return false;")
    );

    var shouldRebuildSemantics = Method((b) => b
      ..name = "shouldRebuildSemantics"
      ..annotations.add(CodeExpression(Code("override")))
      ..returns = refer("bool")
      ..requiredParameters.add(Parameter((b) => b
        ..name = "oldDelegate"
        ..type = refer(_customPainter.name)
      ))
      ..body = Code("return shouldRepaint(oldDelegate);")
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

    _customPainter.constructors.add(_customPainterConstructor.build());
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

    var widgetClass = _buildWidget();
    result.add(widgetClass);

    var painterClass = _buildCustomPainter();
    result.add(painterClass);

    return result;
  }
}