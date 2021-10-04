import 'package:flutter/material.dart';
import 'package:flutter_figma/flutter_figma.dart';
import 'package:flutter_figma_generator/src/dart/helpers/instance_builder.dart';
import 'package:flutter_figma_generator/src/helpers/naming.dart';
import 'package:rfw/dart/model.dart';
import 'package:collection/collection.dart';

import 'arguments.dart';

abstract class NodeEncoder {
  static String node(BlobNode node) {
    if (node is ConstructorCall) {
      return constructorCall(node);
    }
    if (node is StateReference) {
      return stateReference(node);
    }
    return 'null';
  }

  static String stateReference(StateReference node) {
    return node.parts.join('.');
  }

  static String constructorCall(ConstructorCall node) {
    final builder = InstanceBuilder(node.name);

    void child() {
      final child = node.arguments['child'] as BlobNode?;
      if (child != null) builder.named('child', NodeEncoder.node(child));
    }

    void children() {
      final children = node.arguments['children'] as List?;
      if (children != null) {
        builder.namedList(
          'children',
          [
            ...children.map((child) => NodeEncoder.node(child)),
          ],
        );
      }
    }

    switch (node.name) {
      case 'PathView':
        final geometry = node.arguments['geometry'] as List?;
        if (geometry != null && geometry.isNotEmpty) {
          builder.namedList(
            'geometry',
            [
              ...geometry
                  .map((child) => ArgumentEncoders.geometry(child))
                  .whereNotNull(),
            ],
          );
        }

        final fills = node.arguments['fills'] as List?;
        if (fills != null && fills.isNotEmpty) {
          builder.namedList(
            'fills',
            [
              ...fills
                  .map((child) => ArgumentEncoders.decoration(child))
                  .whereNotNull(),
            ],
          );
        }

        final strokes = node.arguments['strokes'] as List?;
        if (strokes != null && strokes.isNotEmpty) {
          builder.namedList(
            'strokes',
            [
              ...strokes
                  .map((child) => ArgumentEncoders.borderSide(child))
                  .whereNotNull(),
            ],
          );
        }
        break;
      case 'SmoothContainer':
        builder.name = 'Container';
        builder.named(
          'decoration',
          ArgumentEncoders.decoration(node.arguments['decoration']),
        );
        child();
        break;
      case 'Container':
        builder.named(
          'decoration',
          ArgumentEncoders.decoration(node.arguments['decoration']),
        );
        child();
        break;
      case 'ClipRRect':
        builder.named(
          'borderRadius',
          ArgumentEncoders.borderRadius(node.arguments['borderRadius']),
        );
        child();
        break;
      case 'BackdropFilter':
        builder.named(
          'filter',
          ArgumentEncoders.imageFilter(node.arguments['filter']),
        );
        child();
        break;
      case 'Transform':
        builder.named(
          'transform',
          ArgumentEncoders.matrix4(node.arguments['transform']),
        );
        child();
        break;
      case 'Instance':
        final componentName = node.arguments['name'] as String?;
        final properties = node.arguments['variants'] as List?;
        final variantName = FigmaRemote.nameForVariants(
          componentName ?? '(?)',
          {
            if (properties != null)
              for (Map p in properties) p['name']: p['value'],
          },
        );
        builder.name =
            '${componentName?.asClassName()}.${variantName.asVariantClassName().asFieldName()}';

        break;
      case 'Row':
      case 'Column':
        builder.named(
          'mainAxisSize',
          ArgumentEncoders.enumeration<MainAxisSize>(
              node.arguments['mainAxisSize']),
        );
        builder.named(
          'crossAxisAlignment',
          ArgumentEncoders.enumeration<CrossAxisAlignment>(
              node.arguments['crossAxisAlignment']),
        );
        builder.named(
          'mainAxisAlignment',
          ArgumentEncoders.enumeration<MainAxisAlignment>(
              node.arguments['mainAxisAlignment']),
        );
        children();
        break;
      case 'Text':
        builder.positional(
          ArgumentEncoders.string(node.arguments['text']) ?? 'null',
        );
        builder.named(
          'style',
          ArgumentEncoders.textStyle(node.arguments['style']),
        );
        child();
        break;
      case 'Padding':
        builder.named(
          'padding',
          ArgumentEncoders.edgeInsets(node.arguments['padding']),
        );
        child();

        break;
      case 'SizedBox':
        builder.named(
          'width',
          ArgumentEncoders.size(node.arguments['width']),
        );
        builder.named(
          'height',
          ArgumentEncoders.size(node.arguments['height']),
        );
        child();
        break;
      case 'Positioned':
        builder.named(
          'start',
          ArgumentEncoders.size(node.arguments['start']),
        );
        builder.named(
          'end',
          ArgumentEncoders.size(node.arguments['end']),
        );
        builder.named(
          'top',
          ArgumentEncoders.size(node.arguments['top']),
        );
        builder.named(
          'bottom',
          ArgumentEncoders.size(node.arguments['bottom']),
        );
        child();
        break;
      default:
        child();
        children();
        break;
    }

    return builder.build();
  }
}
