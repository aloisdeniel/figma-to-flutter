import 'package:code_builder/code_builder.dart';
import 'package:figma/figma.dart';
import 'package:figma_theme_generator/src/helpers/data_class_builder.dart';
import 'package:meta/meta.dart';
import 'package:recase/recase.dart';

import '../helpers/extensions.dart';
import 'base.dart';
import 'context.dart';

class FileBuilder {
  const FileBuilder();
  void build({
    @required LibraryBuilder library,
    @required String name,
    @required String fallbackConstructorName,
    @required FileResponse response,
  }) {
    final nameFormat = ReCase(name);
    final context = FileBuildContext(
      name: nameFormat.pascalCase,
      fallbackConstructorName: fallbackConstructorName,
      library: library,
      response: response,
    );
    response.styles.forEach((key, style) {
      final node = context.findNodeWithStyle(key);
      if (node != null) {
        switch (node.type) {
          case StyleTypeKey.fill:
            const FillStyleBuilder().build(context, style, node.node);
            break;
          case StyleTypeKey.text:
            if (node.node is Text)
              const TextStyleBuilder().build(context, style, node.node);
            break;
          case StyleTypeKey.effect:
            const EffectBuilder().build(context, style, node.node);
            break;
          default:
        }
      }
    });

    final theme = DataClassBuilder(
      name: '${name}ThemeData',
      fallbackConstructorName: fallbackConstructorName,
    );

    if (context.colors.builder.fields.isNotEmpty) {
      theme.addField(context.colors.builder.name, 'colors',
          '${context.colors.builder.name}.$fallbackConstructorName()');
    }

    if (context.text.builder.fields.isNotEmpty) {
      theme.addField(context.text.builder.name, 'text',
          '${context.text.builder.name}.$fallbackConstructorName()');
    }

    if (context.gradients.builder.fields.isNotEmpty) {
      theme.addField(context.gradients.builder.name, 'gradients',
          '${context.gradients.builder.name}.$fallbackConstructorName()');
    }

    if (context.shadows.builder.fields.isNotEmpty) {
      theme.addField(context.shadows.builder.name, 'shadows',
          '${context.shadows.builder.name}.$fallbackConstructorName()');
    }

    context.library.body.addAll([
      theme.build(false),
      if (context.colors.builder.fields.isNotEmpty) context.colors.build(),
      if (context.text.builder.fields.isNotEmpty) context.text.build(),
      if (context.gradients.builder.fields.isNotEmpty)
        context.gradients.build(),
      if (context.shadows.builder.fields.isNotEmpty) context.shadows.build(),
    ]);

    context.library.directives.addAll([
      Directive.import("package:flutter/widgets.dart"),
      Directive.import(
        "package:collection/collection.dart",
      ),
    ]);

    library.body.add(context.library.build());
  }
}

class FillStyleBuilder {
  const FillStyleBuilder();

  void build(FileBuildContext context, Style style, Node node) {
    final nameFormat = ReCase(style.name);
    final fills = node.extractFills();

    /// Extracting colors
    final colorFills = fills
        .where(
          (x) => x.type == PaintType.solid && x.color != null,
        )
        .toList();
    for (var i = 0; i < colorFills.length; i++) {
      var name = nameFormat.camelCase;
      if (i > 0) name = '$name$i';
      final fill = colorFills[i];
      context.colors.addField(
        'Color',
        name,
        buildColorInstance(fill.color, fill.opacity),
      );
    }

    /// Extracting linear gradients
    final linearGradientFills = fills
        .where(
          (x) => const [
            PaintType.gradientLinear,
            PaintType.gradientAngular,
          ].contains(x.type),
        )
        .toList();
    for (var i = 0; i < linearGradientFills.length; i++) {
      var name = nameFormat.camelCase;
      if (i > 0) name = '$name$i';
      final fill = linearGradientFills[i];
      context.gradients.addField(
        'LinearGradient',
        name,
        buildGradientInstance(fill),
      );
    }
  }
}

class EffectBuilder {
  const EffectBuilder();

  void build(FileBuildContext context, Style style, Node node) {
    final nameFormat = ReCase(style.name);
    final effects = node.extractEffects();

    /// Extracting colors
    final shadowEffects = effects
        .where(
          (x) => x.type == EffectType.dropShadow,
        )
        .toList();
    for (var i = 0; i < shadowEffects.length; i++) {
      var name = nameFormat.camelCase;
      if (i > 0) name = '$name$i';
      final shadowEffect = shadowEffects[i];
      context.shadows.addField(
        'BoxShadow',
        name,
        buildBoxShadowInstance(shadowEffect),
      );
    }
  }
}

class TextStyleBuilder {
  const TextStyleBuilder();
  void build(FileBuildContext context, Style style, Text node) {
    final nameFormat = ReCase(style.name);
    var name = nameFormat.camelCase;

    context.text.addField(
      'TextStyle',
      name,
      buildTextStyleInstance(node.style, node.fills),
    );
  }
}
