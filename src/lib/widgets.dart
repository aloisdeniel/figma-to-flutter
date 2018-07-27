
import 'package:dart_style/dart_style.dart';

import 'base/color.dart';
import 'base/paint.dart';
import 'base/path.dart';
import 'base/text_styles.dart';
import 'nodes/node.dart';
import 'tools/case.dart';
import 'package:code_builder/code_builder.dart';

class _Types {
  static final Reference Bool = refer("bool");
  static final Reference Void = refer("void");
  static final Reference Size = refer("Size");
  static final Reference Canvas = refer("Canvas");
  static final Reference CustomPainter = refer("CustomPainter");
  static final Reference SemanticsBuilderCallback = refer("SemanticsBuilderCallback");
}

class FigmaWidgetGenerator {

  NodeGenerator _node;
  PathGenerator _path;
  dynamic _document;

  FigmaWidgetGenerator(this._document) {
    var color = ColorGenerator();
    _path = PathGenerator();
    _node = new NodeGenerator(color, PaintGenerator(color), _path, TextStyleGenerator(), ParagraphStyleGenerator());
  }

  Method _generatePaint(map) {
    map["constraints"] = {
      "horizontal": "LEFT_RIGHT",
      "vertical": "TOP_BOTTOM",
    };

    var relativeTransform = map["relativeTransform"];
    var vx = -1 * relativeTransform[0][2].toDouble();
    var vy = -1 * relativeTransform[1][2].toDouble();

    var statements = _node.generate(map, map);
    var block = Block((b) => b.statements
                              ..addAll([
                                Code("canvas.drawColor(Colors.transparent, BlendMode.screen);"),
                                Code("var frame = Offset.zero & size;"),
                                Code("canvas.translate($vx, $vy);"),
                              ])
                              ..addAll(statements));

    return Method((b) => b
      ..name = 'paint'
      ..annotations.add(CodeExpression(Code("override")))
      ..returns = _Types.Void
      ..body = block
      ..requiredParameters.add(Parameter((p) => p
            ..name="canvas"
            ..type=_Types.Canvas))
      ..requiredParameters.add(Parameter((p) => p
            ..name="size"
            ..type=_Types.Size)));
  }

  List<String> _addProperties(ClassBuilder builder, dynamic map) {
    
    var result = List<String>();

    if(map["type"] == "TEXT") {
      var varName = toVariableName(map["name"]);
      builder.fields.add(Field((b) => b
        ..name = varName
        ..modifier = FieldModifier.final$
        ..type = refer("String")
      ));
      result.add(varName);
    }
    else {
      var children = map["children"];
      if(children != null) {
        children.forEach((c) {
          result.addAll(_addProperties(builder,c));
        });
      }
    }

    return result;
  }

  Class _generateText(String className, dynamic map) {
    var builder = new ClassBuilder()
      ..name = className + "Text";
    var properties = _addProperties(builder, map);
    var parameters = properties.map((f) => Parameter((p) => p
      ..name = "this.$f"
      ..named = true
    ));
    builder.constructors.add(Constructor((b) => b
      ..optionalParameters.addAll(parameters)
    ));

    if(properties.isEmpty)
      return null;

    return builder.build();
  }

  Class _generateCustomPainter(String className, dynamic map, bool hasText) {
    
    var builder = ClassBuilder();
    
    var semanticsBuilder = Method((b) => b
      ..name = "semanticsBuilder"
      ..annotations.add(CodeExpression(Code("override")))
      ..type = MethodType.getter
      ..returns = _Types.SemanticsBuilderCallback
      ..body = Code("return (Size size) => [];")
    );

    var shouldRepaint = Method((b) => b
      ..name = "shouldRepaint"
      ..annotations.add(CodeExpression(Code("override")))
      ..returns = _Types.Bool
      ..requiredParameters.add(Parameter((b) => b
        ..name = "oldDelegate"
        ..type = refer("${className}Painter")
      ))
      ..body = Code("return false;")
    );

    var shouldRebuildSemantics = Method((b) => b
      ..name = "shouldRebuildSemantics"
      ..annotations.add(CodeExpression(Code("override")))
      ..returns = _Types.Bool
      ..requiredParameters.add(Parameter((b) => b
        ..name = "oldDelegate"
        ..type = refer("${className}Painter")
      ))
      ..body = Code("return false;")
    );

    var constructor = ConstructorBuilder();

    if(hasText) {
      constructor.requiredParameters.add(Parameter((p) => p
        ..name = "this.text"
        ..toThis));

      builder.fields.add(Field((b) => b
        ..name = "text"
        ..modifier = FieldModifier.final$
        ..type = refer("${className}Text")
      ));
    }

    builder
      ..name = "${className}Painter"
      ..extend = _Types.CustomPainter
      ..constructors.add(constructor.build())
      ..methods.addAll([
        _generatePaint(map), 
        semanticsBuilder,
        shouldRepaint,
      ]);

    return builder.build();
  }

  dynamic _find(dynamic node, List<String> selector) {

    if(selector.isEmpty)
      return node;

    if(node == null)
      throw Exception("node is empty");

    var child = node["children"].firstWhere((x) => x["name"] == selector.first);

    if(child == null)
      throw Exception("no children ${selector.first} found");

    if(selector.length == 1)
      return child;

    return _find(child,selector.skip(1).toList());
  }

  Library _generateWidgets(Map<String,dynamic> widgets) {

    var classes = <Class>[];
    
    widgets.forEach((k,node) {
      var text = _generateText(k, node);
      var hasText = (text != null);
      if(hasText) {
        classes.add(text);
      }
      var widget = _generateCustomPainter(k, node, hasText);
      classes.add(widget);
    });

    classes.add(_path.buildCatalog());

    return Library((b) => b
    ..directives.addAll([
      Directive.import("dart:typed_data"),
      Directive.import("package:flutter/material.dart"),
      Directive.import("dart:ui", as: "ui"),
    ])
    ..body.addAll(classes));
  }

  dynamic _findNode(dynamic map, String id) {
    print("$id => ${map["id"]}");

    if(map["id"] == id) {
      return map;
    }
    var children = map["children"];
    if(children != null) {
      for (var item in children) {
        var found = _findNode(item, id);
        if(found != null)
          return found;
      }
    }
    return null;
  }
  
  String generateComponents(Map<String,String> components) {
    Map<String,dynamic> widgets = {};

    _document["components"].forEach((ck,cv) {
      components.forEach((k,v) {
        if(cv["name"] == v) {
          widgets[k] = _findNode(_document["document"], ck);
        }
      });
    });

    var library = _generateWidgets(widgets);
    var emitter = DartEmitter();
      return DartFormatter().format ('${library.accept(emitter)}');
  }
}