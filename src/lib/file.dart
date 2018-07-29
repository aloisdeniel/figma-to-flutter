
import 'package:dart_style/dart_style.dart';
import 'package:figma_to_flutter/nodes/component.dart';
import 'package:figma_to_flutter/nodes/directive.dart';

import 'base/color.dart';
import 'base/paint.dart';
import 'base/path.dart';
import 'base/text_styles.dart';
import 'nodes/node.dart';
import 'tools/format.dart';
import 'package:code_builder/code_builder.dart';

class FigmaWidgetGenerator {

  ComponentGenerator _component;
  PathGenerator _path;
  NodeGenerator _node;
  dynamic _document;

  FigmaWidgetGenerator(this._document) {
    var color = ColorGenerator();
    _path = PathGenerator();
    _node = NodeGenerator(DirectiveGenerator(), color, PaintGenerator(color), _path, TextStyleGenerator(), ParagraphStyleGenerator());
    _component = ComponentGenerator(_node);
  }

  List<Class> _createDataClasses() {

    List<Class>  result = [];

    // Data
    var builder = ClassBuilder()
      ..name = "Data";
    var constructor = ConstructorBuilder();
    constructor.optionalParameters.add(Parameter((p) => p
        ..name = "this.isVisible"
        ..named = true
        ..toThis));
    builder.fields.add(Field((b) => b
      ..name = "isVisible"
      ..modifier = FieldModifier.final$
      ..type = refer("bool")
    ));
    builder.constructors.add(constructor.build());
    result.add(builder.build());

    // TextData
    builder = ClassBuilder()
      ..name = "TextData"
      ..extend = refer("Data");
    constructor = ConstructorBuilder();
    constructor.optionalParameters.add(Parameter((p) => p
        ..name = "isVisible"
        ..named = true
        ..toThis));
    constructor.optionalParameters.add(Parameter((p) => p
        ..name = "this.text"
        ..named = true
        ..toThis));
    constructor.initializers.add(Code("super(isVisible: isVisible)"));
    builder.fields.add(Field((b) => b
      ..name = "text"
      ..modifier = FieldModifier.final$
      ..type = refer("String")
    ));
    builder.constructors.add(constructor.build());
    result.add(builder.build());

    // VectorData
    builder = ClassBuilder()
      ..name = "VectorData"
      ..extend = refer("Data");
    constructor = ConstructorBuilder();
    constructor.optionalParameters.add(Parameter((p) => p
        ..name = "isVisible"
        ..named = true
        ..toThis));
    constructor.initializers.add(Code("super(isVisible: isVisible)"));
    builder.constructors.add(constructor.build());
    result.add(builder.build());

    return result;
  }

  Library _generateWidgets(Map<String,dynamic> widgets) {
    var classes = <Class>[];
    
    widgets.forEach((k,node) {
      var newClasses = _component.generate(k, node).toList();
      classes.addAll(newClasses);
    });

    /**
     * class Data {
  final bool isVisible;
  Data({this.isVisible});
}

class TextData extends Data {
  final String text;
  TextData({isVisible, this.text}) : super(isVisible: isVisible);
}
     */

    classes.add(_path.buildCatalog());

    classes.addAll(_createDataClasses());

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
          widgets[toClassName(k)] = _findNode(_document["document"], ck);
        }
      });
    });

    var library = _generateWidgets(widgets);
    var emitter = DartEmitter();
      return DartFormatter().format ('${library.accept(emitter)}');
  }
}