import 'package:dart_style/dart_style.dart';
import 'package:figma_to_flutter/base/constraints.dart';
import 'package:figma_to_flutter/base/effect.dart';
import 'package:figma_to_flutter/base/transform.dart';
import 'package:figma_to_flutter/nodes/component.dart';
import 'package:figma_to_flutter/nodes/directive.dart';
import 'package:figma_to_flutter/tools/code.dart';

import 'base/color.dart';
import 'base/paint.dart';
import 'base/path.dart';
import 'base/text_styles.dart';
import 'nodes/node.dart';
import 'tools/format.dart';
import 'package:code_builder/code_builder.dart';

/**
 * The main generator for converting components from a Figma file 
 * to a set of Flutter widgets.
 * 
 * All of the file structure is loaded at instanciation, and widgets
 * can be generated afterwards as needed with [generateComponents].
 */
class FigmaGenerator {
  ComponentGenerator _component;
  ColorGenerator _colors;
  PathGenerator _path;
  PaintGenerator _paint;
  EffectsGenerator _effects;
  TextStyleGenerator _textStyles;
  NodeGenerator _node;
  dynamic _document;

  /**
   * Creates the generator from a [document] Figma file structure.
   */
  FigmaGenerator(this._document) {
    _colors = ColorGenerator();
    _path = PathGenerator();
    _paint = PaintGenerator(_colors);
    _effects = EffectsGenerator(_colors);
    _textStyles = TextStyleGenerator();
    _node = NodeGenerator(
        DirectiveGenerator(),
        TransformGenerator(),
        ConstraintsGenerator(),
        _colors,
        _paint,
        _effects,
        _path,
        _textStyles,
        ParagraphStyleGenerator());
    _component = ComponentGenerator(_node);
  }

  /**
   * Generates Flutter dart code for all of the given [components]. 
   * 
   * The [components] from their name (`value` of a map entry) and generate widgets with 
   * their `key` as class name.
   * 
   * You can add comments generation (mainly for helping debugging and customization) by changing [withComments].
   * 
   * Base data classes ([TextData], [VectorData], ...) generation can be ommited with [withDataClasses]. This is 
   * usefull if you have multiple generated files. If you do so, a [dataClassImport] is added.
   */
  String generateComponents(Map<String, String> components,
      {bool withComments = false,
      bool withDataClasses = true,
      String dataClassImport = "figma_data.dart"}) {
    Map<String, dynamic> widgets = {};

    _document["components"].forEach((ck, cv) {
      components.forEach((k, v) {
        if (cv["name"] == v) {
          widgets[toClassName(k)] = _findNode(_document["document"], ck);
        }
      });
    });

    var library = _generateWidgets(widgets,
        withComments: withComments,
        withDataClasses: withDataClasses,
        dataClassImport: dataClassImport);
    var emitter = DartEmitter();
    var source = '${library.accept(emitter)}';
    try {
      return DartFormatter().format(source);
    } catch (e) {
      throw FigmaFormattingException(e, source);
    }
  }

  /**
   * Generates [Data], [VectorData], [TextData] classes (used
   * by dynamic components) when users wants standalone code, 
   * and wants all its widgets in the same file.
   */
  List<Class> _createDataClasses() {
    List<Class> result = [];

    // Data
    var builder = ClassBuilder()..name = "Data";
    var constructor = ConstructorBuilder();
    constructor.optionalParameters.add(Parameter((p) => p
      ..name = "this.isVisible"
      ..named = true
      ..toThis));
    builder.fields.add(Field((b) => b
      ..name = "isVisible"
      ..modifier = FieldModifier.final$
      ..type = refer("bool")));
    builder.constructors.add(constructor.build());
    addEqualsAndHashcode(builder, ["isVisible"]);
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
      ..type = refer("String")));
    builder.constructors.add(constructor.build());
    addEqualsAndHashcode(builder, ["isVisible", "text"]);
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
    addEqualsAndHashcode(builder, ["isVisible"]);
    result.add(builder.build());

    return result;
  }

  Library _generateWidgets(Map<String, dynamic> widgets,
      {bool withComments = false,
      bool withDataClasses = true,
      String dataClassImport = "figma_data.dart"}) {
    var classes = <Class>[];

    widgets.forEach((k, node) {
      var newClasses =
          _component.generate(k, node, withComments: withComments).toList();
      classes.addAll(newClasses);
    });

    classes.add(_path.buildCatalog());
    classes.add(_paint.catalog.build());
    classes.add(_effects.catalog.build());
    classes.add(_colors.catalog.build());
    classes.add(_textStyles.catalog.build());
    if (withDataClasses) {
      classes.addAll(_createDataClasses());
    }

    return Library((b) => b
      ..directives
          .addAll(!withDataClasses ? Directive.import("dataClassImport") : [])
      ..directives.addAll([
        Directive.import("dart:typed_data"),
        Directive.import("package:flutter/material.dart"),
        Directive.import("dart:ui", as: "ui"),
      ])
      ..body.addAll(classes));
  }

  dynamic _findNode(dynamic map, String id) {
    print("$id => ${map["id"]}");

    if (map["id"] == id) {
      return map;
    }
    var children = map["children"];
    if (children != null) {
      for (var item in children) {
        var found = _findNode(item, id);
        if (found != null) return found;
      }
    }
    return null;
  }
}

class FigmaFormattingException {
  FigmaFormattingException(this.inner, this.code);
  final String code;
  final Exception inner;
}
