import 'package:code_builder/code_builder.dart';
import 'package:figma/figma.dart';
import 'package:figma_theme_generator/src/helpers/data_class_builder.dart';
import 'package:meta/meta.dart';

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
    final nameFormat = createClassName(name);
    final context = FileBuildContext(
      name: nameFormat,
      fallbackConstructorName: fallbackConstructorName,
      library: library,
      response: response,
    );
    response.styles.forEach((key, style) {
      final styles = context.findNodeWithStyle(key);
      if (styles.isNotEmpty) {
        for (var node in styles) {
          switch (node.type) {
            case StyleTypeKey.stroke:
              const BorderStyleBuilder().build(context, style, node.node);
              break;
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
      }
    });

    final theme = DataClassBuilder(
      name: '${name}Data',
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

    if (context.borders.builder.fields.isNotEmpty) {
      theme.addField(context.borders.builder.name, 'borders',
          '${context.borders.builder.name}.$fallbackConstructorName()');
    }

    if (context.shadows.builder.fields.isNotEmpty) {
      theme.addField(context.shadows.builder.name, 'shadows',
          '${context.shadows.builder.name}.$fallbackConstructorName()');
    }

    if (context.radius.builder.fields.isNotEmpty) {
      theme.addField(context.radius.builder.name, 'radii',
          '${context.radius.builder.name}.$fallbackConstructorName()');
    }

    context.library.body.addAll([
      theme.build(false),
      if (context.colors.builder.fields.isNotEmpty) context.colors.build(),
      if (context.text.builder.fields.isNotEmpty) context.text.build(),
      if (context.gradients.builder.fields.isNotEmpty)
        context.gradients.build(),
      if (context.borders.builder.fields.isNotEmpty) context.borders.build(),
      if (context.shadows.builder.fields.isNotEmpty) context.shadows.build(),
      if (context.radius.builder.fields.isNotEmpty) context.radius.build(false),
    ]);

    library.body.add(context.library.build());
  }
}

class FillStyleBuilder {
  const FillStyleBuilder();

  void build(FileBuildContext context, Style style, Node node) {
    final nameFormat = createFieldName(style.name);
    final fills = node.extractFills();

    /// Extracting colors
    final colorFills = fills
        .where(
          (x) => x.type == PaintType.solid && x.color != null,
        )
        .toList();
    for (var i = 0; i < colorFills.length; i++) {
      var name = nameFormat;
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
      var name = nameFormat;
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

class BorderStyleBuilder {
  const BorderStyleBuilder();

  void build(FileBuildContext context, Style style, Node node) {
    final nameFormat = createFieldName(style.name);
    final strokes = node.extractStrokes();

    /// Extracting colors
    final colorStrokes = strokes
        .where(
          (x) => x.paint.type == PaintType.solid && x.paint.color != null,
        )
        .toList();
    for (var i = 0; i < colorStrokes.length; i++) {
      var name = nameFormat;
      if (i > 0) name = '$name$i';
      final stroke = colorStrokes[i];
      context.colors.addField(
        'Color',
        name,
        buildColorInstance(stroke.paint.color, stroke.paint.opacity),
      );
      context.borders.addField(
        'BorderSide',
        name,
        buildBorderSideInstance(stroke.paint, stroke.strokeWeight),
      );
      if (stroke.rectangleCornerRadii.isNotEmpty) {
        context.radius.addField(
          'BorderRadius',
          name,
          buildBorderRadiusInstance(stroke.rectangleCornerRadii),
        );
      }
    }
  }
}

class EffectBuilder {
  const EffectBuilder();

  void build(FileBuildContext context, Style style, Node node) {
    final nameFormat = createFieldName(style.name);
    final effects = node.extractEffects();

    /// Extracting colors
    final shadowEffects = effects
        .where(
          (x) => x.type == EffectType.dropShadow,
        )
        .toList();
    for (var i = 0; i < shadowEffects.length; i++) {
      var name = nameFormat;
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
    final name = createFieldName(style.name);

    context.text.addField(
      'TextStyle',
      name,
      buildTextStyleInstance(node.style, node.fills),
    );
  }
}
